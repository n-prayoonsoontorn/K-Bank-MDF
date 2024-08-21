# Databricks notebook source
# MAGIC %md ###widgets

# COMMAND ----------

# Create a text widget for the "area" parameter
dbutils.widgets.text("area", "", "Area Name")

# COMMAND ----------

# MAGIC %md ###Function

# COMMAND ----------

import os
import pytz
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, regexp_extract
from pyspark.sql.functions import lit, concat, col
from datetime import datetime

# COMMAND ----------

# MAGIC %md ###Variables

# COMMAND ----------

area = 'fcd'
env = os.environ["ENVIRONMENT"]
env_name = f"mdp{env}"
print(env_name)

# COMMAND ----------

# MAGIC %md ##Check Files in Volumes

# COMMAND ----------

# MAGIC %md ###ingest spec

# COMMAND ----------

# Get the directory path
volume_path = f"/Volumes/mdp{env}/artifact/mapping/mdp/ingest/"
directory_path = os.path.join(volume_path, area)

# List files in the specified directory
file_paths = dbutils.fs.ls(directory_path)

# Extract the JSON file names from the file paths
json_file_names = [os.path.basename(file_info.path) for file_info in file_paths if file_info.path.endswith('.json')]

# Create a DataFrame with "config job directory path" and "json file name" columns
file_paths_df = spark.createDataFrame(zip([file_info.path for file_info in file_paths], json_file_names), ["ingest spec directory path", "spec file name"])

# Get the total count of files
file_count = len(file_paths)

# Print the total count of files
print(f"Total Files in '{directory_path}': {file_count}")

# Display the file paths as a table
display(file_paths_df)

# COMMAND ----------

# MAGIC %md ###json config

# COMMAND ----------

# Get the directory path
volume_path = f"/Volumes/mdp{env}/artifact/config/mdp/ingest/"
directory_path = os.path.join(volume_path, area)

# List files in the specified directory
file_paths = dbutils.fs.ls(directory_path)

# Extract the JSON file names from the file paths
json_file_names = [os.path.basename(file_info.path) for file_info in file_paths if file_info.path.endswith('.json')]

# Create a DataFrame with "config job directory path" and "json file name" columns
file_paths_df = spark.createDataFrame(zip([file_info.path for file_info in file_paths], json_file_names), ["config job directory path", "config file name"])

# Get the total count of files
file_count = len(file_paths)

# Print the total count of files
print(f"Total Files in '{directory_path}': {file_count}")

# Display the file paths as a table
display(file_paths_df)


# COMMAND ----------

# MAGIC %md ###audit config

# COMMAND ----------

# Get the directory path
volume_path = f"/Volumes/mdp{env}/artifact/config/mdp/audit/ingest/"
directory_path = os.path.join(volume_path, area)

# List files in the specified directory
file_paths = dbutils.fs.ls(directory_path)

# Extract the JSON file names from the file paths
json_file_names = [os.path.basename(file_info.path) for file_info in file_paths if file_info.path.endswith('.json')]

# Create a DataFrame with "config job directory path" and "json file name" columns
file_paths_df = spark.createDataFrame(zip([file_info.path for file_info in file_paths], json_file_names), ["audit directory path", "audit file name"])

# Get the total count of files
file_count = len(file_paths)

# Print the total count of files
print(f"Total Files in '{directory_path}': {file_count}")

# Display the file paths as a table
display(file_paths_df)


# COMMAND ----------

# MAGIC %md ##Created Database

# COMMAND ----------

# MAGIC %md ###Raw

# COMMAND ----------

# Create a Spark session
spark = SparkSession.builder.appName("CheckDatabase").getOrCreate()

# Define the catalog and the database you want to check
catalog_name = f"mdp{env}"
database_name = f"raw_{area}"

# Show the list of databases in the specified catalog
existing_databases = spark.sql(f"SHOW DATABASES IN {catalog_name}")

# Check if the specified database exists
database_exists = existing_databases.filter(existing_databases["databaseName"] == database_name).count() > 0

# Print the result
if database_exists:
    print(f"The database '{database_name}' exists in the catalog '{catalog_name}'.")
else:
    print(f"The database '{database_name}' does not exist in the catalog '{catalog_name}'.")

# COMMAND ----------

# MAGIC %md ###Persist

# COMMAND ----------

# Create a Spark session
spark = SparkSession.builder.appName("CheckDatabase").getOrCreate()

# Define the catalog and the database you want to check
catalog_name = f"mdp{env}"
database_name = f"persist_{area}"

# Show the list of databases in the specified catalog
existing_databases = spark.sql(f"SHOW DATABASES IN {catalog_name}")

# Check if the specified database exists
database_exists = existing_databases.filter(existing_databases["databaseName"] == database_name).count() > 0

# Print the result
if database_exists:
    print(f"The database '{database_name}' exists in the catalog '{catalog_name}'.")
else:
    print(f"The database '{database_name}' does not exist in the catalog '{catalog_name}'.")

