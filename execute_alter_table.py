# Databricks notebook source
# MAGIC %md 
# MAGIC ### Import Libraries

# COMMAND ----------

import os
from pyspark.sql.functions import col, expr

# COMMAND ----------

# MAGIC %md ### Environment configs

# COMMAND ----------

env = os.environ["ENVIRONMENT"]
catalog = f"mdp{env}" 
print("Environment Information")
print("env:", env)
print("catalog:", catalog)
partition_list = ['ptn_yyyy','ptn_mm','ptn_dd']

# COMMAND ----------

table_name = 'sfv_mnul_lst_hol_wknd_dt'
table_df = spark.table(f"{catalog}.persist_sfv.{table_name}")

alter_sql_persist  = f"""
ALTER TABLE {catalog}.persist_sfv.{table_name}
ALTER COLUMN holiday COMMENT 'Def(En): Holiday Date\nDef(Th): วันที่ของวันหยุดนักขัตฤกษ์'
"""

alter_sql_raw  = f"""
ALTER TABLE {catalog}.raw_sfv.{table_name}
ALTER COLUMN holiday COMMENT 'Def(En): Holiday Date\nDef(Th): วันที่ของวันหยุดนักขัตฤกษ์'
"""

spark.sql(alter_sql_persist)
spark.sql(alter_sql_raw)
print("Column 'holiday' comment updated successfully.")


# COMMAND ----------

dbutils.notebook.exit("SUCCESS")
