-- Databricks notebook source
/*---------------------------------------------------------------------------------------------------
# Name: tbl_init_raw_sfv_mnul_prty_fnd.sql
# Area: sfv
#----------------------------------------------------------------------------------------------------
#
# Change Revision
#----------------------------------------------------------------------------------------------------
# Date....      Who....             Description....
#----------------------------------------------------------------------------------------------------
# 2024-04-26   Tanatchporn S.       Initial Version
#
# Target table(s)/view(s): ${catalog}.RAW_SFV.SFV_MNUL_PRTY_FND
#--------------------------------------------------------------------------------------------------*/

-- COMMAND --

create table if not exists ${catalog}.raw_sfv.sfv_mnul_prty_fnd (
	pos_dt           	string       comment "Def(En): Position Date
Def(Th): วันที่ของข้อมูล",
	fnd_id           	string       comment "Def(En): The code to identify fund Id
Def(Th): เลขที่กองทุน",
	fnd_tp_dsc       	string       comment "Def(En): Fund Type Description for Care Call
Def(Th): ประเภทกองทุนสำหรับการติดต่อลูกค้า",
	survy_f          	string       comment "Def(En): Survey Flag (code of fund type)
Def(Th): Flag กองทุนที่ต้องติดต่อลูกค้าทุกรายการ",
	fnd_sub_grp_1    	string       comment "Def(En): Subgroup of Funds
Def(Th): กลุ่มกองทุนสำหรับใช้ในการวิเคราะห์และบริหารจัดการ",
	fnd_sub_grp_2    	string       comment "Def(En): Subgroup of Funds
Def(Th): กลุ่มกองทุนสำหรับใช้ในการวิเคราะห์และบริหารจัดการ",
	fnd_sub_grp_3    	string       comment "Def(En): Subgroup of Funds
Def(Th): กลุ่มกองทุนสำหรับใช้ในการวิเคราะห์และบริหารจัดการ",
	fnd_sub_grp_4    	string       comment "Def(En): Subgroup of Funds
Def(Th): กลุ่มกองทุนสำหรับใช้ในการวิเคราะห์และบริหารจัดการ",
	fnd_sub_grp_5    	string       comment "Def(En): Subgroup of Funds
Def(Th): กลุ่มกองทุนสำหรับใช้ในการวิเคราะห์และบริหารจัดการ",
	fnd_sub_grp_6    	string       comment "Def(En): Subgroup of Funds 
Def(Th): กลุ่มกองทุนสำหรับใช้ในการวิเคราะห์และบริหารจัดการ",
	fnd_sub_grp_7    	string       comment "Def(En): Subgroup of Funds
Def(Th): กลุ่มกองทุนสำหรับใช้ในการวิเคราะห์และบริหารจัดการ",
	fnd_sub_grp_8    	string       comment "Def(En): Subgroup of Funds
Def(Th): กลุ่มกองทุนสำหรับใช้ในการวิเคราะห์และบริหารจัดการ",
	fnd_sub_grp_9    	string       comment "Def(En): Subgroup of Funds
Def(Th): กลุ่มกองทุนสำหรับใช้ในการวิเคราะห์และบริหารจัดการ",
	fnd_sub_grp_10   	string       comment "Def(En): Subgroup of Funds
Def(Th): กลุ่มกองทุนสำหรับใช้ในการวิเคราะห์และบริหารจัดการ",
	lbdu_fundtype_dsc	string       comment "Def(En): Fund Type Description for LBDU
Def(Th): ประเภทกองทุนสำหรับจัดกลุ่มค่า LBDU",
	coa_pd_ftr_cd    	string       comment "Def(En): COA Product Feature Code
Def(Th): เลขที่ผลิตภัณฑ์กองทุน",
	opn_dt           	string       comment "Def(En): Open Date
Def(Th): วันที่เริ่มจดทะเบียนกองทุน",
	due_dt           	string       comment "Def(En): Due Date
Def(Th): วันที่ครบกำหนด (รับซื้อคืน)",
	tfr_dt           	string       comment "Def(En): Transfer Date
Def(Th): วันที่โอนเงินเข้า/ปรับสมุด",
	tfr_cnl_dsc      	string       comment "Def(En): Transfer Channel
Def(Th): เงื่อนไขการโอนเงิน",
	rate_pct         	string       comment "Def(En): Rate
Def(Th): ผลตอบแทนประมาณการต่อปี",
	prd_mo           	string       comment "Def(En): Holding Period (month)
Def(Th): จำนวนเดือนที่ต้องถือครอง",
	mstr_fnd_id      	string       comment "Def(En): Master Fund ID (OA) 
Def(Th): รหัสกองทุนที่เป็น Unique Key

Related 
VP_WLTH_FND_INF.MSTR_FND_ID
VP_WLTH_FND_AR.MSTR_FND_ID",
	adl_inf_1        	string       comment "Def(En): Additional information 1
Def(Th):",
	adl_inf_2        	string       comment "Def(En): Additional information 2
Def(Th):",
	adl_inf_3        	string       comment "Def(En): Additional information 3
Def(Th):",
	adl_inf_4        	string       comment "Def(En): Additional information 4
Def(Th):",
	adl_inf_5        	string       comment "Def(En): Additional information 5
Def(Th):",
	adl_inf_6        	string       comment "Def(En): Additional information 6
Def(Th):",
	adl_inf_7        	string       comment "Def(En): Additional information 7
Def(Th):",
	adl_inf_8        	string       comment "Def(En): Additional information 8
Def(Th):",
	adl_inf_9        	string       comment "Def(En): Additional information 9
Def(Th):",
	adl_inf_10       	string       comment "Def(En): Additional information 10
Def(Th):",
	data_src         	string       comment "Def(En): Data source
Def(Th):",
	amc_cd           	string       comment "Def(En): AMC code
Def(Th):",
	rsk_dsclr_th     	string       comment "Def(En): Risk Disclosure (Thai)
Def(Th):",
	rsk_dsclr_en     	string       comment "Def(En): Risk Disclosure (ENG)
Def(Th):",
	load_tms         	string       comment "Def(En): The timestamp on which the instance of the entity was last updated.
Def(Th): วันที่ที่ระบบได้รับข้อมูลล่าสุด",
	src_sys_id       	string       comment "Def(En): Source system ID
Def(Th):เลขที่แสดงระบบงาน",
	ptn_yyyy         	string       comment "Def(En): Partition Year (YYYY)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับปี",
	ptn_mm           	string       comment "Def(En): Partition Month (MM)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับเดือน",
	ptn_dd           	string       comment "Def(En): Partition Date (DD)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับวัน"
) using delta partitioned by (ptn_yyyy, ptn_mm, ptn_dd) location 'abfss://${storage_raw}/${catalog}/raw_sfv/sfv_mnul_prty_fnd' tblproperties (
	'delta.minreaderversion' = '2',
	'delta.minwriterversion' = '5',
	'delta.columnmapping.mode' = 'name'
);