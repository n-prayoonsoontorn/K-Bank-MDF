-- Databricks notebook source
/*---------------------------------------------------------------------------------------------------
# Name: set_tag_tfrs9_post_inst_ecl.sql
# Area: tfrs9
#----------------------------------------------------------------------------------------------------
#
# Change Revision
#----------------------------------------------------------------------------------------------------
# Date....           Who....           Description....
#----------------------------------------------------------------------------------------------------
# 2024-08-23         Nuttapol.P        Initial.
#
# Target table(s)/view(s): ${catalog}.persist_tfrs9.tfrs9_post_inst_ecl
#--------------------------------------------------------------------------------------------------*/



-- COMMAND ----------
    
alter table ${catalog}.persist_tfrs9.tfrs9_post_inst_ecl set tags ('rbac_table_tfrs9');


-- COMMAND ----------
            
alter table ${catalog}.persist_tfrs9.tfrs9_post_inst_ecl alter column instid set tags ('rbac_column_confidential_2_3');


-- COMMAND ----------
            
alter table ${catalog}.persist_tfrs9.tfrs9_post_inst_ecl alter column lmd23400_acct_type set tags ('rbac_column_confidential_2_3_param');