# COMMAND ----------

# MAGIC %md ##Created Table

# COMMAND ----------

# MAGIC %md ###Raw

# COMMAND ----------

# List of database name
database_list = [f"mdp{env}.raw_{area}"]
err_schm = []

for idx, database_name in enumerate(database_list):
    try:
        new_tbl_df = (
            spark.sql(f"SHOW TABLES IN {database_name}")
            .withColumn("DATABASE", lit(database_name))
            .withColumnRenamed("tableName", "TABLE_NAME")
            .withColumn("FULL_TABLE_NAME", concat(col("DATABASE"), lit("."), col("TABLE_NAME")))
            .select("DATABASE", "TABLE_NAME", "FULL_TABLE_NAME")
        )
        
        # Count the number of tables in the current database
        table_count = new_tbl_df.count()

        if idx == 0:
            all_tables_df = new_tbl_df
        else:
            all_tables_df = all_tables_df.union(new_tbl_df)
        
        # Print the count of tables for the current database
        print(f"Number of tables in {database_name}: {table_count}")

    except Exception as e:
        err_schm.append(f"{database_name}: {str(e)}")
        pass

if "all_tables_df" in locals():
    # Display the combined DataFrame
    display(all_tables_df)
else:
    print("Database not found:", ", ".join(err_schm))

# COMMAND ----------

# MAGIC %md ###Persist

# COMMAND ----------

# List of database name
database_list = [f"mdp{env}.persist_{area}"]
err_schm = []

for idx, database_name in enumerate(database_list):
    try:
        new_tbl_df = (
            spark.sql(f"SHOW TABLES IN {database_name}")
            .withColumn("DATABASE", lit(database_name))
            .withColumnRenamed("tableName", "TABLE_NAME")
            .withColumn("FULL_TABLE_NAME", concat(col("DATABASE"), lit("."), col("TABLE_NAME")))
            .select("DATABASE", "TABLE_NAME", "FULL_TABLE_NAME")
        )
        
        # Count the number of tables in the current database
        table_count = new_tbl_df.count()

        if idx == 0:
            all_tables_df = new_tbl_df
        else:
            all_tables_df = all_tables_df.union(new_tbl_df)
        
        # Print the count of tables for the current database
        print(f"Number of tables in {database_name}: {table_count}")

    except Exception as e:
        err_schm.append(f"{database_name}: {str(e)}")
        pass

if "all_tables_df" in locals():
    # Display the combined DataFrame
    display(all_tables_df)
else:
    print("Database not found:", ", ".join(err_schm))

# COMMAND ----------

# MAGIC %md ###Compare Matching Column Name

# COMMAND ----------

from pyspark.sql import SparkSession
from pyspark.sql.functions import lit, col, concat, when

# Initialize SparkSession
spark = SparkSession.builder \
    .appName("Table Comparison") \
    .getOrCreate()

# List of raw and persist database names
raw_database_list = [f"mdp{env}.raw_{area}"]
persist_database_list = [f"mdp{env}.persist_{area}"]

# Function to retrieve unique table names from a database
def get_unique_table_names(database_list):
    unique_tables = []
    for database_name in database_list:
        tables_df = spark.sql(f"SHOW TABLES IN {database_name}")
        table_names = tables_df.select("tableName").distinct().collect()
        unique_tables.extend([row["tableName"] for row in table_names])
    return unique_tables

# Get unique table names from raw and persist zones
raw_tables = get_unique_table_names(raw_database_list)
persist_tables = get_unique_table_names(persist_database_list)

# Exclude raw_tables and persist_tables from comparison
raw_tables = [table for table in raw_tables if table not in ['raw_tables', 'persist_tables']]
persist_tables = [table for table in persist_tables if table not in ['raw_tables', 'persist_tables']]

# Function to compare tables between raw and persist zones
def compare_tables(raw_tables, persist_tables):
    comparison_results = []
    for raw_table in raw_tables:
        if raw_table in persist_tables:
            comparison_results.append((raw_table, raw_table, "matched"))
    return comparison_results

# Perform table comparison
comparison_results = compare_tables(raw_tables, persist_tables)

# Get the count of tables in each zone
raw_table_count = len(raw_tables)
persist_table_count = len(persist_tables)

# Display the count of tables in each zone
print(f"Number of tables in raw zone: {raw_table_count}")
print(f"Number of tables in persist zone: {persist_table_count}")

# Display the comparison results
comparison_df = spark.createDataFrame(comparison_results, ["raw_table_name", "persist_table_name", "matching_table_name"])
comparison_df.display(truncate=False)

# COMMAND ----------


# MAGIC %md ###Check Config Files Updated in Volumes BSL 32(Phase 2 lot 1)

# COMMAND ----------

# Get the directory path
volume_path = f"/Volumes/mdp{env}/artifact/config/mdp/ingest/"
directory_path = os.path.join(volume_path, area)

