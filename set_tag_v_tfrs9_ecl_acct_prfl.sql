-- Databricks notebook source
/*---------------------------------------------------------------------------------------------------
# Name: set_tag_v_tfrs9_ecl_acct_prfl.sql
# Area: tfrs9
#----------------------------------------------------------------------------------------------------
#
# Change Revision
#----------------------------------------------------------------------------------------------------
# Date....           Who....           Description....
#----------------------------------------------------------------------------------------------------
# 2024-08-23         Nuttapol.P        Initial.
#
# Target table(s)/view(s): ${catalog}.persist_tfrs9_view.v_tfrs9_ecl_acct_prfl
#--------------------------------------------------------------------------------------------------*/



-- COMMAND ----------

alter table ${catalog}.persist_tfrs9_view.v_tfrs9_ecl_acct_prfl set tags ('rbac_table_tfrs9');


-- COMMAND ----------

alter table ${catalog}.persist_tfrs9_view.v_tfrs9_ecl_acct_prfl alter column acct_num set tags ('rbac_column_confidential_2_3');

