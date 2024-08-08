# Databricks notebook source
# %pip install openpyxl

# COMMAND ----------

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, isnan
from pyspark.sql import DataFrame
from databricks.sdk import WorkspaceClient
from databricks.sdk.service import workspace
from datetime import datetime
import openpyxl
import json
import pandas as pd
import base64


# Information from Environment
DOMAIN_URL = spark.conf.get("spark.databricks.workspaceUrl")

# Get Workspace URL & Token
api_token = (
    dbutils.notebook.entry_point.getDbutils()
    .notebook()
    .getContext()
    .apiToken()
    .getOrElse(None)
)
databricksURL = (
    dbutils.notebook.entry_point.getDbutils()
    .notebook()
    .getContext()
    .apiUrl()
    .getOrElse(None)
)

# Databricks SDK
wspc = WorkspaceClient(host=databricksURL, token=api_token)

def get_target_from_cbr(cbr_path: str, sheet_nm: str) -> (str, str,str,str):
    # target_pd = pd.read_excel(
    #     cbr_path, sheet_name=sheet_nm, header=None, skiprows=0, usecols="I:I", nrows=2, dtype=str
        
    # )
    target_pd = pd.read_excel(cbr_path, sheet_name=sheet_nm, header=None, dtype=str)

    target_table = target_pd.iloc[10, 8].strip()
    target_view = target_pd.iloc[7, 8].strip()
    schema_table = target_pd.iloc[9, 8].strip()
    schema_view = target_pd.iloc[8, 8].strip()
    

    print("target_table :"+target_table)
    print("target_view :"+target_view)
    print("schema_table :"+schema_table)
    print("schema_view :"+schema_view)


    return target_table, target_view,schema_table,schema_view

def get_subject_area_from_cbr(cbr_path: str, sheet_nm: str) -> str:
    # subject_area_pd = pd.read_excel(
    #     cbr_path, sheet_name=sheet_nm, header=None, skiprows=17, usecols="O:O", nrows=1, dtype=str
    # )
    # subject_area = subject_area_pd.iloc[0, 0].strip()
    
    area_pos = pd.read_excel(cbr_path, sheet_name=sheet_nm, header=None, dtype=str)
    subject_area = area_pos.iloc[3, 1].lower()
    return subject_area

def get_curated_cbr(cbr_path: str, sheet_nm: str) -> DataFrame:
    """
    Read an Ingest CBR file and process it to return a DataFrame with selected columns.

    Args:
        cbr_path (str): The file path to the CBR.

    Returns:
        DataFrame: A DataFrame containing selected columns from the curated CBR.
    """

    ##Columns name -> view_columns
    ##Columns name.1 -> target_columns
    select_col = [
        "T Seq.",
        "Column Name",
        "Column Name.1",
        "RBAC Data Element",
    ]
    
 
    # cbr_pd = pd.read_excel(cbr_path, sheet_name=sheet_nm, skiprows=28, usecols="K:U",dtype=str)
    cbr_pd = pd.read_excel(cbr_path, sheet_name=sheet_nm, skiprows=28,dtype=str)


   
   # Remove spaces from selected columns
    for col_name in select_col:
        # Remove leading and trailing spaces from column names
        col_name = col_name.strip()
        # col_name = col_name

        
        # Check if the column exists in the DataFrame
        if col_name in cbr_pd.columns:
            # Apply .str.strip() to the column using the .apply method
            cbr_pd[col_name] = cbr_pd[col_name].apply(lambda x: x.strip() if isinstance(x, str) else x)
        else:
            print(f"Column '{col_name}' not found in DataFrame.")



  
    # Filter rows with non-null Seq column
    cbr_pd = cbr_pd[cbr_pd["T Seq."].notnull()]
    

    # Get the index of the last row starting with "TABLE" prefix
    cbr_pd["index"] = range(1, len(cbr_pd) + 1)
    cbr_indx_pd = cbr_pd[cbr_pd["T Seq."].str.upper().str.startswith("TABLE")].loc[:, ["index"]]
    cnt_cbr_indx = cbr_indx_pd.shape[0]

    if cnt_cbr_indx > 1:
        cbr_indx = cbr_indx_pd.iloc[1, 0] - 1
    else:
        cbr_indx = len(cbr_pd)

    # Limit the DataFrame to the rows before the "TABLE" prefix
    ltst_cbr_pd = cbr_pd.iloc[:cbr_indx]
    ltst_cbr_pd = ltst_cbr_pd[~ltst_cbr_pd["T Seq."].str.upper().str.startswith("TABLE")]
    ltst_cbr_pd = ltst_cbr_pd.loc[:, select_col]

    ltst_cbr_spark = spark.createDataFrame(ltst_cbr_pd)

    return ltst_cbr_spark

