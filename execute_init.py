#Databricks notebook source
!pip install databricks-sdk==0.12.0

# COMMAND ----------

# MAGIC %md ### Import Libraries

# COMMAND ----------

import os
import time
from pyspark.sql import DataFrame
from pyspark.sql import Row

# COMMAND ----------

# MAGIC %md ### Environment configs

# COMMAND ----------

env = os.environ['ENVIRONMENT']
catalog = f"mdp{env}" # To be replaced with os.environ["CATALOG"]
print("Environment Information")
print("env:",env)
print("catalog:",catalog)

# COMMAND ----------

# MAGIC %md ### Execution Function

# COMMAND ----------

from databricks.sdk import WorkspaceClient
from databricks.sdk.service import jobs
from databricks.sdk.service import workspace
        # Get Workspace URL & Token
api_token = (
    dbutils.notebook.entry_point.getDbutils().notebook().getContext().apiToken().getOrElse(None)
)
databricksURL = (
    dbutils.notebook.entry_point.getDbutils().notebook().getContext().apiUrl().getOrElse(None)
)
# Databricks SDK
wspc = WorkspaceClient(host=databricksURL, token=api_token)

print("API token: ", api_token)
print("Databricks URL", databricksURL)
cluster_id = spark.conf.get("spark.databricks.clusterUsageTags.clusterId")

# COMMAND ----------

source_sys = "fcd"
notebook_paths = [
    f"{source_sys}/raw/",
    f"{source_sys}/persist/"
]
base_path = "/ddl/mdp/tbl_init/ingest/"
storage_raw = f"raw@stmdpsea{env}raw001.dfs.core.windows.net"
storage_persist = f"persist@stmdpsea{env}per001.dfs.core.windows.net"

# COMMAND ----------

def submit_run(notebook_path,file_name,base_parameters):
    run = wspc.jobs.submit(
        run_name=f'execute-init-{file_name}-{time.time_ns()}',
        tasks=[
            jobs.SubmitTask(
                existing_cluster_id=cluster_id,
                notebook_task=jobs.NotebookTask(notebook_path=notebook_path, base_parameters=base_parameters),
                task_key=f'execute-init-{file_name}-{time.time_ns()}'
            )
        ]
    )
    run_id = run.run_id
    get_run_rslt = wspc.jobs.get_run(run_id).as_dict()
    return get_run_rslt

def run_notebooks(notebook_path,param_dict):
    count = 0
    max_concurrent_runs = 40
    cnt_concurrent = 0
    run_id_dict = {}
    for filename in os.listdir("/Workspace"+notebook_path):
        try:
            get_run_rslt = submit_run(notebook_path+filename, filename, param_dict)
            cnt_concurrent = cnt_concurrent + 1
            run_id_dict[filename] = get_run_rslt['run_id']
            print(f"Notebook executed succesfully: {notebook_path}{filename}")
        except Exception as e:
            print(f"Error executing notebook {notebook_path}{filename}: {e}")
        count = count + 1
        if cnt_concurrent == max_concurrent_runs:
            time.sleep(180)
            cnt_concurrent = 0
    print("Number of notebook executed: ",count)
    return run_id_dict

# COMMAND ----------

# MAGIC %md ###0) execute raw & persist database

# COMMAND ----------

db_raw_path = f"/Workspace/ddl/mdp/db_init/ingest/{source_sys}/db_init_raw_{source_sys}"
param_dict = dict({"storage_raw":storage_raw,"catalog":catalog})
dbutils.notebook.run(db_raw_path,300,param_dict)

# COMMAND ----------

db_persist_path = f"/Workspace/ddl/mdp/db_init/ingest/{source_sys}/db_init_persist_{source_sys}"
param_dict = dict({"storage_persist":storage_persist,"catalog":catalog})
dbutils.notebook.run(db_persist_path,300,param_dict)

# COMMAND ----------

# MAGIC %md ###1) execute raw table

# COMMAND ----------

print("Create Table Raw zone")
param_dict = dict({"storage_raw":storage_raw,"catalog":catalog})
for path in notebook_paths:
    if 'raw' in path.lower():
        full_path = base_path+path
        raw_run_id_dict = run_notebooks(full_path,param_dict)
time.sleep(120)

# COMMAND ----------

raw_run_info = []
for table_init_name,run_id in raw_run_id_dict.items():
    run_info = wspc.jobs.get_run(run_id).as_dict()
    if run_info['state']['life_cycle_state'] != 'RUNNING':
        raw_run_info.append(Row(table_init_name=table_init_name, run_id=run_id, status=run_info['state']['result_state'], run_url=run_info['run_page_url']))
    else:
        raw_run_info.append(Row(table_init_name=table_init_name, run_id=run_id, status=run_info['state']['life_cycle_state'], run_url=run_info['run_page_url']))
raw_df = spark.createDataFrame(raw_run_info)
raw_df.display()

# COMMAND ----------

raw_df.filter('status ="FAILED"').display()

# COMMAND ----------

# MAGIC %md ###2) execute persist table

# COMMAND ----------

print("Create Table Persist zone")
param_dict = dict({"storage_persist":storage_persist,"catalog":catalog})
for path in notebook_paths:
    if 'raw' not in path.lower():
        full_path = base_path+path
        persist_run_id_dict = run_notebooks(full_path,param_dict)
time.sleep(120)

# COMMAND ----------

persist_run_info = []
for table_init_name,run_id in persist_run_id_dict.items():
    run_info = wspc.jobs.get_run(run_id).as_dict()
    if run_info['state']['life_cycle_state'] != 'RUNNING':
        persist_run_info.append(Row(table_init_name=table_init_name, run_id=run_id, status=run_info['state']['result_state'], run_url=run_info['run_page_url']))
    else:
        persist_run_info.append(Row(table_init_name=table_init_name, run_id=run_id, status=run_info['state']['life_cycle_state'], run_url=run_info['run_page_url']))
persist_df = spark.createDataFrame(persist_run_info)
persist_df.display()

# COMMAND ----------

persist_df.filter('status ="FAILED"').display()

# COMMAND ----------

dbutils.notebook.exit("SUCCESS")