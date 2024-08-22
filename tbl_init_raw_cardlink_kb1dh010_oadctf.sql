-- Databricks notebook source
/*---------------------------------------------------------------------------------------------------
# Name: tbl_init_raw_cardlink_kb1dh010_oadctf.sql
# Area: cardlink
#----------------------------------------------------------------------------------------------------
#
# Change Revision
#----------------------------------------------------------------------------------------------------
# Date....      Who....             Description....
#----------------------------------------------------------------------------------------------------
# 2024-08-22   Tanatchporn S.       Initial Version
#
# Target table(s)/view(s): ${catalog}.RAW_CARDLINK.CARDLINK_KB1DH010_OADCTF
#--------------------------------------------------------------------------------------------------*/

-- COMMAND --

create table if not exists ${catalog}.raw_cardlink.cardlink_kb1dh010_oadctf (
	pos_dt                     	string       comment "Def(En): Position Date
Def(Th): วันที่ของข้อมูล",
	dh010_merch_nbr            	string       comment "Def(En): Merchant Number
Def(Th):",
	dh010_term_id              	string       comment "Def(En): Terminal ID
Def(Th):",
	dh010_edc_ind              	string       comment "Def(En): EDC (Electronic Data Capture) Indicator
Def(Th):",
	dh010_term_ind             	string       comment "Def(En): Terminal ID. Valid value:
A = Active 
I = Inactive
Def(Th):",
	dh010_action_ind           	string       comment "Def(En): Action Indicator. Valid value:
N = NONE         
O = ORIGINAL BATCH
R = RE-TRANSMITTED BATCH (DEFAULT)
Def(Th):",
	dh010_current_batch_nbr    	string       comment "Def(En): Current Batch Number
Def(Th):",
	dh010_eod_cutoff_batch_nbr 	string       comment "Def(En): Cut off Batch Number
Def(Th):",
	dh010_last_maint_date      	string       comment "Def(En): Last maintanance Date
Def(Th):",
	dh010_last_settlement_date 	string       comment "Def(En): Last settlement Date
Def(Th):",
	dh010_total_debit_nbr_1    	string       comment "Def(En): Total Debit Number1
Def(Th):",
	dh010_total_debit_amt_1    	string       comment "Def(En): Total Debit Amount1
Def(Th):",
	dh010_total_credit_nbr_1   	string       comment "Def(En): Total Credit Number1
Def(Th):",
	dh010_total_credit_amt_1   	string       comment "Def(En): Total Credit Amount1
Def(Th):",
	dh010_total_debit_nbr_2    	string       comment "Def(En): Total Debit Number2
Def(Th):",
	dh010_total_debit_amt_2    	string       comment "Def(En): Total Debit Amount2
Def(Th):",
	dh010_total_credit_nbr_2   	string       comment "Def(En): Total Credit Number2
Def(Th):",
	dh010_total_credit_amt_2   	string       comment "Def(En): Total Credit Amount2
Def(Th):",
	dh010_cur_total_debit_nbr  	string       comment "Def(En): Current Total Debit Number
Def(Th):",
	dh010_cur_total_debit_amt  	string       comment "Def(En): Current Total Debit Amount
Def(Th):",
	dh010_cur_total_credit_nbr 	string       comment "Def(En): Current Total Credit Number
Def(Th):",
	dh010_cur_total_credit_amt 	string       comment "Def(En): Current Total Credit Amount
Def(Th):",
	dh010_visa_total_nbr       	string       comment "Def(En): Visa Total Number
Def(Th):",
	dh010_visa_total_amount    	string       comment "Def(En): Visa Total Amount
Def(Th):",
	dh010_mc_total_nbr         	string       comment "Def(En): Authenticationcard Total Number
Def(Th):",
	dh010_mc_total_amount      	string       comment "Def(En): Authenticationcard Total Amount
Def(Th):",
	dh010_private_total_nbr    	string       comment "Def(En): Private Total Number
Def(Th):",
	dh010_private_total_amount 	string       comment "Def(En): Private Total Amount
Def(Th):",
	dh010_t4_previous_batch_nbr	string       comment "Def(En): Previous Batch Number
Def(Th):",
	dh010_trm_cv2_ind          	string       comment "Def(En): Terminal CVV2 (Card Verification Value2) Indicator
Def(Th):",
	dh010_trm_cv2_resp         	string       comment "Def(En): Terminal CVV2 (Card Verification Value2) Response
Def(Th):",
	dh010_redem_count_pts      	string       comment "Def(En): Redemption Count
Def(Th):",
	dh010_redem_total_pts      	string       comment "Def(En): Redemption Total
Def(Th):",
	dh010_redem_count_voucher  	string       comment "Def(En): Redemption Count Voucher
Def(Th):",
	dh010_redem_total_voucher  	string       comment "Def(En): Redemption Total Voucher
Def(Th):",
	dh010_redem_count_discount 	string       comment "Def(En): Redemption Count Discount
Def(Th):",
	dh010_redem_total_discount 	string       comment "Def(En): Redemption Total Discount
Def(Th):",
	dh010_trm_type             	string       comment "Def(En): Terminal Type.
Def(Th):",
	dh010_filler_1             	string       comment "Def(En): Reserve field.
Def(Th):",
	dh010_e_commerce_flag      	string       comment "Def(En): E-commerce Flag
'M', 'N', 'E'
Def(Th):",
	dh010_recurring_flag       	string       comment "Def(En): Recurring Flag
Def(Th):",
	dh010_trm_multi_ind        	string       comment "Def(En): Termianl Multi Indicator
Def(Th):",
	dh010_trm_master_ind       	string       comment "Def(En): Terminal Authentication Indicator
Def(Th):",
	dh010_trm_open_date        	string       comment "Def(En): Open Date
Def(Th):",
	dh010_trm_owner_ind        	string       comment "Def(En): Terminal Owner Indicator
Def(Th):",
	dh010_trm_count_ind        	string       comment "Def(En): Terminal Count Indicator
Def(Th):",
	dh010_trm_equip_ind        	string       comment "Def(En): Termianl Equip Indicator
Def(Th):",
	dh010_trm_serial_ind       	string       comment "Def(En): Terminal Serial Indicator
Def(Th):",
	dh010_trm_other_ind        	string       comment "Def(En): Terminal Other Indicator
Def(Th):",
	dh010_trm_appr_ind         	string       comment "Def(En): Terminal Approve Indicator
Def(Th):",
	dh010_trm_join_ind         	string       comment "Def(En): Terminal Join Indicator
Def(Th):",
	dh010_service_code         	string       comment "Def(En): Service Code
Def(Th):",
	dh010_filler_2             	string       comment "Def(En): Space
Def(Th):",
	dh010_trm_chip_ind         	string       comment "Def(En): Terminal Chip Indicator. Valid values:
N = POS TERMINAL 
Y = CHIP TERMINAL
M = CONTACTLESS M/CHIP
P = CONTACTLESS MGT STRP
Def(Th):",
	dh010_filler_3             	string       comment "Def(En): Space
Def(Th):",
	dh010_clcb_ind             	string       comment "Def(En): CLCB (Royalty system) Indicator. Valid value: Y or N
Def(Th):",
	dh010_trm_pin_capt_code    	string       comment "Def(En): Terminal Pin Capt Code : 
PIN CAPTURE CODE. 4-12 ONLY Indicates the maximum number of PIN characters that the terminal can accept
Def(Th):",
	dh010_pin_block_format     	string       comment "Def(En): Pin Block Format 
Def(Th):",
	dh010_encryption_flag      	string       comment "Def(En): ENCRYPTION FLAG
Def(Th):",
	dh010_kcv_resp_flag        	string       comment "Def(En): Key Check value Response Flag
Def(Th):",
	dh010_next_profile_id      	string       comment "Def(En): Next Profile ID
Def(Th):",
	dh010_next_profile_dte     	string       comment "Def(En): Next Profile Date
Def(Th):",
	dh010_curr_profile_id      	string       comment "Def(En): Current Profile ID
Def(Th):",
	dh010_curr_profile_dte     	string       comment "Def(En): Current Profile Date
Def(Th):",
	dh010_ntmk_scheme_flag     	string       comment "Def(En): Next Terminal Authentication Key Scheme Flag
Def(Th):",
	dh010_ntmk_key_part1       	string       comment "Def(En): Next Terminal Authentication Key Part1
Def(Th):",
	dh010_ntmk_key_part2       	string       comment "Def(En): Next Terminal Authentication Key Part2
Def(Th):",
	dh010_ntmk_key_part3       	string       comment "Def(En): Next Terminal Authentication Key Part3
Def(Th):",
	dh010_ntmk_kcv_short       	string       comment "Def(En): Next Terminal Authentication Key (Key Check Value)
Def(Th):",
	dh010_ntmk_kcv_addl        	string       comment "Def(En): Next Terminal Authentication Key (Key Check Value) Additional
Def(Th):",
	dh010_ntmk_load_dte        	string       comment "Def(En): Next Terminal Authentication Key Load Date
Def(Th):",
	dh010_ntmk_effective_dte   	string       comment "Def(En): Next Terminal Authentication Key Effective Date
Def(Th):",
	dh010_ntpk_scheme_flag     	string       comment "Def(En): Next Terminal PIN Key Scheme Flag
Def(Th):",
	dh010_ntpk_key_part1       	string       comment "Def(En): Next Terminal PIN Key Part1
Def(Th):",
	dh010_ntpk_key_part2       	string       comment "Def(En): Next Terminal PIN Key Part2
Def(Th):",
	dh010_ntpk_key_part3       	string       comment "Def(En): Next Terminal PIN Key Part3
Def(Th):",
	dh010_ntpk_kcv_short       	string       comment "Def(En): Next Terminal PIN Key (Key Check Value) Short
Def(Th):",
	dh010_ntpk_kcv_addl        	string       comment "Def(En): Next Terminal PIN Key (Key Check Value) Additional
Def(Th):",
	dh010_ntpk_load_dte        	string       comment "Def(En): Next Terminal PIN Key Load Date
Def(Th):",
	dh010_ntak_scheme_flag     	string       comment "Def(En): Next Terminal Authentication Key Scheme Flag
Def(Th):",
	dh010_ntak_key_part1       	string       comment "Def(En): Next Terminal Authentication Key part1
Def(Th):",
	dh010_ntak_key_part2       	string       comment "Def(En): Next Terminal Authentication Key Part2
Def(Th):",
	dh010_ntak_key_part3       	string       comment "Def(En): Next Terminal Authentication Key Part3
Def(Th):",
	dh010_ntak_kcv_short       	string       comment "Def(En): Next Terminal Authentication Key (Key Check Value) Short
Def(Th):",
	dh010_ntak_kcv_addl        	string       comment "Def(En): Next Terminal Authentication Key (Key Check Value) Additional
Def(Th):",
	dh010_ntak_load_dte        	string       comment "Def(En): Next Terminal Authentication Key Load Date
Def(Th):",
	dh010_ctmk_scheme_flag     	string       comment "Def(En): Current Terminal Mas Key Scheme Flag
Def(Th):",
	dh010_ctmk_key_part1       	string       comment "Def(En): Current Terminal Authentication Key Part1
Def(Th):",
	dh010_ctmk_key_part2       	string       comment "Def(En): Current Terminal Authentication Key Part2
Def(Th):",
	dh010_ctmk_key_part3       	string       comment "Def(En): Current Terminal Authentication Key Part3
Def(Th):",
	dh010_ctmk_kcv_short       	string       comment "Def(En): Current Terminal Authentication Key (Key Check Value)
Def(Th):",
	dh010_ctmk_kcv_addl        	string       comment "Def(En): Current Terminal Authentication Key (Key Check Value) Additional
Def(Th):",
	dh010_ctmk_effective_dte   	string       comment "Def(En): Current Terminal Authentication Key Effective Date
Def(Th):",
	dh010_ctpk_scheme_flag     	string       comment "Def(En): Current Terminal PIN Key Scheme Flag
Def(Th):",
	dh010_ctpk_key_part1       	string       comment "Def(En): Current Terminal PIN Key Part1
Def(Th):",
	dh010_ctpk_key_part2       	string       comment "Def(En): Current Terminal PIN Key Part2
Def(Th):",
	dh010_ctpk_key_part3       	string       comment "Def(En): Current Terminal PIN Key Part3
Def(Th):",
	dh010_ctpk_kcv_short       	string       comment "Def(En): Current Terminal PIN Key (Key Check Value) Short
Def(Th):",
	dh010_ctpk_kcv_addl        	string       comment "Def(En): Current Terminal PIN Key (Key Check Value) Additional
Def(Th):",
	dh010_ctpk_effective_dte   	string       comment "Def(En): Current Terminal PIN Key Effective Date
Def(Th):",
	dh010_ctak_scheme_flag     	string       comment "Def(En): Current Terminal Authentication Key Scheme Flag
Def(Th):",
	dh010_ctak_key_part1       	string       comment "Def(En): Current Terminal Authentication Key part1
Def(Th):",
	dh010_ctak_key_part2       	string       comment "Def(En): Current Terminal Authentication Key Part2
Def(Th):",
	dh010_ctak_key_part3       	string       comment "Def(En): Current Terminal Authentication Key Part3
Def(Th):",
	dh010_ctak_kcv_short       	string       comment "Def(En): Current Terminal Authentication Key (Key Check Value) Short
Def(Th):",
	dh010_ctak_kcv_addl        	string       comment "Def(En): Current Terminal Authentication Key (Key Check Value) Additional
Def(Th):",
	dh010_ctak_effective_dte   	string       comment "Def(En): Current Terminal Authentication Key Effective Date
Def(Th):",
	dh010_ltmk_scheme_flag     	string       comment "Def(En): Last Terminal Mas Key Scheme Flag
Def(Th):",
	dh010_ltmk_key_part1       	string       comment "Def(En): Last Terminal Authentication Key Part1
Def(Th):",
	dh010_ltmk_key_part2       	string       comment "Def(En): Last Terminal Authentication Key Part2
Def(Th):",
	dh010_ltmk_key_part3       	string       comment "Def(En): Last Terminal Authentication Key Part3
Def(Th):",
	dh010_ltmk_kcv_short       	string       comment "Def(En): Last Terminal Authentication Key (Key Check Value)
Def(Th):",
	dh010_ltmk_kcv_addl        	string       comment "Def(En): Last Terminal Authentication Key (Key Check Value) Additional
Def(Th):",
	dh010_ltmk_effective_dte   	string       comment "Def(En): Last Terminal Authentication Key Effective Date
Def(Th):",
	dh010_ltpk_scheme_flag     	string       comment "Def(En): Last Terminal PIN Key Scheme Flag
Def(Th):",
	dh010_ltpk_key_part1       	string       comment "Def(En): Last Terminal PIN Key Part1
Def(Th):",
	dh010_ltpk_key_part2       	string       comment "Def(En): Last Terminal PIN Key Part2
Def(Th):",
	dh010_ltpk_key_part3       	string       comment "Def(En): Last Terminal PIN Key Part3
Def(Th):",
	dh010_ltpk_kcv_short       	string       comment "Def(En): Last Terminal PIN Key (Key Check Value) Short
Def(Th):",
	dh010_ltpk_kcv_addl        	string       comment "Def(En): Last Terminal PIN Key (Key Check Value) Additional
Def(Th):",
	dh010_ltpk_effective_dte   	string       comment "Def(En): Last Terminal PIN Key Effective Date
Def(Th):",
	dh010_ltak_scheme_flag     	string       comment "Def(En): Last Terminal Authentication Key Scheme Flag
Def(Th):",
	dh010_ltak_key_part1       	string       comment "Def(En): Last Terminal Authentication Key part1
Def(Th):",
	dh010_ltak_key_part2       	string       comment "Def(En): Last Terminal Authentication Key Part2
Def(Th):",
	dh010_ltak_key_part3       	string       comment "Def(En): Last Terminal Authentication Key Part3
Def(Th):",
	dh010_ltak_kcv_short       	string       comment "Def(En): Last Terminal Authentication Key (Key Check Value) Short
Def(Th):",
	dh010_ltak_kcv_addl        	string       comment "Def(En): Last Terminal Authentication Key (Key Check Value) Additional
Def(Th):",
	dh010_ltak_effective_dte   	string       comment "Def(En): Last Terminal Authentication Key Effective Date
Def(Th):",
	dh010_key_last_maint_userid	string       comment "Def(En): Key Last Maintenance User ID
Def(Th):",
	dh010_key_last_maint_date  	string       comment "Def(En): Key Last Maintenance Date
Def(Th):",
	dh010_key_last_maint_time  	string       comment "Def(En): Key Last Maintenance Time
Def(Th):",
	dh010_earliest_txn_date    	string       comment "Def(En): Earliest transaction date performed on the terminal
Def(Th):",
	dh010_earliest_txn_time    	string       comment "Def(En): Earliest transaction time performed on the terminal
Def(Th):",
	dh010_autopost_date        	string       comment "Def(En): Autopost date on terminal
Def(Th):",
	dh010_autopost_time        	string       comment "Def(En): Autopost time on terminal
Def(Th):",
	filler                     	string       comment "Def(En): Space
Def(Th):",
	load_tms                   	string       comment "Def(En): The timestamp on which the instance of the entity was last updated.
Def(Th): วันที่ที่ระบบได้รับข้อมูลล่าสุด",
	src_sys_id                 	string       comment "Def(En): Source system ID
Def(Th): เลขที่แสดงระบบงาน",
	ptn_yyyy                   	string       comment "Def(En): Partition Year (YYYY)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับปี",
	ptn_mm                     	string       comment "Def(En): Partition Month (MM)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับเดือน",
	ptn_dd                     	string       comment "Def(En): Partition Date (DD)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับวัน"
) using delta partitioned by (ptn_yyyy, ptn_mm, ptn_dd) location 'abfss://${storage_raw}/${catalog}/raw_cardlink/cardlink_kb1dh010_oadctf' tblproperties (
	'delta.minreaderversion' = '2',
	'delta.minwriterversion' = '5',
	'delta.columnmapping.mode' = 'name'
);