-- Databricks notebook source
/*---------------------------------------------------------------------------------------------------
# Name: tbl_init_persist_mcl_host_share_mcl2d20_capital.sql
# Area: mcl_host
#----------------------------------------------------------------------------------------------------
#
# Change Revision
#----------------------------------------------------------------------------------------------------
# Date....      Who....             Description....
#----------------------------------------------------------------------------------------------------
# 2024-08-21   Tanatchporn S.       Initial Version
#
# Target table(s)/view(s): ${catalog}.PERSIST_MCL_HOST.MCL_HOST_SHARE_MCL2D20_CAPITAL
#--------------------------------------------------------------------------------------------------*/

-- COMMAND --

create table if not exists ${catalog}.persist_mcl_host.mcl_host_share_mcl2d20_capital (
	pos_dt                    	date         comment "Def(En): Position Date
Def(Th): วันที่ของข้อมูล",
	d20_d_fl_type             	string       comment "Def(En): File Type
Def(Th):",
	d20_d_batch_no            	integer      comment "Def(En): Batch Number
Def(Th):",
	d20_d_rev_bk_code         	smallint     comment "Def(En): Receiving Bank Code
Def(Th):",
	d20_d_rev_br_code         	smallint     comment "Def(En): Receiving Branch Code
Def(Th):",
	d20_d_rev_acct_no         	bigint       comment "Def(En): Receiving Bank A/C No.
Def(Th):",
	d20_d_send_bk_code        	smallint     comment "Def(En): Sending Bank Code
Def(Th):",
	d20_d_send_br_code        	smallint     comment "Def(En): Sending Branch Code
Def(Th):",
	d20_d_send_acct_no        	bigint       comment "Def(En): Sending Bank A/C No. 
Def(Th):",
	d20_d_eft_date            	date         comment "Def(En): Effective Date of Transfer (DDMMYYYY)
Def(Th):",
	d20_d_serv_type           	string       comment "Def(En): Service Type Code
Def(Th):",
	d20_d_cl_house_code       	string       comment "Def(En): Clearing House Code
Def(Th):",
	d20_d_tran_amount         	decimal(15,2) comment "Def(En): Transfer amount
ส่งมาไม่มี . ต้อง / 100
Def(Th):",
	d20_d_rev_info            	string       comment "Def(En):
Def(Th): ข้อมูลของลูกค้ารายย่อย (Free text)",
	d20_cust_id               	integer      comment "Def(En): 
Def(Th): กรณี รายการ Normal
รหัสบริษัทที่ธนาคารกำหนด (MCL cust ID ไป join กับ MCL1D84)",
	d20_send_name             	string       comment "Def(En): 
Def(Th):",
	d20_sett_key              	string       comment "Def(En): 
Def(Th):",
	d20_cust_ref              	string       comment "Def(En):
Def(Th): เลขที่อ้างอิงที่ลูกค้ายินยอมให้หักบัญชี -เมือก่อนใช้กับ smart credit ปัจจุบันไม่ใช้แล้ว",
	d20_sms_msg               	string       comment "Def(En): 
Def(Th):",
	d20_upload_channel        	string       comment "Def(En): UPLOAD-CHANNEL
Def(Th):",
	d20_anyid_source_flag     	string       comment "Def(En): ANYID-SOURCE-FLAG
Def(Th): ขารับเป็บ any id",
	d20_d_reject_flag         	string       comment "Def(En): Reject flag 

Def(Th): flag validate เบื้องต้น status การหักเงิน 
MCL เช็คเบื้องต้นก่อนหลังจากตัดเงินร้านค้าแล้ว ก่อนส่งไปต่าง bank
 ค่า 'G' คือ Good สามารถทำรายการได้
ที่เหลือถือเป็น Reject ทั้งหมด
เป็น flag ภายในที่ mcl ใช้เลื่อกรายการส่งออก",
	d20_d_post_date           	date         comment "Def(En): Post Date(ฝั่ง KBANK) เข้าบัญชีพัก BOT",
	d20_d_post_time           	string       comment "Def(En): Post Time
Def(Th):",
	d20_d_round_deduct_no     	smallint     comment "Def(En): Batch Round No.
Def(Th):  จำนวนครั้งที่ไปตัดร้านค้าเช่น ต้องตัดเงินร้านค้า 5 ล้าน ถ้ามีเงินแค่ 3ล้านจะตัดไม่ได้ ก็จะไปตัดอีกรอบ ค่าในfield นี้จะกลานเป็น 2 ถ้าตัดไม่ได้เกิน 5 แล้วยังตัไม่ได้ stauts จะเป็น ไม่สำเร็จ",
	d20_d_deduct_flag         	string       comment "Def(En): Deduct Flag
Def(Th): status การตัดเงิน (ฝั่ง KBANK)",
	d20_d_prod_code           	string       comment "Def(En): Product Code
Def(Th):",
	d20_seq_no                	string       comment "Def(En):
Def(Th): เป็น running no ในแต่ละ batch ที่ส่งมา",
	d20_extract_flag          	string       comment "Def(En):
Def(Th): flag บอกส่งข้อมูลให้ ITMX แล้ว",
	d20_d_not_deduct_flag_date	date         comment "Def(En):
Def(Th): ปัจจุบันไม่ได้ใช้ ไม่มีค่า",
	d20_d_merchant_debit_date 	date         comment "Def(En): 
Def(Th):",
	d20_d_trans_status        	string       comment "Def(En): 
Def(Th):",
	d20_d_fee_on_ind_flag     	string       comment "Def(En): fee on indicator
Def(Th):",
	d20_d_deduct_type         	smallint     comment "Def(En): 
Def(Th):",
	d20_d_cust_channel        	smallint     comment "Def(En): CA-CUST               VALUE 1( auto deduct โดย ฝ่ายกช  (ลูกค้าส่งไฟล์มาให้)
CH-CUST               VALUE 2 (มาจาก GCP)
OP-CUST               VALUE 3 (หน่วยงานอื่นๆ เช่น trade,ค่าเช่าตู้ ATM,IB)
SS-CUST               VALUE 4 (ฝ่ายธุรกิจหลักทรัพย์)

Def(Th):",
	d20_d_are_tran_source_id  	string       comment "Def(En): 
Def(Th):",
	d20_d_business_dt         	date         comment "Def(En): 
Def(Th):",
	d20_d_interfaced_date     	date         comment "Def(En): 
Def(Th):",
	d20_d_fee_deduct_flag     	string       comment "Def(En): 
Def(Th):",
	d20_d_terminal_id         	string       comment "Def(En): 
Def(Th):",
	d20_d_user_id             	string       comment "Def(En): 
Def(Th):",
	d20_d_auth_user_id        	string       comment "Def(En): 
Def(Th):",
	d20_d_auth_level          	string       comment "Def(En): 
Def(Th):",
	d20_d_acct_dt             	date         comment "Def(En): 
Def(Th):",
	d20_d_kbank_prod_send     	string       comment "Def(En): 
Def(Th):",
	d20_d_kbank_prod_recev    	string       comment "Def(En): 
Def(Th):",
	d20_d_dom_branch_id_send  	string       comment "Def(En): 
Def(Th):",
	d20_d_dom_branch_id_recv  	string       comment "Def(En): 
Def(Th):",
	d20_d_trn_dt              	date         comment "Def(En): 
Def(Th):",
	d20_d_trn_time            	string       comment "Def(En): 
Def(Th):",
	d20_d_src_sys_flag_send   	string       comment "Def(En): 
Def(Th):",
	d20_d_src_sys_flag_recv   	string       comment "Def(En): 
Def(Th):",
	d20_d_cust_acct           	bigint       comment "Def(En): 
Def(Th):",
	d20_d_deduct_type_2       	smallint     comment "Def(En): 
Def(Th):",
	d20_d_return_code         	string       comment "Def(En): Return code
Def(Th):",
	d20_d_eft_date_sort       	date         comment "Def(En): internal use for ARE ค่าเดียวกับ EFT-DATE (YYYYMMDD)
Def(Th):",
	d20_d_sys_create_seq      	integer      comment "Def(En): 
Def(Th):",
	d20_d_sys_dt              	date         comment "Def(En): 
Def(Th):",
	d20_d_sys_time            	string       comment "Def(En): 
Def(Th):",
	d20_d_anyid_result_flag   	string       comment "Def(En):
Def(Th): รายการ ที่เป็น pp ของ kbank จะถือว่าเป็นรายการ in house
MCL จะไปเช็ค

'S' - success (ที่ส่งมา MCL1D101-D-REV-ACCT-NO =11111111ถ้าไป look up ใน any id เจอจะ updateไป look up ใน any ID MCL1D101-D-REV-ACCT-NO เป็น ar_id จริงและจะไปทำเป็นรายการ in house จึงมีเฉพาะ pp ของ kbank)
'F' - fail
'O' - initial (เช่น trasaction next day ที่ยังไม่มีการ return ผลจากต่าง bank)",
	d20_d_amlo                	string       comment "Def(En):
Def(Th): flag ต้องส่ง  AMLO",
	d20_d_nrb_flag            	string       comment "Def(En): non resident baht
Def(Th): flag ส่งรายกงาน non resident ให้ บข ปีละครั้ง",
	d20_cust_id_comp          	bigint       comment "Def(En): 
Def(Th):",
	d20_d_snd_bank_name       	string       comment "Def(En):
Def(Th): ขา Credit จะเป็น Broker Name
ขา Debit จะเป็น Investor Name (ชื่อลูกค้า)",
	d20_d_snd_bank_tax        	string       comment "Def(En): 
Def(Th):",
	d20_d_rec_bank_name       	string       comment "Def(En): 
Def(Th):",
	d20_d_rec_bank_tax        	string       comment "Def(En): Tax ID
Def(Th):",
	d20_d_status_code         	string       comment "Def(En): 
Def(Th):",
	d20_d_reserve1            	string       comment "Def(En): 
Def(Th):",
	d20_d_reserve2            	string       comment "Def(En): 
Def(Th):",
	d20_d_space               	string       comment "Def(En): 
Def(Th):",
	d20_d_internal_ref        	string       comment "Def(En): Internal Key  MCL
Def(Th):",
	d20_d_comp_code           	integer      comment "Def(En): 
Def(Th):",
	d20_d_trf_type            	string       comment "Def(En): 
Def(Th):",
	d20_d_trf_accno           	string       comment "Def(En):
Def(Th): ขา Debit ใช้ Sending
ขา Credit ใช้ Receiving",
	d20_d_trans_type          	string       comment "Def(En): Debit or Credit
Def(Th):",
	d20_d_ref_code            	string       comment "Def(En): 
Def(Th):",
	d20_d_broker_ref          	string       comment "Def(En): 
Def(Th):",
	d20_d_party_id            	string       comment "Def(En): 
Def(Th):",
	d20_d_broke_flag          	string       comment "Def(En):
Def(Th): บอกว่าเป็นรายย่อยหรือ Broker",
	d20_d_sett_rnd            	string       comment "Def(En): 
Def(Th):",
	d20_drcr_orinal           	string       comment "Def(En): 
Def(Th):",
	d20_ofset_ref             	string       comment "Def(En): 
Def(Th):",
	d20_d_acc_gl              	string       comment "Def(En):
Def(Th): เลขที่บัญชี GL 7 หลัก (2733003)",
	d20_d_status_desc         	string       comment "Def(En): 
Def(Th): Success ถ้า Code เป็น 00",
	d20_d_rquid_dr            	string       comment "Def(En): 
Def(Th):",
	d20_d_rquid_cr            	string       comment "Def(En): 
Def(Th):",
	d20_d_rquid_rf            	string       comment "Def(En): 
Def(Th):",
	d20_d_post_flg            	string       comment "Def(En): 
Def(Th):",
	d20_d_refund_ref          	string       comment "Def(En): 
Def(Th):",
	d20_fee_flg               	string       comment "Def(En): 
Def(Th):",
	d20_record_type           	string       comment "Def(En): 
Def(Th):",
	d20_debit_time            	string       comment "Def(En): 
Def(Th):",
	d20_credit_time           	string       comment "Def(En): 
Def(Th):",
	d20_refund_time           	string       comment "Def(En): 
Def(Th):",
	d20_drfee_time            	string       comment "Def(En): 
Def(Th):",
	d20_err_profcode          	string       comment "Def(En): 
Def(Th):",
	d20_err_profmsg           	string       comment "Def(En): 
Def(Th):",
	d20_chk_bal_flag          	smallint     comment "Def(En): 
Def(Th):",
	d20_mthlyfee_flag         	smallint     comment "Def(En): 
Def(Th):",
	d20_mthlyfee_chg_dt       	smallint     comment "Def(En): 
Def(Th):",
	d20_post_prin             	decimal(15,2) comment "Def(En): 
Def(Th):",
	d20_post_comm             	decimal(15,2) comment "Def(En): 
Def(Th):",
	d20_fee_acct              	bigint       comment "Def(En): 
Def(Th):",
	d20_fee_good_cnt_dr       	integer      comment "Def(En): 
Def(Th):",
	d20_fee_good_dr           	decimal(15,2) comment "Def(En): 
Def(Th):",
	d20_fee_rej_cnt_dr        	integer      comment "Def(En): 
Def(Th):",
	d20_fee_rej_dr            	decimal(15,2) comment "Def(En): 
Def(Th):",
	d20_fee_good_cnt_cr       	integer      comment "Def(En): 
Def(Th):",
	d20_fee_good_cr           	decimal(15,2) comment "Def(En): 
Def(Th):",
	d20_fee_rej_cnt_cr        	integer      comment "Def(En): 
Def(Th):",
	d20_fee_rej_cr            	decimal(15,2) comment "Def(En): 
Def(Th):",
	d20_fee_by_tfo            	string       comment "Def(En): 
Def(Th):",
	load_tms                  	timestamp    comment "Def(En): The timestamp on which the instance of the entity was last updated.
Def(Th): วันที่ที่ระบบได้รับข้อมูลล่าสุด",
	src_sys_id                	string       comment "Def(En): Source system ID
Def(Th):เลขที่แสดงระบบงาน",
	ptn_yyyy                  	string       comment "Def(En): Partition Year (YYYY)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับปี",
	ptn_mm                    	string       comment "Def(En): Partition Month (MM)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับเดือน",
	ptn_dd                    	string       comment "Def(En): Partition Date (DD)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับวัน"
) using delta partitioned by (ptn_yyyy, ptn_mm, ptn_dd) location 'abfss://${storage_persist}/${catalog}/persist_mcl_host/mcl_host_share_mcl2d20_capital' tblproperties (
	'delta.minreaderversion' = '2',
	'delta.minwriterversion' = '5',
	'delta.columnmapping.mode' = 'name'
);