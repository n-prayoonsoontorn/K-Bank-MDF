-- Databricks notebook source
/*---------------------------------------------------------------------------------------------------
# Name: tbl_init_raw_cardlink_kb1dh004_cpbmer.sql
# Area: cardlink
#----------------------------------------------------------------------------------------------------
#
# Change Revision
#----------------------------------------------------------------------------------------------------
# Date....      Who....             Description....
#----------------------------------------------------------------------------------------------------
# 2024-08-09   Tanatchporn S.       Initial Version
#
# Target table(s)/view(s): ${catalog}.RAW_CARDLINK.CARDLINK_KB1DH004_CPBMER
#--------------------------------------------------------------------------------------------------*/

-- COMMAND --

create table if not exists ${catalog}.raw_cardlink.cardlink_kb1dh004_cpbmer (
	pos_dt                            	string       comment "Def(En): Position Date
Def(Th): วันที่ของข้อมูล",
	1dh004_d_org                      	string       comment "Def(En): Organisation Code
Def(Th):",
	1dh004_d_acct                     	string       comment "Def(En): Merchant number
Def(Th):",
	1dh004_d_rec_nbr                  	string       comment "Def(En): Record Type Number
Def(Th):",
	1dh004_d_merch_type               	string       comment "Def(En): Merchant Type
Def(Th):",
	1dh004_d_id_name                  	string       comment "Def(En): Merchant Name
Def(Th):",
	1dh004_d_id_city                  	string       comment "Def(En): Merchant City
Def(Th):",
	1dh004_d_id_state                 	string       comment "Def(En): State (TH) 
Def(Th):",
	1dh004_d_tfb_name_1               	string       comment "Def(En): Merchant Thai Name Line 1
Def(Th):",
	1dh004_d_tfb_name_2               	string       comment "Def(En): Merchant Thai Name Line 2
Def(Th):",
	1dh004_d_tfb_addr_1               	string       comment "Def(En): 
Def(Th) :ที่อยู่ 1 (ตามที่จดทะเบียน)",
	1dh004_d_tfb_addr_2               	string       comment "Def(En): 
Def(Th): ที่อยู่ 2 (ตามที่จดทะเบียน)",
	1dh004_d_zip_code                 	string       comment "Def(En): Zip code of merchant
Def(Th):",
	1dh004_d_phone_nmbr               	string       comment "Def(En): Telephone number of merchant
Def(Th):",
	1dh004_d_route_transit            	string       comment "Def(En): BANK-SORT-CODE PCIM02 = R/T
Def(Th):",
	1dh004_d_db_acct_nmbr             	string       comment "Def(En): 
Def(Th): เลขที่บัญชี",
	1dh004_d_contact                  	string       comment "Def(En): Contact name of merchant
Def(Th):",
	1dh004_d_officer_id               	string       comment "Def(En): 
Def(Th): ID เจ้าหน้าที่ ธนาคาร",
	1dh004_d_branch                   	string       comment "Def(En): Bank Branch code of merchant
Def(Th):",
	1dh004_d_agent_bank               	string       comment "Def(En): 
Def(Th): ID เจ้าหน้าที่ ธนาคาร",
	1dh004_d_chain_store              	string       comment "Def(En): Chain store merchant number 
(KBANK,Not used by User) 
Def(Th):",
	1dh004_d_card_status_1            	string       comment "Def(En): Status of Card type 1 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_1         	string       comment "Def(En): Card Type 1 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_2            	string       comment "Def(En): Status of Card type 2 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_2         	string       comment "Def(En): Card Type 2 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_3            	string       comment "Def(En): Status of Card type 3 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_3         	string       comment "Def(En): Card Type 3 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_4            	string       comment "Def(En): Status of Card type 4 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_4         	string       comment "Def(En): Card Type 4 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_5            	string       comment "Def(En): Status of Card type 5 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_5         	string       comment "Def(En): Card Type 5 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_6            	string       comment "Def(En): Status of Card type 6 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_6         	string       comment "Def(En): Card Type 6 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_7            	string       comment "Def(En): Status of Card type 7 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_7         	string       comment "Def(En): Card Type 7 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_8            	string       comment "Def(En): Status of Card type 8 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_8         	string       comment "Def(En): Card Type 8 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_9            	string       comment "Def(En): Status of Card type 9 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_9         	string       comment "Def(En): Card Type 9 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_10           	string       comment "Def(En): Status of Card type 10 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_10        	string       comment "Def(En): Card Type 10 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_11           	string       comment "Def(En): Status of Card type 11 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_11        	string       comment "Def(En): Card Type 11 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_12           	string       comment "Def(En): Status of Card type 12 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_12        	string       comment "Def(En): Card Type 12 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_13           	string       comment "Def(En): Status of Card type 13 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_13        	string       comment "Def(En): Card Type 13 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_14           	string       comment "Def(En): Status of Card type 14 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_14        	string       comment "Def(En): Card Type 14 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_status_15           	string       comment "Def(En): Status of Card type 15 which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_card_card_type_15        	string       comment "Def(En): Card Type 15 (netWork) which this merchant is allowed to make transaction
Def(Th):",
	1dh004_d_pct_of_disc              	string       comment "Def(En):  % of discount (KBANK,Not used by User) 
Def(Th):",
	1dh004_d_hold_stmt_flag           	string       comment "Def(En): A flag determining the type of merchant statement to be produced and whether 
it will be sorted with HOLD and EXCEPTION statements which are sorted and printed
following all other statements. (KBANK,Not used by User) 
Def(Th):",
	1dh004_d_stmt_msg_suppress        	string       comment "Def(En): A flag determining whether the six-line statement message defined on the Organisation 
Record is to be printed on the merchant's statement.(KBANK,Not used by User) 
Def(Th):",
	1dh004_d_merch_adj_flag           	string       comment "Def(En): A flag determining whether the merchant is adjusted (KBANK,Not used by User) 
Def(Th):",
	1dh004_d_disc_method              	string       comment "Def(En): A code specifying the method used when calculating merchant discount. 
If this field is left blank the method defined in field DISC METHOD on the Organisation Record (screen 8) will be applied.

Def(Th):",
	1dh004_d_which_matrix             	string       comment "Def(En): A code of either 1, 2 or 3 denoting which matrix (as previously defined on screen 11 of the Organisation Record) 
is applicable when calculating merchant discount. (Use when 1DH004-D-DISC-METHOD = 3)

Def(Th):",
	1dh004_d_profit_margin            	string       comment "Def(En): A profit margin, expressed as a percentage of sales, which is required after all expenses/costs have been charged. 
(Use when 1DH004-D-DISC-METHOD = 2)

Def(Th):",
	1dh004_d_disc_freq                	string       comment "Def(En): A code denoting when both the merchant statement is produced and discount is charged.

Def(Th):",
	1dh004_d_rej_unauth_over_limit    	string       comment "Def(En): A flag to determine whether deposit transactions entered via PCAD or PCAX will be accepted 
if their values exceed the merchant's floor limit and authorisation codes have not been entered.

Def(Th):",
	1dh004_d_media_type               	string       comment "Def(En): A flag indicating how the merchant's deposit activity is received by the organisation.

Def(Th):",
	1dh004_d_tape_bulletin            	string       comment "Def(En): A flag determining the media of warning bulletins issued to the merchant.

Def(Th):",
	1dh004_d_ach_merch_dp             	string       comment "Def(En): A flag denoting whether transactions will be generated for ACH or BACS in respect of merchant deposits

Def(Th):",
	1dh004_d_ach_merch_chgbk          	string       comment "Def(En): Not used anymore

Def(Th):",
	1dh004_d_user_code_1              	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_user_code_2              	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_user_code_3              	string       comment "Def(En): KBANK Define for Chain Store

Def(Th):",
	1dh004_d_intchg_reject            	string       comment "Def(En): A code which indicates whether data for the merchant is included on the quarterly reports.

Def(Th):",
	1dh004_d_visa_member_id           	string       comment "Def(En): The ID of the VISA merchant signing member. This field is only required for VISA USA members.

Def(Th):",
	1dh004_d_dte_opened               	string       comment "Def(En): 
วันที่ร้านค้ายื่นเปิดร้านค้าหรือวันเกิดเจ้าของร้าน
(YYYY-MM-DD)
Def(Th):",
	1dh004_d_dte_lst_stmt             	string       comment "Def(En): The date on which a statement was last produced for this merchant.
(YYYY-MM-DD)

Def(Th):",
	1dh004_d_dte_lst_visit            	string       comment "Def(En): The date when the merchant was last visited.
(YYYY-MM-DD)

Def(Th):",
	1dh004_d_dte_nxt_visit            	string       comment "Def(En): The date when the merchant is to be visited next.
(YYYY-MM-DD)

Def(Th):",
	1dh004_d_dte_nxt_review           	string       comment "Def(En): The date on which the merchant account is to be reviewed.
(YYYY-MM-DD)

Def(Th):",
	1dh004_d_dte_lst_rte_adj          	string       comment "Def(En): The date on which the merchant account was subject to a discount rate adjustment.
(YYYY-MM-DD)

Def(Th):",
	1dh004_d_dte_lst_maint            	string       comment "Def(En): The date on which a statement was last produced for this merchant
(YYYY-MM-DD)

Def(Th):",
	1dh004_d_dte_user_1               	string       comment "Def(En): 
Def(Th): วันที่เปิด ร้านค้า",
	1dh004_d_dte_user_2               	string       comment "Def(En): KBANK,Not used by User

Def(Th):",
	1dh004_d_nbr_imprinter1           	string       comment "Def(En): The number of Type 1 imprinters issued to the merchant (KBANK,Not used by User)

Def(Th):",
	1dh004_d_nbr_imprinter2           	string       comment "Def(En): The number of Type 2 imprinters issued to the merchant (KBANK,Not used by User)

Def(Th):",
	1dh004_d_nbr_imprinter3           	string       comment "Def(En): The number of Type 3 imprinters issued to the merchant (KBANK,Not used by User)

Def(Th):",
	1dh004_d_nbr_pos_dev1             	string       comment "Def(En):
Def(Th): จำนวน EDC ของธนาคาร",
	1dh004_d_nbr_pos_dev2             	string       comment "Def(En):
Def(Th): จำนวน EDC ที่ธนาคารเช่า",
	1dh004_d_nbr_pos_dev3             	string       comment "Def(En): The number of Type 3 Point of Sales devices issues to the merchant

Def(Th):",
	1dh004_d_ach_merch_disc_fee       	string       comment "Def(En): A code which specifies whether automated direct debits will be generated for discount and fees.

Def(Th):",
	1dh004_d_chain_mer_nbr            	string       comment "Def(En): The number of the merchant at the next level up in a chain relationship. If CHAIN LEVEL is not zero then this field
 must contain the number of a merchant which has a lower value of CHAIN LEVEL than this merchant.
Use if 1DH004-D-MERCH-TYPE = 04,05 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_chain_mer_level          	string       comment "Def(En): The level of the merchant in a chain. A value of 1 is the highest possible level and a value of 9 is the lowest possible level.
A value of zero indicates that the merchant is not in a chain. Use if 1DH004-D-MERCH-TYPE = 04,05 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_chain_stmt_ind           	string       comment "Def(En): Specifies the type of chain merchant statement data to be generated
(KBANK,Not used by User)

Def(Th):",
	1dh004_d_chain_reprt_ind          	string       comment "Def(En): Specifies whether the chain merchant is to be reported on merchant reports 06 and 30-40.
(KBANK,Not used by User)

Def(Th):",
	1dh004_d_chain_sett_ind           	string       comment "Def(En): Specifies whether ACH/BACS transactions for chain merchant settlement of deposits are to be produced.(KBANK,Not used by User)

Def(Th):",
	1dh004_d_chain_disc_ind           	string       comment "Def(En): Specifies whether discount is to be calculated for chain merchat (KBANK,Not used by User)

Def(Th):",
	1dh004_d_chain_fees_ind           	string       comment "Def(En): Specifies whether fees are to be calculated for chain merchant (KBANK,Not used by User)

Def(Th):",
	1dh004_d_chain_dd_ind             	string       comment "Def(En): Specifies whether automated direct debits for discount and fees are to be generated for chain merchant (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_cardh_1_8_from_1    	string       comment "Def(En): Card number from 1 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_1        	string       comment "Def(En): Card operator 1. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_1      	string       comment "Def(En): Card number to 1 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_2    	string       comment "Def(En): Card number from 2 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_2        	string       comment "Def(En): Card operator 2. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_2      	string       comment "Def(En): Card number to 2 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_3    	string       comment "Def(En): Card number from 3 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_3        	string       comment "Def(En): Card operator 3. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_3      	string       comment "Def(En): Card number to 3 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_4    	string       comment "Def(En): Card number from 4 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_4        	string       comment "Def(En): Card operator 4. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_4      	string       comment "Def(En): Card number to 4 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_5    	string       comment "Def(En): Card number from 5 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_5        	string       comment "Def(En): Card operator 5. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_5      	string       comment "Def(En): Card number to 5 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_6    	string       comment "Def(En): Card number from 6 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_6        	string       comment "Def(En): Card operator 6. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_6      	string       comment "Def(En): Card number to 6 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_7    	string       comment "Def(En): Card number from 7 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_7        	string       comment "Def(En): Card operator 7. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_7      	string       comment "Def(En): Card number to 7 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_8    	string       comment "Def(En): Card number from 8 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_8        	string       comment "Def(En): Card operator 8. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_8      	string       comment "Def(En): Card number to 8 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_9    	string       comment "Def(En): Card number from 9 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_9        	string       comment "Def(En): Card operator 9. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_9      	string       comment "Def(En): Card number to 9 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_10   	string       comment "Def(En): Card number from 10 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_10       	string       comment "Def(En): Card operator 10. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_10     	string       comment "Def(En): Card number to 10 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_11   	string       comment "Def(En): Card number from 11 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_11       	string       comment "Def(En): Card operator 11. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_11     	string       comment "Def(En): Card number to 11 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_12   	string       comment "Def(En): Card number from 12 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_12       	string       comment "Def(En): Card operator 12. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_12     	string       comment "Def(En): Card number to 12 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_13   	string       comment "Def(En): Card number from 13 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_13       	string       comment "Def(En): Card operator 13. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_13     	string       comment "Def(En): Card number to 13 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_14   	string       comment "Def(En): Card number from 14 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_14       	string       comment "Def(En): Card operator 14. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_14     	string       comment "Def(En): Card number to 14 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_1_8_from_15   	string       comment "Def(En): Card number from 15 that allowed by this merchant

Def(Th):",
	1dh004_d_card_cardh_oper_15       	string       comment "Def(En): Card operator 15. This field defines the method which is used to determine to which Card Type to post a cardholder transaction.

Def(Th):",
	1dh004_d_card_cardh_1_8_to_15     	string       comment "Def(En): Card number to 15 that allowed by this merchant

Def(Th):",
	1dh004_d_card_per_trans_1         	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card Type 1

Def(Th):",
	1dh004_d_card_nbr_bulletins_1     	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card Type 1 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_1         	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card Type 1 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_1       	string       comment "Def(En): The floor limit applicable to the Card Type 1 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_1         	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card Type 1

Def(Th):",
	1dh004_d_card_intchg_fee_1        	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card Type 1 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_1         	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_2         	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 2

Def(Th):",
	1dh004_d_card_nbr_bulletins_2     	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 2 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_2         	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 2 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_2       	string       comment "Def(En): The floor limit applicable to the Card type 2 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_2         	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 2

Def(Th):",
	1dh004_d_card_intchg_fee_2        	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 2 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_2         	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_3         	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 3

Def(Th):",
	1dh004_d_card_nbr_bulletins_3     	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 3 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_3         	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 3 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_3       	string       comment "Def(En): The floor limit applicable to the Card type 3 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_3         	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 3

Def(Th):",
	1dh004_d_card_intchg_fee_3        	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 3 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_3         	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_4         	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 4

Def(Th):",
	1dh004_d_card_nbr_bulletins_4     	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 4 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_4         	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 4 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_4       	string       comment "Def(En): The floor limit applicable to the Card type 4 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_4         	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 4

Def(Th):",
	1dh004_d_card_intchg_fee_4        	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 4 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_4         	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_5         	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 5

Def(Th):",
	1dh004_d_card_nbr_bulletins_5     	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 5 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_5         	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 5 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_5       	string       comment "Def(En): The floor limit applicable to the Card type 5 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_5         	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 5

Def(Th):",
	1dh004_d_card_intchg_fee_5        	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 5 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_5         	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_6         	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 6

Def(Th):",
	1dh004_d_card_nbr_bulletins_6     	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 6 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_6         	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 6 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_6       	string       comment "Def(En): The floor limit applicable to the Card type 6 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_6         	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 6

Def(Th):",
	1dh004_d_card_intchg_fee_6        	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 6 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_6         	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_7         	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 7

Def(Th):",
	1dh004_d_card_nbr_bulletins_7     	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 7 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_7         	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 7 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_7       	string       comment "Def(En): The floor limit applicable to the Card type 7 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_7         	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 7

Def(Th):",
	1dh004_d_card_intchg_fee_7        	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 7 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_7         	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_8         	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 8

Def(Th):",
	1dh004_d_card_nbr_bulletins_8     	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 8 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_8         	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 8 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_8       	string       comment "Def(En): The floor limit applicable to the Card type 8 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_8         	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 8

Def(Th):",
	1dh004_d_card_intchg_fee_8        	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 8 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_8         	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_9         	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 9

Def(Th):",
	1dh004_d_card_nbr_bulletins_9     	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 9 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_9         	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 9 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_9       	string       comment "Def(En): The floor limit applicable to the Card type 9 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_9         	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 9

Def(Th):",
	1dh004_d_card_intchg_fee_9        	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 9 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_9         	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_10        	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 10

Def(Th):",
	1dh004_d_card_nbr_bulletins_10    	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 10 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_10        	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 10 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_10      	string       comment "Def(En): The floor limit applicable to the Card type 10 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_10        	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 10

Def(Th):",
	1dh004_d_card_intchg_fee_10       	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 10 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_10        	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_11        	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 11

Def(Th):",
	1dh004_d_card_nbr_bulletins_11    	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 11 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_11        	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 11 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_11      	string       comment "Def(En): The floor limit applicable to the Card type 11 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_11        	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 11

Def(Th):",
	1dh004_d_card_intchg_fee_11       	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 11 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_11        	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_12        	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 12

Def(Th):",
	1dh004_d_card_nbr_bulletins_12    	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 12 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_12        	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 12 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_12      	string       comment "Def(En): The floor limit applicable to the Card type 12 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_12        	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 12

Def(Th):",
	1dh004_d_card_intchg_fee_12       	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 12 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_12        	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_13        	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 13

Def(Th):",
	1dh004_d_card_nbr_bulletins_13    	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 13 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_13        	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 13 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_13      	string       comment "Def(En): The floor limit applicable to the Card type 13 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_13        	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 13

Def(Th):",
	1dh004_d_card_intchg_fee_13       	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 13 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_13        	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_14        	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 14

Def(Th):",
	1dh004_d_card_nbr_bulletins_14    	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 14 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_14        	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 14 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_14      	string       comment "Def(En): The floor limit applicable to the Card type 14 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_14        	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 14

Def(Th):",
	1dh004_d_card_intchg_fee_14       	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 14 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_14        	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_card_per_trans_15        	string       comment "Def(En): The per item transaction fee to be charged to the merchant for Card type 15

Def(Th):",
	1dh004_d_card_nbr_bulletins_15    	string       comment "Def(En): The number of warning bulletins to be sent to the merchant for Card type 15 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_rate_15        	string       comment "Def(En): The percentage rate used in calculating the amount of merchant discount based on fee-based sales for Card type 15 (divided by 100 already)

Def(Th):",
	1dh004_d_card_floor_limit_15      	string       comment "Def(En): The floor limit applicable to the Card type 15 (KBANK,Not used by User)

Def(Th):",
	1dh004_d_card_disc_type_15        	string       comment "Def(En): A code which specifies how to calculate the amount of fee-based sales for Card type 15

Def(Th):",
	1dh004_d_card_intchg_fee_15       	string       comment "Def(En): A code which determines whether to charge the merchant interchange fees based on sales volume for Card type 15 (KBANK Define)

Def(Th):",
	1dh004_d_card_user_code_15        	string       comment "Def(En): KBANK Define

Def(Th):",
	1dh004_d_visa_category            	string       comment "Def(En): The merchant category code as defined by VISA and which is also known as the Standard Industry Classification Code (SIC).

Def(Th):",
	1dh004_d_mc_category              	string       comment "Def(En): The merchant category code as defined by MasterCard and which is also known as the Standard Industry Classification Code (SIC)

Def(Th):",
	1dh004_d_pl_category              	string       comment "Def(En): The Standard Industry Classification Code (SIC)

Def(Th):",
	1dh004-d-filler-1                 	string       comment "Def(En): Reserved Field

Def(Th):",
	1dh004_d_jc_category              	string       comment "Def(En): The merchant category code as defined by JCB and which is also known as the Standard Industry Classification Code (SIC).

Def(Th):",
	1dh004_d_cwtd_gross_sales_amt     	string       comment "Def(En): Current Week to Date for VISA card type Gross Sales Amount

Def(Th):",
	1dh004_d_cwtd_avg_tran_amt        	string       comment "Def(En): Current Week to Date for VISA card type average transaction amount (1DH004-D-CWTD-GROSS-SALES-AMT/1DH004-D-CWTD-NBR-DRAFTS)

Def(Th):",
	1dh004_d_cwtd_nbr_drafts          	string       comment "Def(En): Current Week to Date for VISA card type number of sales transaction

Def(Th):",
	1dh004_d_cwtd_nbr_chgbks          	string       comment "Def(En): Current Week to Date for VISA card type number of chargeback transaction

Def(Th):",
	1dh004_d_cwtd_elp_total_days      	string       comment "Def(En): CWTD ELP TOTAL DAYS

Def(Th):",
	1dh004_d_lmf_gross_sales_amt      	string       comment "Def(En): Amount of LMF GROSS SALES

Def(Th):",
	1dh004_d_lmf_avg_tran_amt         	string       comment "Def(En): Amount of LMF AVG Transection

Def(Th):",
	1dh004_d_lmf_nbr_drafts           	string       comment "Def(En): Number LMF DRAFTS

Def(Th):",
	1dh004_d_lmf_nbr_chgbks           	string       comment "Def(En): Number LMF CHGBKS

Def(Th):",
	1dh004_d_mtd_nbr_chgbks           	string       comment "Def(En): Number MTD CHGBKS

Def(Th):",
	1dh004_d_date_last_interrogated   	string       comment "Def(En): DATE LAST INTERROGATED

Def(Th):",
	1dh004_d_pirst_post_date          	string       comment "Def(En): FIRST POST DATE

Def(Th):",
	1dh004_d_monitoring_indicator     	string       comment "Def(En): Monitoring Indicator

Def(Th):",
	1dh004_d_visa_intchg_flag         	string       comment "Def(En): VISA interchange flag 

Def(Th):",
	1dh004_d_visa_auth_inquiry_tc     	string       comment "Def(En): VISA authorize inquiry TC

Def(Th):",
	1dh004_d_visa_specl_cond_1        	string       comment "Def(En): Visa Specal Condition 

Def(Th):",
	1dh004_d_visa_specl_cond_2        	string       comment "Def(En): Visa Specal Condition

Def(Th):",
	1dh004_d_visa_mail_phone_ind      	string       comment "Def(En): E-mail Phone IND

Def(Th):",
	1dh004_d_month_to_date_fields     	string       comment "Def(En): Month to date fields

Def(Th):",
	1dh004_d_pos_cap                  	string       comment "Def(En): Post capacity

Def(Th):",
	1dh004_d_pos_mode                 	string       comment "Def(En): Post entry mode

Def(Th):",
	1dh004_d_auth_source              	string       comment "Def(En): authorize source

Def(Th):",
	1dh004_d_ch_id                    	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_intchg_flag           	string       comment "Def(En): Master interchange flag

Def(Th):",
	1dh004_d_mc_auth_inquiry_tc       	string       comment "Def(En): Master authorize inquiry TC

Def(Th):",
	1dh004_d_mc_epss_intchg_flag      	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_descr_1             	string       comment "Def(En): Card Description 

Def(Th):",
	1dh004_d_card_descr_short_1       	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_assess_1            	string       comment "Def(En): The percentage used to calculate an  assessment fee, based on sale volumn. (Default = zero)

Def(Th):",
	1dh004_d_card_bull_cost_1         	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_on_us_rate_1        	string       comment "Def(En): Card on-us rate 1

Def(Th):",
	1dh004_d_card_on_us_per_item_1    	string       comment "Def(En): card on-us per item 1

Def(Th):",
	1dh004_d_card_descr_2             	string       comment "Def(En): Card Description  เช่น PLAT-CORP VISA

Def(Th):",
	1dh004_d_card_descr_short_2       	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_assess_2            	string       comment "Def(En): The percentage used to calculate an  assessment fee, based on sale volumn. (Default = zero)

Def(Th):",
	1dh004_d_card_bull_cost_2         	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_on_us_rate_2        	string       comment "Def(En): Card on-us rate 2

Def(Th):",
	1dh004_d_card_on_us_per_item_2    	string       comment "Def(En): card on-us per item 2

Def(Th):",
	1dh004_d_card_descr_3             	string       comment "Def(En): Card Description  เช่น PLAT-CORP VISA

Def(Th):",
	1dh004_d_card_descr_short_3       	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_assess_3            	string       comment "Def(En): The percentage used to calculate an  assessment fee, based on sale volumn. (Default = zero)

Def(Th):",
	1dh004_d_card_bull_cost_3         	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_on_us_rate_3        	string       comment "Def(En): Card on-us rate 3

Def(Th):",
	1dh004_d_card_on_us_per_item_3    	string       comment "Def(En): card on-us per item 3

Def(Th):",
	1dh004_d_card_descr_4             	string       comment "Def(En): Card Description  เช่น PLAT-CORP VISA

Def(Th):",
	1dh004_d_card_descr_short_4       	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_assess_4            	string       comment "Def(En): The percentage used to calculate an  assessment fee, based on sale volumn. (Default = zero)

Def(Th):",
	1dh004_d_card_bull_cost_4         	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_on_us_rate_4        	string       comment "Def(En): Card on-us rate 4

Def(Th):",
	1dh004_d_card_on_us_per_item_4    	string       comment "Def(En): card on-us per item 4

Def(Th):",
	1dh004_d_card_descr_5             	string       comment "Def(En): Card Description  เช่น PLAT-CORP VISA

Def(Th):",
	1dh004_d_card_descr_short_5       	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_assess_5            	string       comment "Def(En): The percentage used to calculate an  assessment fee, based on sale volumn. (Default = zero)

Def(Th):",
	1dh004_d_card_bull_cost_5         	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_on_us_rate_5        	string       comment "Def(En): Card on-us rate 5

Def(Th):",
	1dh004_d_card_on_us_per_item_5    	string       comment "Def(En): card on-us per item 5

Def(Th):",
	1dh004_d_card_descr_6             	string       comment "Def(En): Card Description  เช่น PLAT-CORP VISA

Def(Th):",
	1dh004_d_card_descr_short_6       	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_assess_6            	string       comment "Def(En): The percentage used to calculate an  assessment fee, based on sale volumn. (Default = zero)

Def(Th):",
	1dh004_d_card_bull_cost_6         	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_on_us_rate_6        	string       comment "Def(En): Card on-us rate 6

Def(Th):",
	1dh004_d_card_on_us_per_item_6    	string       comment "Def(En): card on-us per item 6

Def(Th):",
	1dh004_d_jcb_state_code           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_area_code            	string       comment "Def(En): JCB Area CODE 

Def(Th):",
	1dh004-d-jcb-filler               	string       comment "Def(En): 
Def(Th):",
	1dh004_d_chg_admin                	string       comment "Def(En): 
Def(Th):",
	1dh004_d_min_disc_chg             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pee_on_chgbk             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_misc3_fee_chg            	string       comment "Def(En): 
Def(Th):",
	1dh004_d_per_item_chg             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_stmt_fee_chg             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pee_on_qual_rej          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_check_approval_fee       	string       comment "Def(En): check approval fee

Def(Th):",
	1dh004_d_admin_fee                	string       comment "Def(En): admin fee

Def(Th):",
	1dh004_d_chgbk_fee                	string       comment "Def(En): 
Def(Th):",
	1dh004_d_qual_rej_fee             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_min_disc_amt             	string       comment "Def(En): minimun discount amount

Def(Th):",
	1dh004_d_misc3_fee                	string       comment "Def(En): 
Def(Th):",
	1dh004_d_stmt_fee                 	string       comment "Def(En): statement fee

Def(Th):",
	1dh004_d_memb_fee_freq            	string       comment "Def(En): 
Def(Th):",
	1dh004_d_type_of_stmt             	string       comment "Def(En): type of statement

Def(Th):",
	1dh004_d_exc_chgbk_mth_org_mnt    	string       comment "Def(En): 
Def(Th):",
	1dh004_d_exc_qual_rej_mth_org_mnt 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_exc_chgbk_mth            	string       comment "Def(En): 
Def(Th):",
	1dh004_d_exc_qual_rej_mth         	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_chgbacks_ctd         	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_chgbacks_ctd         	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_chk_appr_ctd         	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_chk_appr_chgs_ctd    	string       comment "Def(En): 
Def(Th):",
	1dh004_d_proj_avg_tkt             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_proj_mth_volume          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_avg_tkt_ranges_1         	string       comment "Def(En): private lable total on-us item 1

Def(Th):",
	1dh004_d_avg_tkt_ranges_2         	string       comment "Def(En): private lable total on-us rate 2

Def(Th):",
	1dh004_d_avg_tkt_ranges_3         	string       comment "Def(En): private lable total on-us item 2

Def(Th):",
	1dh004_d_avg_tkt_ranges_4         	string       comment "Def(En): private lable total on-us rate 3

Def(Th):",
	1dh004_d_avg_tkt_ranges_5         	string       comment "Def(En): private lable total on-us item 3

Def(Th):",
	1dh004_d_pl_tot_on_us_rate        	string       comment "Def(En): private lable total on-us rate 4

Def(Th):",
	1dh004_d_pl_tot_on_us_item        	string       comment "Def(En): private lable total on-us item 4

Def(Th):",
	filler1                           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_nbr_outgo_sales_1     	string       comment "Def(En): VISA number outgo sale 1

Def(Th):",
	1dh004_d_vi_amt_outgo_sales_1     	string       comment "Def(En): VISA amount outgo sale 1

Def(Th):",
	1dh004_d_vi_nbr_outgo_returns_1   	string       comment "Def(En): VISA number outgo returns 1

Def(Th):",
	1dh004_d_vi_amt_outgo_returns_1   	string       comment "Def(En): VISA amount outgo returns 1

Def(Th):",
	1dh004_d_vi_nbr_nonqual_sales_1   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_amt_nonqual_sales_1   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_nbr_nonqual_returns_1 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_amt_nonqual_returns_1 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_nbr_total_sales_1     	string       comment "Def(En): VISA number total sales 1

Def(Th):",
	1dh004_d_vi_amt_total_sales_1     	string       comment "Def(En): VISA amount total sales 1

Def(Th):",
	1dh004_d_vi_nbr_total_returns_1   	string       comment "Def(En): VISA number total return 1

Def(Th):",
	1dh004_d_vi_amt_total_returns_1   	string       comment "Def(En): VISA amount total return 1

Def(Th):",
	1dh004_d_vi_amt_total_per_trans_1 	string       comment "Def(En): VISA amount total per transaction 1

Def(Th):",
	1dh004_d_vi_amt_disc_1            	string       comment "Def(En): VISA amount discount 1

Def(Th):",
	1dh004_d_vi_effect_rate_1         	string       comment "Def(En): VISA effect rate 1

Def(Th):",
	1dh004_d_mc_nbr_outgo_sales_1     	string       comment "Def(En): Master card number outgo sale 1

Def(Th):",
	1dh004_d_mc_amt_outgo_sales_1     	string       comment "Def(En): Master card amount outgo sale 1

Def(Th):",
	1dh004_d_mc_nbr_outgo_returns_1   	string       comment "Def(En): Master card number outgo returns 1

Def(Th):",
	1dh004_d_mc_amt_outgo_returns_1   	string       comment "Def(En): Master card amount outgo returns 1

Def(Th):",
	1dh004_d_mc_nbr_nonqual_sales_1   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_amt_nonqual_sales_1   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_nbr_nonqual_returns_1 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_amt_nonqual_returns_1 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_nbr_total_sales_1     	string       comment "Def(En): Master card number total sales 1

Def(Th):",
	1dh004_d_mc_amt_total_sales_1     	string       comment "Def(En): Master card amount total sales 1

Def(Th):",
	1dh004_d_mc_nbr_total_returns_1   	string       comment "Def(En): Master card number total return 1

Def(Th):",
	1dh004_d_mc_amt_total_returns_1   	string       comment "Def(En): Master card amount total return 1

Def(Th):",
	1dh004_d_mc_amt_total_per_trans_1 	string       comment "Def(En): Master card amount total per transaction 1

Def(Th):",
	1dh004_d_mc_amt_disc_1            	string       comment "Def(En): Master card amount discount 1

Def(Th):",
	1dh004_d_mc_effect_rate_1         	string       comment "Def(En): Master card effect rate 1

Def(Th):",
	1dh004_d_pl_nbr_outgo_sales_1     	string       comment "Def(En): Private card number outgo sale 1

Def(Th):",
	1dh004_d_pl_amt_outgo_sales_1     	string       comment "Def(En): Private card amount outgo sale 1

Def(Th):",
	1dh004_d_pl_nbr_outgo_returns_1   	string       comment "Def(En): Private card number outgo returns 1

Def(Th):",
	1dh004_d_pl_amt_outgo_returns_1   	string       comment "Def(En): Private card amount outgo returns 1

Def(Th):",
	1dh004_d_pl_nbr_nonqual_sales_1   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_amt_nonqual_sales_1   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_nbr_nonqual_returns_1 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_amt_nonqual_returns_1 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_nbr_total_sales_1     	string       comment "Def(En): Private card number total sales 1

Def(Th):",
	1dh004_d_pl_amt_total_sales_1     	string       comment "Def(En): Private card amount total sales 1

Def(Th):",
	1dh004_d_pl_nbr_total_returns_1   	string       comment "Def(En): Private card number total return 1

Def(Th):",
	1dh004_d_pl_amt_total_returns_1   	string       comment "Def(En): Private card amount total return 1

Def(Th):",
	1dh004_d_pl_amt_total_per_trans_1 	string       comment "Def(En): Private card amount total per transaction 1

Def(Th):",
	1dh004_d_pl_amt_disc_1            	string       comment "Def(En): Private card amount discount 1

Def(Th):",
	1dh004_d_pl_effect_rate_1         	string       comment "Def(En): Private card effect rate 1

Def(Th):",
	1dh004_d_jcb_nbr_outgo_sales_1    	string       comment "Def(En): JCB number outgo sale 1

Def(Th):",
	1dh004_d_jcb_amt_outgo_sales_1    	string       comment "Def(En): JCB amount outgo sale 1

Def(Th):",
	1dh004_d_jcb_nbr_outgo_returns_1  	string       comment "Def(En): JCB number outgo returns 1

Def(Th):",
	1dh004_d_jcb_amt_outgo_returns_1  	string       comment "Def(En): JCB amount outgo returns 1

Def(Th):",
	1dh004_d_jcb_nbr_nonqual_sales_1  	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_amt_nonqual_sales_1  	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_nbr_nonqual_returns_1	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_amt_nonqual_returns_1	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_nbr_total_sales_1    	string       comment "Def(En): JCB number total sales 1

Def(Th):",
	1dh004_d_jcb_amt_total_sales_1    	string       comment "Def(En): JCB amount total sales 1

Def(Th):",
	1dh004_d_jcb_nbr_total_returns_1  	string       comment "Def(En): JCB number total return 1

Def(Th):",
	1dh004_d_jcb_amt_total_returns_1  	string       comment "Def(En): JCB amount total return 1

Def(Th):",
	1dh004_d_jcb_amt_total_per_trans_1	string       comment "Def(En): JCB amount total per transaction 1

Def(Th):",
	1dh004_d_jcb_amt_disc_1           	string       comment "Def(En): JCB amount discount 1

Def(Th):",
	1dh004_d_jcb_effect_rate_1        	string       comment "Def(En): JCB effect rate 1

Def(Th):",
	1dh004_d_amt_fees_1               	string       comment "Def(En): amount fee 1

Def(Th):",
	1dh004_d_amt_disc_1               	string       comment "Def(En): amount discount 1

Def(Th):",
	1dh004_d_amt_org_expense_1        	string       comment "Def(En): amount org. expense 1

Def(Th):",
	1dh004_d_effect_rate_1            	string       comment "Def(En): effect rate 1

Def(Th):",
	1dh004_d_nbr_of_dep_days_1        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos1_auth_1          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos2_auth_1          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos3_auth_1          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_voice_auth_1         	string       comment "Def(En): number voice authorize 1

Def(Th):",
	1dh004_d_tot_nbr_dep_1            	string       comment "Def(En): 
Def(Th):",
	1dh004_d_tot_nbr_drafts_1         	string       comment "Def(En): total number drafts 1

Def(Th):",
	1dh004_d_nbr_pos1_drafts_1        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos2_drafts_1        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos3_drafts_1        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_tape_drafts_1        	string       comment "Def(En): number tape drafts 1

Def(Th):",
	1dh004_d_nbr_keyed_dep_1          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_keyed_drafts_1       	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_qual_rej_1           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_qual_rej_1           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_chgbacks_1           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_chgbacks_1           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_chk_appr_1           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_chk_appr_chgs_1      	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_memb_fee_1           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_imp1_fee_1           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_imp2_fee_1           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_imp3_fee_1           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_pos1_fee_1           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_pos2_fee_1           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_pos3_fee_1           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_disc_adj_1           	string       comment "Def(En): number discount adjust 1

Def(Th):",
	1dh004_d_amt_disc_adj_1           	string       comment "Def(En): amount discount adjust 1

Def(Th):",
	1dh004_d_nbr_fee_adj_1            	string       comment "Def(En): number fee adjust 1

Def(Th):",
	1dh004_d_amt_fee_adj_1            	string       comment "Def(En): amount fee adjust 1

Def(Th):",
	1dh004_d_amt_per_trans_1          	string       comment "Def(En): amount per transaction 1

Def(Th):",
	1dh004_d_slsa_nbr_1_1             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_1_1             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_1_2             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_1_2             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_1_3             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_1_3             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_1_4             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_1_4             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_1_5             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_1_5             	string       comment "Def(En): 
Def(Th):",
	filler2                           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_nbr_outgo_sales_2     	string       comment "Def(En): VISA number outgo sale 2

Def(Th):",
	1dh004_d_vi_amt_outgo_sales_2     	string       comment "Def(En): VISA amount outgo sale 2

Def(Th):",
	1dh004_d_vi_nbr_outgo_returns_2   	string       comment "Def(En): VISA number outgo returns 2

Def(Th):",
	1dh004_d_vi_amt_outgo_returns_2   	string       comment "Def(En): VISA amount outgo returns 2

Def(Th):",
	1dh004_d_vi_nbr_nonqual_sales_2   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_amt_nonqual_sales_2   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_nbr_nonqual_returns_2 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_amt_nonqual_returns_2 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_nbr_total_sales_2     	string       comment "Def(En): VISA number total sales 2

Def(Th):",
	1dh004_d_vi_amt_total_sales_2     	string       comment "Def(En): VISA amount total sales 2

Def(Th):",
	1dh004_d_vi_nbr_total_returns_2   	string       comment "Def(En): VISA number total return 2

Def(Th):",
	1dh004_d_vi_amt_total_returns_2   	string       comment "Def(En): VISA amount total return 2

Def(Th):",
	1dh004_d_vi_amt_total_per_trans_2 	string       comment "Def(En): VISA amount total per transaction 2

Def(Th):",
	1dh004_d_vi_amt_disc_2            	string       comment "Def(En): VISA amount discount 2

Def(Th):",
	1dh004_d_vi_effect_rate_2         	string       comment "Def(En): VISA effect rate 2

Def(Th):",
	1dh004_d_mc_nbr_outgo_sales_2     	string       comment "Def(En): Master card number outgo sale 2

Def(Th):",
	1dh004_d_mc_amt_outgo_sales_2     	string       comment "Def(En): Master card amount outgo sale 2

Def(Th):",
	1dh004_d_mc_nbr_outgo_returns_2   	string       comment "Def(En): Master card number outgo returns 2

Def(Th):",
	1dh004_d_mc_amt_outgo_returns_2   	string       comment "Def(En): Master card amount outgo returns 2

Def(Th):",
	1dh004_d_mc_nbr_nonqual_sales_2   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_amt_nonqual_sales_2   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_nbr_nonqual_returns_2 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_amt_nonqual_returns_2 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_nbr_total_sales_2     	string       comment "Def(En): Master card number total sales 2

Def(Th):",
	1dh004_d_mc_amt_total_sales_2     	string       comment "Def(En): Master card amount total sales 2

Def(Th):",
	1dh004_d_mc_nbr_total_returns_2   	string       comment "Def(En): Master card number total return 2

Def(Th):",
	1dh004_d_mc_amt_total_returns_2   	string       comment "Def(En): Master card amount total return 2

Def(Th):",
	1dh004_d_mc_amt_total_per_trans_2 	string       comment "Def(En): Master card amount total per transaction 2

Def(Th):",
	1dh004_d_mc_amt_disc_2            	string       comment "Def(En): Master card amount discount 2

Def(Th):",
	1dh004_d_mc_effect_rate_2         	string       comment "Def(En): Master card effect rate 2

Def(Th):",
	1dh004_d_pl_nbr_outgo_sales_2     	string       comment "Def(En): Private card number outgo sale 2

Def(Th):",
	1dh004_d_pl_amt_outgo_sales_2     	string       comment "Def(En): Private card amount outgo sale 2

Def(Th):",
	1dh004_d_pl_nbr_outgo_returns_2   	string       comment "Def(En): Private card number outgo returns 2

Def(Th):",
	1dh004_d_pl_amt_outgo_returns_2   	string       comment "Def(En): Private card amount outgo returns 2

Def(Th):",
	1dh004_d_pl_nbr_nonqual_sales_2   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_amt_nonqual_sales_2   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_nbr_nonqual_returns_2 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_amt_nonqual_returns_2 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_nbr_total_sales_2     	string       comment "Def(En): Private card number total sales 2

Def(Th):",
	1dh004_d_pl_amt_total_sales_2     	string       comment "Def(En): Private card amount total sales 2

Def(Th):",
	1dh004_d_pl_nbr_total_returns_2   	string       comment "Def(En): Private card number total return 2

Def(Th):",
	1dh004_d_pl_amt_total_returns_2   	string       comment "Def(En): Private card amount total return 2

Def(Th):",
	1dh004_d_pl_amt_total_per_trans_2 	string       comment "Def(En): Private card amount total per transaction 2

Def(Th):",
	1dh004_d_pl_amt_disc_2            	string       comment "Def(En): Private card amount discount 2

Def(Th):",
	1dh004_d_pl_effect_rate_2         	string       comment "Def(En): Private card effect rate 2

Def(Th):",
	1dh004_d_jcb_nbr_outgo_sales_2    	string       comment "Def(En): JCB number outgo sale 2

Def(Th):",
	1dh004_d_jcb_amt_outgo_sales_2    	string       comment "Def(En): JCB amount outgo sale 2

Def(Th):",
	1dh004_d_jcb_nbr_outgo_returns_2  	string       comment "Def(En): JCB number outgo returns 2

Def(Th):",
	1dh004_d_jcb_amt_outgo_returns_2  	string       comment "Def(En): JCB amount outgo returns 2

Def(Th):",
	1dh004_d_jcb_nbr_nonqual_sales_2  	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_amt_nonqual_sales_2  	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_nbr_nonqual_returns_2	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_amt_nonqual_returns_2	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_nbr_total_sales_2    	string       comment "Def(En): JCB number total sales 2

Def(Th):",
	1dh004_d_jcb_amt_total_sales_2    	string       comment "Def(En): JCB amount total sales 2

Def(Th):",
	1dh004_d_jcb_nbr_total_returns_2  	string       comment "Def(En): JCB number total return 2

Def(Th):",
	1dh004_d_jcb_amt_total_returns_2  	string       comment "Def(En): JCB amount total return 2

Def(Th):",
	1dh004_d_jcb_amt_total_per_trans_2	string       comment "Def(En): JCB amount total per transaction 2

Def(Th):",
	1dh004_d_jcb_amt_disc_2           	string       comment "Def(En): JCB amount discount 2

Def(Th):",
	1dh004_d_jcb_effect_rate_2        	string       comment "Def(En): JCB effect rate 2

Def(Th):",
	1dh004_d_amt_fees_2               	string       comment "Def(En): amount fee 2

Def(Th):",
	1dh004_d_amt_disc_2               	string       comment "Def(En): amount discount 2

Def(Th):",
	1dh004_d_amt_org_expense_2        	string       comment "Def(En): amount org. expense 2

Def(Th):",
	1dh004_d_effect_rate_2            	string       comment "Def(En): effect rate 2

Def(Th):",
	1dh004_d_nbr_of_dep_days_2        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos1_auth_2          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos2_auth_2          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos3_auth_2          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_voice_auth_2         	string       comment "Def(En): number voice authorize 2

Def(Th):",
	1dh004_d_tot_nbr_dep_2            	string       comment "Def(En): 
Def(Th):",
	1dh004_d_tot_nbr_drafts_2         	string       comment "Def(En): total number drafts 2

Def(Th):",
	1dh004_d_nbr_pos1_drafts_2        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos2_drafts_2        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos3_drafts_2        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_tape_drafts_2        	string       comment "Def(En): number tape drafts 2

Def(Th):",
	1dh004_d_nbr_keyed_dep_2          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_keyed_drafts_2       	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_qual_rej_2           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_qual_rej_2           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_chgbacks_2           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_chgbacks_2           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_chk_appr_2           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_chk_appr_chgs_2      	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_memb_fee_2           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_imp1_fee_2           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_imp2_fee_2           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_imp3_fee_2           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_pos1_fee_2           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_pos2_fee_2           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_pos3_fee_2           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_disc_adj_2           	string       comment "Def(En): number discount adjust 2

Def(Th):",
	1dh004_d_amt_disc_adj_2           	string       comment "Def(En): amount discount adjust 2

Def(Th):",
	1dh004_d_nbr_fee_adj_2            	string       comment "Def(En): number fee adjust 2

Def(Th):",
	1dh004_d_amt_fee_adj_2            	string       comment "Def(En): amount fee adjust 2

Def(Th):",
	1dh004_d_amt_per_trans_2          	string       comment "Def(En): amount per transaction 2

Def(Th):",
	1dh004_d_slsa_nbr_2_1             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_2_1             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_2_2             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_2_2             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_2_3             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_2_3             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_2_4             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_2_4             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_2_5             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_2_5             	string       comment "Def(En): 
Def(Th):",
	filler3                           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_nbr_outgo_sales_3     	string       comment "Def(En): VISA number outgo sale 3

Def(Th):",
	1dh004_d_vi_amt_outgo_sales_3     	string       comment "Def(En): VISA amount outgo sale 3

Def(Th):",
	1dh004_d_vi_nbr_outgo_returns_3   	string       comment "Def(En): VISA number outgo returns 3

Def(Th):",
	1dh004_d_vi_amt_outgo_returns_3   	string       comment "Def(En): VISA amount outgo returns 3

Def(Th):",
	1dh004_d_vi_nbr_nonqual_sales_3   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_amt_nonqual_sales_3   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_nbr_nonqual_returns_3 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_amt_nonqual_returns_3 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_nbr_total_sales_3     	string       comment "Def(En): VISA number total sales 3

Def(Th):",
	1dh004_d_vi_amt_total_sales_3     	string       comment "Def(En): VISA amount total sales 3

Def(Th):",
	1dh004_d_vi_nbr_total_returns_3   	string       comment "Def(En): VISA number total return 3

Def(Th):",
	1dh004_d_vi_amt_total_returns_3   	string       comment "Def(En): VISA amount total return 3

Def(Th):",
	1dh004_d_vi_amt_total_per_trans_3 	string       comment "Def(En): VISA amount total per transaction 3

Def(Th):",
	1dh004_d_vi_amt_disc_3            	string       comment "Def(En): VISA amount discount 3

Def(Th):",
	1dh004_d_vi_effect_rate_3         	string       comment "Def(En): VISA effect rate 3

Def(Th):",
	1dh004_d_mc_nbr_outgo_sales_3     	string       comment "Def(En): Master card number outgo sale 3

Def(Th):",
	1dh004_d_mc_amt_outgo_sales_3     	string       comment "Def(En): Master card amount outgo sale 3

Def(Th):",
	1dh004_d_mc_nbr_outgo_returns_3   	string       comment "Def(En): Master card number outgo returns 3

Def(Th):",
	1dh004_d_mc_amt_outgo_returns_3   	string       comment "Def(En): Master card amount outgo returns 3

Def(Th):",
	1dh004_d_mc_nbr_nonqual_sales_3   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_amt_nonqual_sales_3   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_nbr_nonqual_returns_3 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_amt_nonqual_returns_3 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_nbr_total_sales_3     	string       comment "Def(En): Master card number total sales 3

Def(Th):",
	1dh004_d_mc_amt_total_sales_3     	string       comment "Def(En): Master card amount total sales 3

Def(Th):",
	1dh004_d_mc_nbr_total_returns_3   	string       comment "Def(En): Master card number total return 3

Def(Th):",
	1dh004_d_mc_amt_total_returns_3   	string       comment "Def(En): Master card amount total return 3

Def(Th):",
	1dh004_d_mc_amt_total_per_trans_3 	string       comment "Def(En): Master card amount total per transaction 3

Def(Th):",
	1dh004_d_mc_amt_disc_3            	string       comment "Def(En): Master card amount discount 3

Def(Th):",
	1dh004_d_mc_effect_rate_3         	string       comment "Def(En): Master card effect rate 3

Def(Th):",
	1dh004_d_pl_nbr_outgo_sales_3     	string       comment "Def(En): Private card number outgo sale 3

Def(Th):",
	1dh004_d_pl_amt_outgo_sales_3     	string       comment "Def(En): Private card amount outgo sale 3

Def(Th):",
	1dh004_d_pl_nbr_outgo_returns_3   	string       comment "Def(En): Private card number outgo returns 3

Def(Th):",
	1dh004_d_pl_amt_outgo_returns_3   	string       comment "Def(En): Private card amount outgo returns 3

Def(Th):",
	1dh004_d_pl_nbr_nonqual_sales_3   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_amt_nonqual_sales_3   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_nbr_nonqual_returns_3 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_amt_nonqual_returns_3 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_nbr_total_sales_3     	string       comment "Def(En): Private card number total sales 3

Def(Th):",
	1dh004_d_pl_amt_total_sales_3     	string       comment "Def(En): Private card amount total sales 3

Def(Th):",
	1dh004_d_pl_nbr_total_returns_3   	string       comment "Def(En): Private card number total return 3

Def(Th):",
	1dh004_d_pl_amt_total_returns_3   	string       comment "Def(En): Private card amount total return 3

Def(Th):",
	1dh004_d_pl_amt_total_per_trans_3 	string       comment "Def(En): Private card amount total per transaction 3

Def(Th):",
	1dh004_d_pl_amt_disc_3            	string       comment "Def(En): Private card amount discount 3

Def(Th):",
	1dh004_d_pl_effect_rate_3         	string       comment "Def(En): Private card effect rate 3

Def(Th):",
	1dh004_d_jcb_nbr_outgo_sales_3    	string       comment "Def(En): JCB number outgo sale 3

Def(Th):",
	1dh004_d_jcb_amt_outgo_sales_3    	string       comment "Def(En): JCB amount outgo sale 3

Def(Th):",
	1dh004_d_jcb_nbr_outgo_returns_3  	string       comment "Def(En): JCB number outgo returns 3

Def(Th):",
	1dh004_d_jcb_amt_outgo_returns_3  	string       comment "Def(En): JCB amount outgo returns 3

Def(Th):",
	1dh004_d_jcb_nbr_nonqual_sales_3  	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_amt_nonqual_sales_3  	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_nbr_nonqual_returns_3	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_amt_nonqual_returns_3	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_nbr_total_sales_3    	string       comment "Def(En): JCB number total sales 3

Def(Th):",
	1dh004_d_jcb_amt_total_sales_3    	string       comment "Def(En): JCB amount total sales 3

Def(Th):",
	1dh004_d_jcb_nbr_total_returns_3  	string       comment "Def(En): JCB number total return 3

Def(Th):",
	1dh004_d_jcb_amt_total_returns_3  	string       comment "Def(En): JCB amount total return 3

Def(Th):",
	1dh004_d_jcb_amt_total_per_trans_3	string       comment "Def(En): JCB amount total per transaction 3

Def(Th):",
	1dh004_d_jcb_amt_disc_3           	string       comment "Def(En): JCB amount discount 3

Def(Th):",
	1dh004_d_jcb_effect_rate_3        	string       comment "Def(En): JCB effect rate 3

Def(Th):",
	1dh004_d_amt_fees_3               	string       comment "Def(En): amount fee 3

Def(Th):",
	1dh004_d_amt_disc_3               	string       comment "Def(En): amount discount 3

Def(Th):",
	1dh004_d_amt_org_expense_3        	string       comment "Def(En): amount org. expense 3

Def(Th):",
	1dh004_d_effect_rate_3            	string       comment "Def(En): effect rate 3

Def(Th):",
	1dh004_d_nbr_of_dep_days_3        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos1_auth_3          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos2_auth_3          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos3_auth_3          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_voice_auth_3         	string       comment "Def(En): number voice authorize 3

Def(Th):",
	1dh004_d_tot_nbr_dep_3            	string       comment "Def(En): 
Def(Th):",
	1dh004_d_tot_nbr_drafts_3         	string       comment "Def(En): total number drafts 3

Def(Th):",
	1dh004_d_nbr_pos1_drafts_3        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos2_drafts_3        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos3_drafts_3        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_tape_drafts_3        	string       comment "Def(En): number tape drafts 3

Def(Th):",
	1dh004_d_nbr_keyed_dep_3          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_keyed_drafts_3       	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_qual_rej_3           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_qual_rej_3           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_chgbacks_3           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_chgbacks_3           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_chk_appr_3           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_chk_appr_chgs_3      	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_memb_fee_3           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_imp1_fee_3           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_imp2_fee_3           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_imp3_fee_3           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_pos1_fee_3           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_pos2_fee_3           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_pos3_fee_3           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_disc_adj_3           	string       comment "Def(En): number discount adjust 3

Def(Th):",
	1dh004_d_amt_disc_adj_3           	string       comment "Def(En): amount discount adjust 3

Def(Th):",
	1dh004_d_nbr_fee_adj_3            	string       comment "Def(En): number fee adjust 3

Def(Th):",
	1dh004_d_amt_fee_adj_3            	string       comment "Def(En): amount fee adjust 3

Def(Th):",
	1dh004_d_amt_per_trans_3          	string       comment "Def(En): amount per transaction 3

Def(Th):",
	1dh004_d_slsa_nbr_3_1             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_3_1             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_3_2             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_3_2             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_3_3             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_3_3             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_3_4             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_3_4             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_3_5             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_3_5             	string       comment "Def(En): 
Def(Th):",
	filler4                           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_nbr_outgo_sales_4     	string       comment "Def(En): VISA number outgo sale 4

Def(Th):",
	1dh004_d_vi_amt_outgo_sales_4     	string       comment "Def(En): VISA amount outgo sale 4

Def(Th):",
	1dh004_d_vi_nbr_outgo_returns_4   	string       comment "Def(En): VISA number outgo returns 4

Def(Th):",
	1dh004_d_vi_amt_outgo_returns_4   	string       comment "Def(En): VISA amount outgo returns 4

Def(Th):",
	1dh004_d_vi_nbr_nonqual_sales_4   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_amt_nonqual_sales_4   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_nbr_nonqual_returns_4 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_amt_nonqual_returns_4 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_vi_nbr_total_sales_4     	string       comment "Def(En): VISA number total sales 4

Def(Th):",
	1dh004_d_vi_amt_total_sales_4     	string       comment "Def(En): VISA amount total sales 4

Def(Th):",
	1dh004_d_vi_nbr_total_returns_4   	string       comment "Def(En): VISA number total return 4

Def(Th):",
	1dh004_d_vi_amt_total_returns_4   	string       comment "Def(En): VISA amount total return 4

Def(Th):",
	1dh004_d_vi_amt_total_per_trans_4 	string       comment "Def(En): VISA amount total per transaction 4

Def(Th):",
	1dh004_d_vi_amt_disc_4            	string       comment "Def(En): VISA amount discount 4

Def(Th):",
	1dh004_d_vi_effect_rate_4         	string       comment "Def(En): VISA effect rate 4

Def(Th):",
	1dh004_d_mc_nbr_outgo_sales_4     	string       comment "Def(En): Master card number outgo sale 4

Def(Th):",
	1dh004_d_mc_amt_outgo_sales_4     	string       comment "Def(En): Master card amount outgo sale 4

Def(Th):",
	1dh004_d_mc_nbr_outgo_returns_4   	string       comment "Def(En): Master card number outgo returns 4

Def(Th):",
	1dh004_d_mc_amt_outgo_returns_4   	string       comment "Def(En): Master card amount outgo returns 4

Def(Th):",
	1dh004_d_mc_nbr_nonqual_sales_4   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_amt_nonqual_sales_4   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_nbr_nonqual_returns_4 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_amt_nonqual_returns_4 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_mc_nbr_total_sales_4     	string       comment "Def(En): Master card number total sales 4

Def(Th):",
	1dh004_d_mc_amt_total_sales_4     	string       comment "Def(En): Master card amount total sales 4

Def(Th):",
	1dh004_d_mc_nbr_total_returns_4   	string       comment "Def(En): Master card number total return 4

Def(Th):",
	1dh004_d_mc_amt_total_returns_4   	string       comment "Def(En): Master card amount total return 4

Def(Th):",
	1dh004_d_mc_amt_total_per_trans_4 	string       comment "Def(En): Master card amount total per transaction 4

Def(Th):",
	1dh004_d_mc_amt_disc_4            	string       comment "Def(En): Master card amount discount 4

Def(Th):",
	1dh004_d_mc_effect_rate_4         	string       comment "Def(En): Master card effect rate 4

Def(Th):",
	1dh004_d_pl_nbr_outgo_sales_4     	string       comment "Def(En): Private card number outgo sale 4

Def(Th):",
	1dh004_d_pl_amt_outgo_sales_4     	string       comment "Def(En): Private card amount outgo sale 4

Def(Th):",
	1dh004_d_pl_nbr_outgo_returns_4   	string       comment "Def(En): Private card number outgo returns 4

Def(Th):",
	1dh004_d_pl_amt_outgo_returns_4   	string       comment "Def(En): Private card amount outgo returns 4

Def(Th):",
	1dh004_d_pl_nbr_nonqual_sales_4   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_amt_nonqual_sales_4   	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_nbr_nonqual_returns_4 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_amt_nonqual_returns_4 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_pl_nbr_total_sales_4     	string       comment "Def(En): Private card number total sales 4

Def(Th):",
	1dh004_d_pl_amt_total_sales_4     	string       comment "Def(En): Private card amount total sales 4

Def(Th):",
	1dh004_d_pl_nbr_total_returns_4   	string       comment "Def(En): Private card number total return 4

Def(Th):",
	1dh004_d_pl_amt_total_returns_4   	string       comment "Def(En): Private card amount total return 4

Def(Th):",
	1dh004_d_pl_amt_total_per_trans_4 	string       comment "Def(En): Private card amount total per transaction 4

Def(Th):",
	1dh004_d_pl_amt_disc_4            	string       comment "Def(En): Private card amount discount 4

Def(Th):",
	1dh004_d_pl_effect_rate_4         	string       comment "Def(En): Private card effect rate 4

Def(Th):",
	1dh004_d_jcb_nbr_outgo_sales_4    	string       comment "Def(En): JCB number outgo sale 4

Def(Th):",
	1dh004_d_jcb_amt_outgo_sales_4    	string       comment "Def(En): JCB amount outgo sale 4

Def(Th):",
	1dh004_d_jcb_nbr_outgo_returns_4  	string       comment "Def(En): JCB number outgo returns 4

Def(Th):",
	1dh004_d_jcb_amt_outgo_returns_4  	string       comment "Def(En): JCB amount outgo returns 4

Def(Th):",
	1dh004_d_jcb_nbr_nonqual_sales_4  	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_amt_nonqual_sales_4  	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_nbr_nonqual_returns_4	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_amt_nonqual_returns_4	string       comment "Def(En): 
Def(Th):",
	1dh004_d_jcb_nbr_total_sales_4    	string       comment "Def(En): JCB number total sales 4

Def(Th):",
	1dh004_d_jcb_amt_total_sales_4    	string       comment "Def(En): JCB amount total sales 4

Def(Th):",
	1dh004_d_jcb_nbr_total_returns_4  	string       comment "Def(En): JCB number total return 4

Def(Th):",
	1dh004_d_jcb_amt_total_returns_4  	string       comment "Def(En): JCB amount total return 4

Def(Th):",
	1dh004_d_jcb_amt_total_per_trans_4	string       comment "Def(En): JCB amount total per transaction 4

Def(Th):",
	1dh004_d_jcb_amt_disc_4           	string       comment "Def(En): JCB amount discount 4

Def(Th):",
	1dh004_d_jcb_effect_rate_4        	string       comment "Def(En): JCB effect rate 4

Def(Th):",
	1dh004_d_amt_fees_4               	string       comment "Def(En): amount fee 4

Def(Th):",
	1dh004_d_amt_disc_4               	string       comment "Def(En): amount discount 4

Def(Th):",
	1dh004_d_amt_org_expense_4        	string       comment "Def(En): amount org. expense 4

Def(Th):",
	1dh004_d_effect_rate_4            	string       comment "Def(En): effect rate 4

Def(Th):",
	1dh004_d_nbr_of_dep_days_4        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos1_auth_4          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos2_auth_4          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos3_auth_4          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_voice_auth_4         	string       comment "Def(En): number voice authorize 4

Def(Th):",
	1dh004_d_tot_nbr_dep_4            	string       comment "Def(En): 
Def(Th):",
	1dh004_d_tot_nbr_drafts_4         	string       comment "Def(En): total number drafts 4

Def(Th):",
	1dh004_d_nbr_pos1_drafts_4        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos2_drafts_4        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_pos3_drafts_4        	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_tape_drafts_4        	string       comment "Def(En): number tape drafts 4

Def(Th):",
	1dh004_d_nbr_keyed_dep_4          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_keyed_drafts_4       	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_qual_rej_4           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_qual_rej_4           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_chgbacks_4           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_chgbacks_4           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_chk_appr_4           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_chk_appr_chgs_4      	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_memb_fee_4           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_imp1_fee_4           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_imp2_fee_4           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_imp3_fee_4           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_pos1_fee_4           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_pos2_fee_4           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_amt_pos3_fee_4           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_nbr_disc_adj_4           	string       comment "Def(En): number discount adjust 4

Def(Th):",
	1dh004_d_amt_disc_adj_4           	string       comment "Def(En): amount discount adjust 4

Def(Th):",
	1dh004_d_nbr_fee_adj_4            	string       comment "Def(En): number fee adjust 4

Def(Th):",
	1dh004_d_amt_fee_adj_4            	string       comment "Def(En): amount fee adjust 4

Def(Th):",
	1dh004_d_amt_per_trans_4          	string       comment "Def(En): amount per transaction 4

Def(Th):",
	1dh004_d_slsa_nbr_4_1             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_4_1             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_4_2             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_4_2             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_4_3             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_4_3             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_4_4             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_4_4             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_nbr_4_5             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_slsa_amt_4_5             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_name_1                	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_action_1              	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_nbr_req_1             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_type_1                	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_nbr_out_1             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_dda_1                 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_user_nbr_1            	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_user_field_1          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_name_2                	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_action_2              	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_nbr_req_2             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_type_2                	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_nbr_out_2             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_dda_2                 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_user_nbr_2            	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_user_field_2          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_name_3                	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_action_3              	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_nbr_req_3             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_type_3                	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_nbr_out_3             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_dda_3                 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_user_nbr_3            	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_user_field_3          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_name_4                	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_action_4              	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_nbr_req_4             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_type_4                	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_nbr_out_4             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_dda_4                 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_user_nbr_4            	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ed_user_field_4          	string       comment "Def(En): 
Def(Th):",
	1dh004_d_user_data                	string       comment "Def(En): user data

Def(Th):",
	1dh004_d_user_acct                	string       comment "Def(En): user account

Def(Th):",
	1dh004-d-user-filler              	string       comment "Def(En): user

Def(Th):",
	1dh004_d_multi_ind                	string       comment "Def(En): multi indicator

Def(Th):",
	1dh004_d_dly_pymt                 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_ced_ind                  	string       comment "Def(En): 
Def(Th):",
	filler5                           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_card_onus_rate_1         	string       comment "Def(En): card onus rate 1

Def(Th):",
	1dh004_d_card_onus_per_item_1     	string       comment "Def(En): card onus per item 1

Def(Th):",
	1dh004_d_card_onus_rate_2         	string       comment "Def(En): card onus rate 2

Def(Th):",
	1dh004_d_card_onus_per_item_2     	string       comment "Def(En): card onus per item 2

Def(Th):",
	1dh004_d_card_onus_rate_3         	string       comment "Def(En): card onus rate 3

Def(Th):",
	1dh004_d_card_onus_per_item_3     	string       comment "Def(En): card onus per item 3

Def(Th):",
	1dh004_d_card_onus_rate_4         	string       comment "Def(En): card onus rate 4

Def(Th):",
	1dh004_d_card_onus_per_item_4     	string       comment "Def(En): card onus per item 4

Def(Th):",
	1dh004_d_card_onus_rate_5         	string       comment "Def(En): card onus rate 5

Def(Th):",
	1dh004_d_card_onus_per_item_5     	string       comment "Def(En): card onus per item 5

Def(Th):",
	1dh004_d_card_onus_rate_6         	string       comment "Def(En): card onus rate 6

Def(Th):",
	1dh004_d_card_onus_per_item_6     	string       comment "Def(En): card onus per item 6

Def(Th):",
	1dh004_d_card_onus_rate_7         	string       comment "Def(En): card onus rate 7
Def(Th):",
	1dh004_d_card_onus_per_item_7     	string       comment "Def(En): card onus per item 7
Def(Th):",
	1dh004_d_card_onus_rate_8         	string       comment "Def(En): card onus rate 8
Def(Th):",
	1dh004_d_card_onus_per_item_8     	string       comment "Def(En): card onus per item 8
Def(Th):",
	1dh004_d_card_onus_rate_9         	string       comment "Def(En): card onus rate 9
Def(Th):",
	1dh004_d_card_onus_per_item_9     	string       comment "Def(En): card onus per item 9
Def(Th):",
	1dh004_d_autopost_flag            	string       comment "Def(En): 
Def(Th):",
	filler6                           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_fac_or_sales_ind         	string       comment "Def(En): facilitator or sales indicator
Def(Th):",
	1dh004_d_facilitator_id           	string       comment "Def(En): facilitator ID
Def(Th):",
	1dh004_d_sales_org_id             	string       comment "Def(En): salse org. ID
Def(Th):",
	1dh004_d_mc_assigned_id           	string       comment "Def(En): master card assigned ID
Def(Th):",
	1dh004_d_verification             	string       comment "Def(En): verification
Def(Th):",
	1dh004_d_instl_plan4              	string       comment "Def(En): installment plan 4
Def(Th):",
	1dh004_d_instl_plan5              	string       comment "Def(En): installment plan 5
Def(Th):",
	1dh004_d_instl_plan6              	string       comment "Def(En): installment plan 6
Def(Th):",
	1dh004_d_instl_plan7              	string       comment "Def(En): installment plan 7
Def(Th):",
	1dh004_d_instl_plan8              	string       comment "Def(En): installment plan 8
Def(Th):",
	1dh004_d_instl_plan9              	string       comment "Def(En): installment plan 9
Def(Th):",
	1dh004_d_instl_plan10             	string       comment "Def(En): installment plan 10
Def(Th):",
	1dh004_d_instl_spl_from           	string       comment "Def(En): 
Def(Th):",
	1dh004_d_instl_spl_to             	string       comment "Def(En): 
Def(Th):",
	1dh004_d_instl_plan1              	string       comment "Def(En): installment plan 1
Def(Th):",
	1dh004_d_instl_plan2              	string       comment "Def(En): installment plan 2
Def(Th):",
	1dh004_d_instl_plan3              	string       comment "Def(En): installment plan 3
Def(Th):",
	1dh004_d_merch_memo               	string       comment "Def(En): merchant memo
Def(Th):",
	1dh004_d_eoc_flag                 	string       comment "Def(En): 
Def(Th):",
	1dh004_d_maint_status             	string       comment "Def(En): Maintenace status
Def(Th):",
	1dh004_d_status_flag              	string       comment "Def(En): Status flag
Def(Th):",
	1dh004_d_qr_mc_assigned_id        	string       comment "Def(En): Master card assigned ID for QR transaction. QR master card assigned id.

Def(Th): การรับชำระด้วย QR credit card ทาง Master card จะต้องทำ transaction control ด้วย MasterCard Assigned ID (MAID)",
	filler7                           	string       comment "Def(En): 
Def(Th):",
	load_tms                          	string       comment "Def(En): The timestamp on which the instance of the entity was last updated.
Def(Th): วันที่ที่ระบบได้รับข้อมูลล่าสุด",
	src_sys_id                        	string       comment "Def(En): Source system ID
Def(Th): เลขที่แสดงระบบงาน",
	ptn_yyyy                          	string       comment "Def(En): Partition Year (YYYY)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับปี",
	ptn_mm                            	string       comment "Def(En): Partition Month (MM)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับเดือน",
	ptn_dd                            	string       comment "Def(En): Partition Date (DD)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับวัน"
) using delta partitioned by (ptn_yyyy, ptn_mm, ptn_dd) location 'abfss://${storage_raw}/${catalog}/raw_cardlink/cardlink_kb1dh004_cpbmer' tblproperties (
	'delta.minreaderversion' = '2',
	'delta.minwriterversion' = '5',
	'delta.columnmapping.mode' = 'name'
);