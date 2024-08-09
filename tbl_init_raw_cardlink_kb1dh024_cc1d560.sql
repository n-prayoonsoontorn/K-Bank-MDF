-- Databricks notebook source
/*---------------------------------------------------------------------------------------------------
# Name: tbl_init_raw_cardlink_kb1dh024_cc1d560.sql
# Area: cardlink
#----------------------------------------------------------------------------------------------------
#
# Change Revision
#----------------------------------------------------------------------------------------------------
# Date....      Who....             Description....
#----------------------------------------------------------------------------------------------------
# 2024-08-09   Tanatchporn S.       Initial Version
#
# Target table(s)/view(s): ${catalog}.RAW_CARDLINK.CARDLINK_KB1DH024_CC1D560
#--------------------------------------------------------------------------------------------------*/

-- COMMAND --

create table if not exists ${catalog}.raw_cardlink.cardlink_kb1dh024_cc1d560 (
	pos_dt                        	string       comment "Def(En): Position Date
Def(Th): วันที่ของข้อมูล",
	dh024_d_record                	string       comment "Def(En): Detail Record
Def(Th):",
	dh024_d560_prefix             	string       comment "Def(En): Prefix
Def(Th):",
	dh024_d560_vs_or_master       	string       comment "Def(En):
Def(Th): ประเภทบัตร เช่น Visa, Mastercard เป็นต้น",
	dh024_d560_inter_local_or_asso	string       comment "Def(En): 
Def(Th): ประเภทบัตร เช่น Inter, Local เป็นต้น",
	dh024_d560_bank_issuer        	string       comment "Def(En): Bank issuer code
Def(Th):",
	dh024_d560_bank_full_name     	string       comment "Def(En): Full name of bank issuer in English
Def(Th):",
	dh024_d560_bank_short_name    	string       comment "Def(En): Short name of bank issuer in English
Def(Th):",
	dh024_d560_plat_corp_bin      	string       comment "Def(En): Bin of Platinum Corporate
Def(Th):",
	dh024_d560_mclow              	string       comment "Def(En): Mastercard Low Value
Def(Th):",
	dh024_d560_mchi               	string       comment "Def(En): Mastercard High Value
Def(Th):",
	dh024_d_filler                	string       comment "Def(En): Space
Def(Th):",
	load_tms                      	string       comment "Def(En): The timestamp on which the instance of the entity was last updated.
Def(Th): วันที่ที่ระบบได้รับข้อมูลล่าสุด",
	src_sys_id                    	string       comment "Def(En): Source system ID
Def(Th): เลขที่แสดงระบบงาน",
	ptn_yyyy                      	string       comment "Def(En): Partition Year (YYYY)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับปี",
	ptn_mm                        	string       comment "Def(En): Partition Month (MM)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับเดือน",
	ptn_dd                        	string       comment "Def(En): Partition Date (DD)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับวัน"
) using delta partitioned by (ptn_yyyy, ptn_mm, ptn_dd) location 'abfss://${storage_raw}/${catalog}/raw_cardlink/cardlink_kb1dh024_cc1d560' tblproperties (
	'delta.minreaderversion' = '2',
	'delta.minwriterversion' = '5',
	'delta.columnmapping.mode' = 'name'
);