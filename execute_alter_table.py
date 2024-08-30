-- Databricks notebook source
CREATE OR REPLACE FUNCTION ${catalog}.udf_rbac.rbac_column_mcl_host_confidential_1_4(
  _column_value STRING, 
  _anyid STRING
) 
RETURNS STRING
RETURN (
  CASE 
    WHEN LEFT(_anyid, 1) = 'I' THEN
      CASE 
        WHEN ${catalog}.udf_rbac.check_privilege('confidential_1', 'mcl_host', 'column', 'persist') THEN _column_value
        ELSE ${catalog}.udf.eban_sha2(_column_value)
      END
    WHEN LEFT(_anyid, 1) = 'M' THEN
      CASE 
        WHEN ${catalog}.udf_rbac.check_privilege('confidential_4', 'mcl_host', 'column', 'persist') THEN _column_value
        ELSE ${catalog}.udf.eban_sha2(_column_value)
      END
    ELSE _column_value  
  END
);