def create_folder(wspc: WorkspaceClient, path: str) -> None:
    wspc.workspace.mkdirs(path=path)
    print(f"Created folder: {path}")

def convert_to_base64(content: str) -> str:
    content_bytes = content.encode("ascii")
    base64_bytes = base64.b64encode(content_bytes)
    base64_content = base64_bytes.decode("ascii")
    return base64_content

def create_init_script_notebook(wspc: WorkspaceClient, content: str, path: str) -> None:
    wspc.workspace.import_(
        content=convert_to_base64(content),
        # format=workspace.ExportFormat.HTML,
        language=workspace.Language.SQL,
        overwrite=True,
        path=path,
    )
    print(f"Generated init script: {path.split('/')[-1]}")


def get_c1(exname:str,name: str, table_nm: str, area: str, init_type: str) -> str:
    authors = "Nuttapol.P"
    name_length = len(authors)
    if name_length < 16:
        additional_spaces = ""
        name_adjust = 18
    else:
        additional_spaces = "".ljust(name_length + 3 - 18)
        name_adjust = name_length + 3

    now = datetime.now()
    formatted_date = now.strftime('%Y-%m-%d')

    content = f"""
-- Databricks notebook source
/*---------------------------------------------------------------------------------------------------
# Name: {name}.sql
# Area: {area}
#----------------------------------------------------------------------------------------------------
#
# Change Revision
#----------------------------------------------------------------------------------------------------
# Date....           Who....           {additional_spaces}Description....
#----------------------------------------------------------------------------------------------------
# {formatted_date}         {authors}        Initial.
#
# Target table(s)/view(s): {exname}
#--------------------------------------------------------------------------------------------------*/"""

    return content


def get_c2(field_lines: list[str]) -> str:
    column_content = '\n'.join(field_lines)
    content = f"""
{column_content}
"""
    return content

def get_c(contents: list[str]) -> str:
    contents = [x.replace(u'\xa0', u' ').replace(u'\u202f',u' ') for x in contents]
    return "\n".join(contents)

def get_revision(cbr_path: str, sheet_nm: str = "Cover Sheet") -> pd.DataFrame:
    cbr_pd = pd.read_excel(
        cbr_path, sheet_name=sheet_nm, header=1, skiprows=13, usecols="B:E", dtype=str
    )
    cbr_pd["Date"] = cbr_pd["Date"].str[:10]

    return cbr_pd

def create_folder_if_not_exists(wspc: WorkspaceClient, path: str) -> None:
    # Attempt to create the folder at the specified path
    if wspc.workspace.mkdirs(path=path):
        print(f"Folder {path} created successfully.")
    else:
        print(f"Folder {path} already exists.")



# def create_folder_if_not_exists(wspc: WorkspaceClient, path: str) -> None:
#     if not wspc.workspace.mkdirs(path=path):
#         print(f"Folder {path} created successfully.")
#     else: 
#         print(f"Folder {path} already exists.")


# def create_folder_if_not_exists(folder_path):
    # if not dbutils.fs.mkdirs(folder_path):
    #     print(f"Folder {folder_path} created successfully.")
    # else:
    #     print(f"Folder {folder_path} already exists.")

  