# Define datetime for 
epoch_time = 1722772800 # Sunday, August 4, 2024 7:00:00 PM GMT+07:00
epoch_time_for_ls = epoch_time * 1000
timezone = pytz.timezone('Asia/Bangkok')
datetime_str = datetime.strftime(datetime.fromtimestamp(epoch_time,tz=timezone),"%Y-%m-%d %H:%M:%S")

expected_config_list = """job_config_ingest_fcd_fcdglsc_d.json""".split("\n")
print(f"Expected updated list: {expected_config_list}\n")



file_paths = [x for x in dbutils.fs.ls(directory_path) if x.modificationTime > epoch_time_for_ls and x.name in expected_config_list]
if not file_paths:
    print(f"No updated job configuration after: {datetime_str}")
else:
    # Extract the JSON file names from the file paths
    json_file_names = [os.path.basename(file_info.path) for file_info in file_paths if file_info.path.endswith('.json')]

    # Create a DataFrame with "config job directory path" and "json file name" columns
    file_paths_df = spark.createDataFrame(zip([file_info.path for file_info in file_paths], json_file_names), ["config job directory path", "config file name"])

    # Get the total count of files
    file_count = len(file_paths)

    # Print the total count of files
    print(f"Update time after: {datetime_str} - Total Files in '{directory_path}': {file_count}")

    # Display the file paths as a table
    display(file_paths_df)

# COMMAND ----------

# MAGIC %md ###Check Spec mapping Files Updated in Volumes BSL 32(Phase 2 lot 1)

# COMMAND ----------

# Get the directory path
volume_path = f"/Volumes/mdp{env}/artifact/mapping/mdp/ingest/"
directory_path = os.path.join(volume_path, area)

# Define datetime for 
epoch_time = 1722772800 # Sunday, August 4, 2024 12:00:00 PM
epoch_time_for_ls = epoch_time * 1000
timezone = pytz.timezone('Asia/Bangkok')
datetime_str = datetime.strftime(datetime.fromtimestamp(epoch_time,tz=timezone),"%Y-%m-%d %H:%M:%S")

expected_spec_mapping_list = """ingest_spec_fcd_fcdglsc.json
ingest_spec_fcd_trn""".split("\n")

print(f"Expected updated list: {expected_spec_mapping_list}\n")

file_paths = [x for x in dbutils.fs.ls(directory_path) if x.modificationTime > epoch_time_for_ls and x.name in expected_spec_mapping_list]
if not file_paths:
    print(f"No updated spec mapping after: {datetime_str}")
else:
    # Extract the JSON file names from the file paths
    json_file_names = [os.path.basename(file_info.path) for file_info in file_paths if file_info.path.endswith('.json')]

    # Create a DataFrame with "Spec mapping directory path" and "json file name" columns
    file_paths_df = spark.createDataFrame(zip([file_info.path for file_info in file_paths], json_file_names), ["spec mapping directory path", "spec mapping file name"])

    # Get the total count of files
    file_count = len(file_paths)

    # Print the total count of files
    print(f"Update time after: {datetime_str} - Total Files in '{directory_path}': {file_count}")

    # Display the file paths as a table
    display(file_paths_df)
    
    
# COMMAND ----------

# MAGIC %md ###Check Audit Files Updated in Volumes BSL 32(Phase 2 lot 1)

# COMMAND ----------

# Get the directory path
volume_path = f"/Volumes/mdp{env}/artifact/config/mdp/audit/ingest/"
directory_path = os.path.join(volume_path, area)

# Define datetime for 
epoch_time = 1722772800 # Sunday, August 4, 2024 12:00:00 PM
epoch_time_for_ls = epoch_time * 1000
timezone = pytz.timezone('Asia/Bangkok')
datetime_str = datetime.strftime(datetime.fromtimestamp(epoch_time,tz=timezone),"%Y-%m-%d %H:%M:%S")

expected_spec_mapping_list = """audit_config_persist_fcd_fcd_fcdglsc.json
audit_config_persist_fcd_fcd_trn""".split("\n")

print(f"Expected updated list: {expected_spec_mapping_list}\n")

file_paths = [x for x in dbutils.fs.ls(directory_path) if x.modificationTime > epoch_time_for_ls and x.name in expected_spec_mapping_list]
if not file_paths:
    print(f"No updated audit config on after: {datetime_str}")
else:
    # Extract the JSON file names from the file paths
    json_file_names = [os.path.basename(file_info.path) for file_info in file_paths if file_info.path.endswith('.json')]

    # Create a DataFrame with "Audit config directory path" and "json file name" columns
    file_paths_df = spark.createDataFrame(zip([file_info.path for file_info in file_paths], json_file_names), ["Audit config directory path", "Audit config file name"])

    # Get the total count of files
    file_count = len(file_paths)

    # Print the total count of files
    print(f"Update time after: {datetime_str} - Total Files in '{directory_path}': {file_count}")

    # Display the file paths as a table
    display(file_paths_df)

