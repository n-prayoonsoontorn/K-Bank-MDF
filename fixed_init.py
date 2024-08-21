#Databricks notebook source
!pip install databricks-sdk==0.12.0

# COMMAND ----------

# MAGIC %md ### Import Libraries

# COMMAND ----------

import os
from pyspark.sql.functions import col

# COMMAND ----------

# MAGIC %md ### Environment configs

# COMMAND ----------

env = os.environ['ENVIRONMENT']
raw_base_path = f"abfss://raw@stmdpsea{env}raw001.dfs.core.windows.net/mdp{env}"
persist_base_path = f"abfss://persist@stmdpsea{env}per001.dfs.core.windows.net/mdp{env}"

src_sys = "sfv" ## name of source system
raw_table_list = ['sfv_mnul_lpm_watch_list']
persist_table_list = ['sfv_mnul_lpm_watch_list']

undelete_raw_storage_list = []
undelete_raw_table_list = []
for table_name in raw_table_list:
    try:
        dbutils.fs.rm(f"{raw_base_path}/raw_{src_sys}/{table_name}",True)
        print(f"remove successfully: {table_name}")
    except:
        undelete_raw_storage_list.append(table_name)
    try:
        spark.sql(f"DROP TABLE IF EXISTS mdp{env}.raw_{src_sys}.{table_name}")
        print(f"drop successfully: {table_name}")
    except:
        undelete_raw_table_list.append(table_name)

undelete_persist_storage_list = []
undelete_persist_table_list = []
for table_name in persist_table_list:
    try:
        dbutils.fs.rm(f"{persist_base_path}/persist_{src_sys}/{table_name}",True)
        print(f"remove successfully: {table_name}")
    except:
        undelete_persist_storage_list.append(table_name)
    try:
        spark.sql(f"DROP TABLE IF EXISTS mdp{env}.persist_{src_sys}.{table_name}")
        print(f"drop successfully: {table_name}")
    except:
        undelete_persist_table_list.append(table_name)

undelete_raw_storage_list,undelete_raw_table_list,undelete_persist_storage_list,undelete_persist_table_list