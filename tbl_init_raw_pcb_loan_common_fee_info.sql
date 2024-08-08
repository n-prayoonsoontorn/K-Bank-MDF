-- Databricks notebook source
/*---------------------------------------------------------------------------------------------------
# Name: tbl_init_raw_pcb_loan_common_fee_info.sql
# Area: pcb_loan
#----------------------------------------------------------------------------------------------------
#
# Change Revision
#----------------------------------------------------------------------------------------------------
# Date....      Who....             Description....
#----------------------------------------------------------------------------------------------------
# 2024-08-08   Tanatchporn S.       Initial Version
#
# Target table(s)/view(s): ${catalog}.RAW_PCB_LOAN.PCB_LOAN_COMMON_FEE_INFO
#--------------------------------------------------------------------------------------------------*/

-- COMMAND --

create table if not exists ${catalog}.raw_pcb_loan.pcb_loan_common_fee_info (
	pos_dt              	string       comment "Def(En): Position Date
Def(Th): วันที่ของข้อมูล",
	prfl_ac_ar_id       	string       comment "Def(En): Profile Account Number
Def(Th):",
	ac_ar_id            	string       comment "Def(En): Account Number
Def(Th):",
	fee_type            	string       comment "Def(En): Fee Type
Def(Th):",
	cal_code            	string       comment "Def(En): CalCode
Def(Th):",
	min_fee_amt         	string       comment "Def(En): Minimum Fee Amount
Def(Th):",
	min_term            	string       comment "Def(En): Minimum Term (M)
Def(Th):",
	next_min_fee_amt    	string       comment "Def(En): Next Minimum Fee Amount
Def(Th):",
	fir_du_m            	string       comment "Def(En): First Duration (M)
Def(Th):",
	fir_du_d            	string       comment "Def(En): First Duration (D)
Def(Th):",
	next_du_open_m      	string       comment "Def(En): Next Duration OpenEnd (M)
Def(Th):",
	next_du_open_d      	string       comment "Def(En): Next Duration OpenEnd (D)
Def(Th):",
	next_du_close_m     	string       comment "Def(En): Next Duration CloseEnd (M)
Def(Th):",
	next_du_close_d     	string       comment "Def(En): Next Duration CloseEnd (D)
Def(Th):",
	gra_pe_m            	string       comment "Def(En): Grace Period (M)
Def(Th):",
	scc                 	string       comment "Def(En):
Def(Th): รหัสคำนวณค่าธรรมเนียมพิเศษ",
	min_amt_scc         	string       comment "Def(En): Minimum Amount For Special Cal. Code 
Def(Th):",
	scc_mi_amount       	string       comment "Def(En): SCC Minimum Fee Amount
Def(Th):",
	scc_mi_m            	string       comment "Def(En): SCC Minimum Term (M)
Def(Th):",
	scc_next_min_fee_amt	string       comment "Def(En): SCC Next Minimum Fee Amount
Def(Th):",
	scc_fi_m            	string       comment "Def(En): SCC First Duration (M)
Def(Th):",
	scc_fi_d            	string       comment "Def(En): SCC First Duration (D)
Def(Th):",
	scc_next_du_open_m  	string       comment "Def(En): SCC Next Duration OpenEnd (M)
Def(Th):",
	scc_next_du_open_d  	string       comment "Def(En): SCC Next Duration OpenEnd (D)
Def(Th):",
	scc_next_du_close_m 	string       comment "Def(En): SCC Next Duration CloseEnd (M)
Def(Th):",
	scc_next_du_close_d 	string       comment "Def(En): SCC Next Duration CloseEnd (D)
Def(Th):",
	scc_gr_m            	string       comment "Def(En): SCC Grace Period (M)
Def(Th):",
	from_amt_tier1      	string       comment "Def(En): From Amount
Def(Th):",
	to_amt_tier1        	string       comment "Def(En): To Amount
Def(Th):",
	fee_rate_1          	string       comment "Def(En): Fee Rate
Def(Th):",
	from_amt_tier2      	string       comment "Def(En): From Amount
Def(Th):",
	to_amt_tier2        	string       comment "Def(En): To Amount
Def(Th):",
	fee_rate_2          	string       comment "Def(En): Fee Rate
Def(Th):",
	from_amt_tier3      	string       comment "Def(En): From Amount
Def(Th):",
	to_amt_tier3        	string       comment "Def(En): To Amount
Def(Th):",
	fee_rate_3          	string       comment "Def(En): Fee Rate
Def(Th):",
	from_amt_tier4      	string       comment "Def(En): From Amount
Def(Th):",
	to_amt_tier4        	string       comment "Def(En): To Amount
Def(Th):",
	fee_rate_4          	string       comment "Def(En): Fee Rate
Def(Th):",
	from_amt_tier5      	string       comment "Def(En): From Amount
Def(Th):",
	to_amt_tier5        	string       comment "Def(En): To Amount
Def(Th):",
	fee_rate_5          	string       comment "Def(En): Fee Rate
Def(Th):",
	nom_pay             	string       comment "Def(En): Number of Months/ Payment
Def(Th):",
	last_accr_dt        	string       comment "Def(En): Last Accrued Date
Def(Th):",
	next_du_m           	string       comment "Def(En): Next Duration (M)
Def(Th):",
	next_du_d           	string       comment "Def(En): Next Duration (D)
Def(Th):",
	prev_last_accr_dt   	string       comment "Def(En): Previous Last Accrued Date
Def(Th):",
	load_tms            	string       comment "Def(En): The timestamp on which the instance of the entity was last updated.
Def(Th): วันที่ที่ระบบได้รับข้อมูลล่าสุด",
	src_sys_id          	string       comment "Def(En): Source system ID
Def(Th):เลขที่แสดงระบบงาน",
	ptn_yyyy            	string       comment "Def(En): Partition Year (YYYY)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับปี",
	ptn_mm              	string       comment "Def(En): Partition Month (MM)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับเดือน",
	ptn_dd              	string       comment "Def(En): Partition Date (DD)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับวัน"
) using delta partitioned by (ptn_yyyy, ptn_mm, ptn_dd) location 'abfss://${storage_raw}/${catalog}/raw_pcb_loan/pcb_loan_common_fee_info' tblproperties (
	'delta.minreaderversion' = '2',
	'delta.minwriterversion' = '5',
	'delta.columnmapping.mode' = 'name'
);