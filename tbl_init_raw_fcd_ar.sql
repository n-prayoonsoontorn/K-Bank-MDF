-- Databricks notebook source
/*---------------------------------------------------------------------------------------------------
# Name: tbl_init_fcd_ar.sql
# Area: fcd
#----------------------------------------------------------------------------------------------------
#
# Change Revision
#----------------------------------------------------------------------------------------------------
# Date....      Who....           Description....
#----------------------------------------------------------------------------------------------------
# 2024-02-20    Pinyarat C.         Initial Version
#
# Target table(s)/view(s): ${catalog}.RAW_FCD.FCD_AR
#--------------------------------------------------------------------------------------------------*/

-- COMMAND --

create table if not exists ${catalog}.raw_fcd.fcd_ar (
	pos_dt                 	date          comment "Business Date or Batch date From Control-M (yyyy-MM-dd)",
	rec_type               	string        comment "Record Type - This is to indicate the body record type (Detail record)",
	src_pos_dt             	date          comment "Def(En): Position Date (Business Date) (Source)
Def(Th): วันที่ของข้อมูล",
	ar_id                  	string        comment "Def(En): Arrangement Id is KBANK original account number. This account number must be unique
Def(Th): เลขที่บํญชี (Account number)",
	sub_ar                 	string        comment "Def(En): Arrangement
Def(Th): เลขที่บัญชีระดับ Sub",
	ar_nm                  	string        comment "Def(En): Arrangment English Name
Def(Th): ชื่อบัญชีภาษาอังกฤษ",
	opn_dt                 	date          comment "Def(En): Account open date
Def(Th): วันที่เปิดบัญชี",
	cls_dt                 	date          comment "Def(En): Closed Date
Def(Th): วันที่ปิดบัญชี",
	eff_dt                 	date          comment "Def(En): Effective Date of each sub arrangement
Def(Th): วันที่เริ่มมีการคิดดอกเบี้ย",
	mat_dt                 	date          comment "Def(En): Maturity date is the due date of the account. 
For all loan accounts and contingent accounts, maturity date should always exist and consistent with original term. In case of Sight Bill product should be set to behavior of customer.
For deposit, maturity date is due date for the term of fixed and special fixed account.
Def(Th): 
กรณีเงินให้สินเชื่อ คือ วันที่ครบกำหนดสัญญา
กรณีเงินฝาก คือ วันที่ครบเทอมของบัญชีฝากประจำและทวีทรัพย์",
	ar_lcs_tp_id           	smallint      comment "Def(En): Arrangement life cycle status type ID
Def(Th): สถานะของบัญชี",
	cst_tp_id              	string        comment "Def(En): Customer type classified align with KBANK standard customer type
Def(Th): รหัสประเภทลูกค้าตามมาตรฐานการจัดประเภทลูกค้าของธนาคาร",
	bsn_code_id            	string        comment "Def(En):  Business code id is the business sector in which the arrangement/customer is belonged to. It should be align with KBANK stardard business code.
Def(Th): รหัสประเภทธุรกิจของลูกค้าหรือบัญชีของลูกค้า ตาม KBANK stardard business code",
	domc_br_no             	string        comment "Def(En):  Branch Number, Code to represent KBank Branch, Domicile Branch
Def(Th): รหัสสาขาเจ้าของบัญชี",
	ccy_abr                	string        comment "Def(En): This is the original currency of which the account is belonged to. The code for this field is character code e.g. THB, USD, EUR etc
Def(Th): รหัสสกุลเงินตาม ISO ตัวอย่างเช่น 'THB', 'USD'",
	ccy_otsnd_bal          	decimal       comment "Def(En): Currency Outstanding balance amount (following the account's currency)
Def(Th): จำนวนเงินของหนี้คงค้างรวมดอกเบี้ย, ยอดเงินคงเหลือตาม currency (ตามสกุลเงินของบัญชี)",
	mid_rate               	decimal       comment "อัตราแลกเปลี่ยนกลับเป็นเงินบาท (ใช้ mid rate)",
	ccy_opn_amt            	decimal       comment "Def(En): This is the opening Balance of the account. (following the account's currency)
Def(Th): จำนวนเงินที่เปิดบัญชี (ตามสกุลเงินของบัญชี)",
	last_cst_avy_dt        	date          comment "Def(En): Transaction Last Date
Def(Th): วันที่ที่ทำรายการล่าสุด
(Transaction Last Date)",
	cust_last_contract_date	date          comment "Def(En): Transaction Last Date
Def(Th): วันที่ที่ทำรายการล่าสุด
(Customer Last Contract Date)",
	psbk_no                	bigint        comment "Def(En): Passbook Number
Def(Th): เลขที่สมุดบัญชี",
	acr_bss_cd             	string        comment "Def(En): Accrual Basis Code is the basis on which the interest accrual on an account is calculated. The accrual basis code should be set according to account’s original currency. The code is expected to be used instead of actual description. 
Def(Th): วิธีการคำนวณดอกเบี้ย โดยพิจารณาจาก จำนวนวันที่คำนวณดอกเบี้ยต่อเดือน/จำนวนวันที่คำนวณดอกเบี้ยต่อปี
ตัวอย่างเช่น 
ปล่อยสินเชื่อ 90 วัน ระบบคิดอัตราดอกเบี้ย  = จำนวนเงินต้น * อัตราดอกเบี้ย / 365 
โดยจำนวนวันที่ระบบจะทำการคิดดอกเบี้ยตามจำนวนวันจริง ณ สิ้นเดือน อย่างเช่น เดือนมกราคม เป็น 31 วัน.,เดือนกุมภาพันธ์ เป็น 29 วัน 
และ จำนวนวันที่ระบบจะทำการคิดดอกเบี้ยต่อปีเป็น 360  วัน
ดังนั้น accrual basis cd =  6 (Actual/ 365)
หมายเหตุ   actual เป็นจำนวนวันจริงที่คำนวณดอกเบี้ยต่อเดือน/ปีตามปฎิทิน",
	int_disbursement_opt   	smallint      comment "Def(En): Interest Paid Option
Def(Th): วิธีการจ่ายดอกเบี้ย เช่น ทบต้น หรือ โอนออกไปบัญชีอื่น
(Int/Div Disbursement Option)",
	int_pymt_frq           	string        comment "Def(En): 
For lending, Interest Payment Frequency is the frequency in which the customer pays their interest. 
For deposit, Interest Payment Frequency is the frequency in which the bank pays interest to the customer.
Def(Th): 
กรณีเงินให้สินเชื่อ คือ ความถี่ในการจ่ายดอกเบี้ยของลูกค้าตามสัญญา 
กรณีเงินฝาก คือ ความถี่ในการจ่ายดอกเบี้ยของธนาคารให้กับลูกค้า",
	last_int_pymt_dt       	date          comment "Def(En): 
For lending, Last Interest Payment Date is the date in which the interest payment is last scheduled before position date.
For deposit, Last Interest Payment Date is the latest date in which the bank pays interest to the customer.
Def(Th): 
กรณีเงินให้สินเชื่อ คือ วันที่ลูกค้าชำระดอกเบี้ยครั้งล่าสุดก่อนวันที่ส่งข้อมูล
กรณีเงินฝาก คือ วันที่ธนาคารจ่ายดอกเบี้ยให้กับลูกค้าครั้งล่าสุด",
	nxt_int_pymt_dt        	date          comment "Def(En): 
For lending, Next Interest Payment Date is the date in which the interest payment is next scheduled nearest to position date.
For deposit, Next Interest Payment Date is the bank will pay interest next time.
Def(Th): 
กรณีเงินให้สินเชื่อ คือ วันที่ลูกค้าจะชำระดอกเบี้ยครั้งถัดไป 
กรณีเงินฝาก คือ วันที่ธนาคารจะชำระดอกเบี้ยครั้งถัดไป",
	eff_int_rate           	decimal       comment "Def(En): Effective interest rate is the current interest rate give to customer. 
Def(Th): อัตราดอกเบี้ยที่แท้จริงที่ใช้ในการคำนวณดอกเบี้ย ณ ปัจจุบัน
Include spread rate",
	eff_int_rate_tp_id     	string        comment "Def(En): Effective Interest Rate Type Id (Index Rate)
Def(Th): ประเภทของดอกเบี้ย",
	int_rate_ind           	string        comment "Def(En): Interest Rate Indicator
Def(Th): รหัสประเภทของดอกเบี้ย (ปกติ, พิเศษ)",
	eff_sprd_int_rate      	string        comment "Def(En): Effective Spread Interest Rate
Def(Th): สเปรด เรท",
	ccy_acr_int_pbl_amt    	decimal       comment "Def(En):  Accrued Interest Payable Amount (following the account's currency)
Def(Th): ดอกเบี้ยสะสมสำหรับเงินฝาก (ตามสกุลเงินของบัญชี)",
	ccy_int_pain_amt       	decimal       comment "Def(En): Interest amount that already paid to customer on that business day. If no interest payment then 0. (following the account's currency)
Def(Th): ดอกเบี้ยที่จ่ายจริงให้กับลูกค้าในวันนั้น ถ้าในวันนั้นไม่มีการจ่ายดอกเบี้ยจะมีค่าเป็น 0 (ตามสกุลเงินของบัญชี)",
	int_cal_st_id          	string        comment "Def(En):  Interest Calculation Status
Def(Th): รหัสประเภทการคิดดอกเบี้ย เช่น 0 หยุดคิดดอกเบี้ย",
	product_grp            	string        comment "Description (En): Product Group
Description (Th): ประเภทบัญชี (แยกว่าเป็น SAV,DDA,CD)",
	ccy_hld_amt            	decimal       comment "1) Description (Eng) : Hold Balance Amount (following the account's currency)
Def(Th): จำนวนเงินที่ห้ามถอน ตัวอย่างเช่นเพื่อกันไว้เป็นหลักประกัน (ตามสกุลเงินของบัญชี)",
	ar_term_prd            	string        comment "Def(En): Arrangemen Term Period
Def(Th): Term ของบัญชีฝากประจำ",
	ar_term_unit_id        	string        comment "Def(En): Arrangemen Term Period Unit
Def(Th): หน่วยของ Term ของบัญชีฝากประจำ",
	line_no                	smallint      comment "Def(En): Passbook Print Line
Def(Th): เลขที่บรรทัดที่พร้อมพิมพ์",
	tax_flag               	smallint      comment "Flag บอกว่าเสียภาษี หรือ ไม่เสียภาษี (0/1)",
	tax_method             	string        comment "Def(En): Int/Div Withholding Calculation Method
Def(Th): วิธีคำนวณการเสียภาษีของบัญชี",
	fwd_acm_ccy_int_amt    	decimal       comment "Def(En): Int/Div Paid Financial Year-to-Date (following the account's currency)
Def(Th): ดอกเบี้ยที่จ่ายในปี (ตามสกุลเงินของบัญชี)",
	fwd_acm_ccy_tax_amt    	decimal       comment "Def(En): Backup Withholding Tax Year-to-date (following the account's currency)
Def(Th): ภาษีที่จ่ายในปี (ตามสกุลเงินของบัญชี)",
	fcd_type               	string        comment "Def(En): FCD TYPE
Def(Th): ประเภทบัญชี FCD",
	product_type           	smallint      comment "Def(En): Product TYPE
Def(Th): ประเภทผลิตภัณฑ์",
	pri_cis_no             	bigint        comment "Def(En): Customer Number
Def(Th): เลขที่ลูกค้า",
	tax_owner              	bigint        comment "Def(En): Tax Owner
Def(Th): ผู้เสียภาษี",
	cr_monthly_tran        	string        comment "Def(En): Credit Monthly Transaction
Def(Th): จำนวนรายการฝากที่สามารถทำได้ในแต่ละเดือน",
	dr_monthly_tran        	string        comment "Def(En): Debit Monthly Transaction
Def(Th): จำนวนรายการถอนที่สามารถทำได้ในแต่ละเดือน",
	cr_value               	string        comment "Def(En): Credit Value
Def(Th): จำนวนเงินที่สามารถฝากได้ต่อรายการ",
	dr_value               	string        comment "Def(En): Debit Value
Def(Th): จำนวนเงินที่สามารถถอนได้ต่อรายการ",
	purpose_of_ac          	string        comment "Def(En): Purpose of the Account
Def(Th): วัตถุประสงค์ของการบัญชี",
	purpose_of_ac_oth      	string        comment "Def(En): Purpose of the Account Other
Def(Th): วัตถุประสงค์ของการบัญชี อื่นๆ ระบุ",
	source_of_deposit      	string        comment "Def(En): Source of deposit
Def(Th): แหล่งที่มาของเงินฝาก",
	source_of_deposit_oth  	string        comment "Def(En): Source of deposit other
Def(Th): แหล่งที่มาของเงินฝาก อื่นๆ ระบุ",
	kbank_product_code     	string        comment "Def(En): KBank Product Code",
	gl_set_code            	string        comment "Def(En): GL Set Code",
	ac_rel_code            	string        comment "Def(En): Account Relationship Code
Def(Th): ประเภทบัญชี เดี่ยว หรือ ร่วม",
	pr_year_acm_ccy_int_amt	decimal       comment "Def(En): Int/Div Paid Financial Prior Year (following the account's currency)
Def(Th): ดอกเบี้ยที่จ่ายในปีก่อน (ตามสกุลเงินของบัญชี)",
	life_acm_ccy_int_amt   	decimal       comment "Def(En): Int/Div Paid Life (following the account's currency)
Def(Th): ดอกเบี้ยที่จ่ายทั้งหมดตั้งแต่มีการเปิดบัญชี (ตามสกุลเงินของบัญชี)",
	pr_year_acm_ccy_tax_amt	decimal       comment "Def(En): Backup Withholding Tax Prior Year (following the account's currency)
Def(Th): ภาษีที่จ่ายในปีก่อน (ตามสกุลเงินของบัญชี)",
	fwd_acm_th_int_amt     	decimal       comment "Def(En): Int/Div Paid Financial Year-to-Date (Thai Baht equivalent)
Def(Th): ดอกเบี้ยที่จ่ายในปี (เทียบเท่าเงินบาท)",
	fwd_acm_th_tax_amt     	decimal       comment "Def(En): Backup Withholding Tax Year-to-date (Thai Baht equivalent)
Def(Th): ภาษีที่จ่ายในปี (เทียบเท่าเงินบาท)",
	pr_year_acm_th_int_amt 	decimal       comment "Def(En): Int/Div Paid Financial Prior Year(Thai Baht equivalent)
Def(Th): ดอกเบี้ยที่จ่ายในปีก่อน (เทียบเท่าเงินบาท)",
	life_acm_th_amt        	decimal       comment "Def(En): Int/Div Paid Life (Thai Baht equivalent)
Def(Th): ดอกเบี้ยที่จ่ายทั้งหมดตั้งแต่มีการเปิดบัญชี (เทียบเท่าเงินบาท)",
	pr_year_acm_th_tax_amt 	decimal       comment "Def(En): Backup Withholding Tax Prior Year (Thai Baht equivalent)
Def(Th): ภาษีที่จ่ายในปีก่อน (เทียบเท่าเงินบาท)",
	th_acr_int_pbl_amt     	decimal       comment "Def(En):  Accrued Interest Payable Amount (Thai Baht equivalent)
Def(Th): ดอกเบี้ยสะสมสำหรับเงินฝาก (เทียบเท่าเงินบาท)",
	th_otsnd_bal           	decimal       comment "Def(En): Currency Outstanding balance amount (Thai Baht equivalent)
Def(Th): จำนวนเงินของหนี้คงค้างรวมดอกเบี้ย, ยอดเงินคงเหลือ (เทียบเท่าเงินบาท)",
	tax_key                	string        comment "Tax Key (Key สำหรับระบุ Method สำหรับการเสียภาษีโดย Mapping Key จาก S1)",
	load_tms               	timestamp     comment "Ingestion job date and timestamp",
	src_sys_id             	string        comment "Source system ID",
	ptn_yyyy               	string        comment "Partition field - year",
	ptn_mm                 	string        comment "Partition field - month",
	ptn_dd                 	string        comment "Partition field - day"
) using delta partitioned by (ptn_yyyy, ptn_mm, ptn_dd) location 'abfss://${storage_raw}/${catalog}/raw_fcd/fcd_ar' tblproperties (
	'delta.minreaderversion' = '2',
	'delta.minwriterversion' = '5',
	'delta.columnmapping.mode' = 'name'
);