def gen_init_script(cbr_path: str, sheet_nm: str = "mdp_request_field") -> None:
    
    cbr_area = pd.read_excel(cbr_path, sheet_name=sheet_nm, header=None, dtype=str)
    area = cbr_area.iloc[3,1].lower()
    # /Workspace/ddl/mdp/table_property/cardlink/persist
    target_folder = "/Workspace/ddl/mdp/table_property/"
    target_table, target_view,schema_table,schema_view = get_target_from_cbr(cbr_path, sheet_nm)
    
    # database_nm = target_table.split(".")[-2]
    # table_nm = target_table.split(".")[-1]
    # view_nm = target_view.split(".")[-1]


    file_name_psyhical = f"set_tag_{target_table}"
    file_name_view = f"set_tag_{target_view}"



    target_path = f"{target_folder}{area}/persist/set_tag_{target_table}"
    target_path_view = f"{target_folder}{area}/persist/set_tag_{target_view}"
  
    cbr_df = get_curated_cbr(cbr_path, sheet_nm)

    field_lines = []
    view_lines = []
    partitions = []

    prefix = "${catalog}."



    line = f"""
-- COMMAND ----------
alter table {prefix}{schema_table}.{target_table} set tags ('rbac_table_{get_subject_area_from_cbr(cbr_path, sheet_nm)}');
"""
    print(line)
    field_lines.append(line)
    line = f"""
-- COMMAND ----------
alter table {prefix}{schema_view}.{target_view} set tags ('rbac_table_{get_subject_area_from_cbr(cbr_path, sheet_nm)}');
""" 
    print(line)
    view_lines.append(line)
    cbr_df.show()
    # cbr_df = cbr_df.dropna(subset=['RBAC Data Element'])
    cbr_df = cbr_df.filter(~col('RBAC Data Element').contains('NaN'))
    cbr_df.show()
    for index, row in enumerate(cbr_df.collect()):
        column_name_view = row[1]
        column_name_pyshical = row[2]  
        rbac_data_element = row[3] 

        line = f"""
    -- COMMAND ----------
alter table {prefix}{schema_table}.{target_table} alter column {column_name_pyshical} set tags ('{rbac_data_element}');
    """
        field_lines.append(line)

        line = f"""
    -- COMMAND ----------
alter table {prefix}{schema_view}.{target_view} alter column {column_name_view} set tags ('{rbac_data_element}');
    """
        view_lines.append(line)

    # revision_pd = get_revision(cbr_path, "Cover Sheet")
    # area = target_table.split(".")[-2].replace("curated_", "")


    print("area :"+area)

    create_folder_if_not_exists(wspc, target_folder)
    create_folder_if_not_exists(wspc, target_folder + area)
    create_folder_if_not_exists(wspc, target_folder + area + "/persist")


    target_name_table = prefix+schema_table+"."+target_table
    target_name_view = prefix+schema_view+"."+target_view

    cell_1_content = get_c1(target_name_table,file_name_psyhical, target_table, area, "tbl")
    cell_2_content = get_c2(field_lines)
    content_target = get_c([cell_1_content, cell_2_content])
    create_init_script_notebook(wspc, content_target, target_path)

    cell_1_content = get_c1(target_name_view,file_name_view, target_view, area, 'view')
    cell_2_content = get_c2(view_lines)
    content_target = get_c([cell_1_content, cell_2_content])
    create_init_script_notebook(wspc, content_target, target_path_view)




# COMMAND ----------

# MAGIC %md ## Generate Initial Script

# COMMAND ----------


# folder_path = '/Workspace/test/mdp/unit/ingest/cardlink/cbr/'

paths = [
    '/Workspace/test/mdp/uat/ingest/dgtl_fctrng/cbr/CBR_814_persist_dgtl_fctrng_view_v_dgtl_fctrng_lmt_acct_prfl_v01.xlsx'
]
# COMMAND ----------

count_file_run = 0
for path in paths:
    gen_init_script(path)
    count_file_run = count_file_run+1
print("All File Run Count :" ,count_file_run)

