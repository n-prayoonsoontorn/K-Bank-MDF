-- Databricks notebook source
/*---------------------------------------------------------------------------------------------------
# Name: tbl_init_persist_rmst_customer.sql
# Area: rmst
#----------------------------------------------------------------------------------------------------
#
# Change Revision
#----------------------------------------------------------------------------------------------------
# Date....      Who....           Description....
#----------------------------------------------------------------------------------------------------
# 2024-03-07    Pinyarat C.         Initial Version
#
# Target table(s)/view(s): ${catalog}.PERSIST_RMST.RMST_CUSTOMER
#--------------------------------------------------------------------------------------------------*/

-- COMMAND --

create table if not exists ${catalog}.persist_rmst.rmst_customer (
	pos_dt                                                    	date          comment "Def(En): Position Date
Def(Th): วันที่ของข้อมูล",
	id                                                        	string        comment "Def(En):Salesforce ID of Account
Def(Th):Salesforce ID 18 หลักของ Account",
	name                                                      	string        comment "Def(En): Customer's name
Def(Th): ชื่อลูกค้า",
	createddate                                               	timestamp     comment "Def(En): Record's create date
Def(Th): วันที่สร้าง Record",
	lastmodifieddate                                          	timestamp     comment "Def(En): Record's last modified date
Def(Th): วันที่แก้ไข Record ล่าสุด",
	recordtype_name                                           	string        comment "Def(En): Customer Type
Def(Th): ประเภทของลูกค้า",
	account_extensions__c                                     	string        comment "Def(En): Salesforce ID of related Account Extension
Def(Th): Id ของ Account Extension ที่เกี่ยวข้อง",
	active_contact__pc                                        	string        comment "Def(En): Active Contact
Def(Th): ผู้ติดต่อของลูกค้าที่ใช้งานอยู่",
	address_1__c                                              	string        comment "Def(En): Latitude and Longitude of Address
Def(Th): ละติจูดและลองติจูดของที่อยู่ลำดับที่ 1",
	af_last_callreprt_opty_updated_date__c                    	timestamp     comment "Def(En): AF Latest Call Report Date
Def(Th): วันที่บักทีก Call Report ล่าสุดของทีม Private Banking",
	af_owner_formula__c                                       	string        comment "Def(En): Private Banking Owner Name
Def(Th): ชื่อ Private Banking ที่ดูแลลูกค้า",
	af_port2__c                                               	string        comment "Def(En): Private Banking Owner Name
Def(Th): ลูกค้าที่ติด Owner เป็น AF ในกรณีที่ AF ไปสร้าง Job บนลูกค้า Admin",
	af_port_pool_formula__c                                   	string        comment "Def(En): Dual RM Port/Pool
Def(Th): ค่า Port/Pool ของ Dual RM",
	af_team_formula__c                                        	string        comment "Def(En): Dual RM Team Name
Def(Th): ชื่อทีมของคนที่เป็น Dual RM",
	af_temporary_customer__r_external_id__c                   	string        comment "Def(En): AF Employee ID
Def(Th): รหัสพนักงานของทีม AF",
	ah_emp_id__c                                              	string        comment "Def(En): Area Head Employee ID
Def(Th): รหัสพนักงานเขตของเจ้าของลูกค้า",
	ah_name__c                                                	string        comment "Def(En): Area Head Name
Def(Th): ชื่อเขตของเจ้าของลูกค้า",
	ah_rc_code__c                                             	string        comment "Def(En): Area Head RC Code
Def(Th): รหัส RC Code ของเขต",
	all_channels__c                                           	string        comment "Def(En): Do not contact information
Def(Th): แสดงข้อมูลเกี่ยวกับการห้ามติดต่อลูกค้า",
	all_customer_owner__c                                     	string        comment "Def(En): Customer Owner name
Def(Th): ชื่อเจ้าของลูกค้า",
	allergy_to_food__pc                                       	string        comment "Def(En): Customer's food allergies 
Def(Th): อาหารที่แพ้",
	area_name__c                                              	string        comment "Def(En): Area Name of SME Team
Def(Th): ชื่อเขตของทีม SME",
	assetcurrentasset__c                                      	decimal(16,2) comment "Def(En): Current Asset
Def(Th): รวมสินทรัพย์หมุนเวียน",
	assistant_private_banker__r_external_id__c                	string        comment "Def(En): Assistance Private Banker Employee ID
Def(Th): รหัสพนักงานของ Assistance Private Banker",
	aum_6_month_pb__c                                         	string        comment "Def(En): Private Banking 's Asset under Management in 6 months
Def(Th): มูลค่าทรัพย์สินสุทธิของกองทุน 6 เดือนของ Private Banking",
	aum__c                                                    	decimal(16,2) comment "Def(En): Asset under Management
Def(Th): มูลค่าทรัพย์สินสุทธิของกองทุน",
	aum_daily__c                                              	string        comment "Def(En): Daily Asset under Management
Def(Th): มูลค่าทรัพย์สินสุทธิของกองทุนรายวัน",
	aum_pb__c                                                 	string        comment "Def(En): Private Banking's Asset under Management
Def(Th): มูลค่าทรัพย์สินสุทธิของกองทุนปัจจุบันของ Private Banking",
	bad_customer_flag__c                                      	string        comment "Def(En): Additional Bad Customer Information
Def(Th): ข้อมูลลูกค้า Bad เพิ่มเติม",
	benefit_spent__c                                          	decimal(16,2) comment "Def(En): Customer's Benefit Spent
Def(Th): ผลประโยชน์ของลูกค้าที่มีการใช้ไป",
	big_investor__c                                           	string        comment "Def(En): Big Investor Customer Information
Def(Th): ข้อมูลลูกค้าเข้าเกณฑ์นักลงทุนรายใหญ่",
	birthdate__pc                                             	string        comment "Def(En): Customer Birthdate for individual customer
Def(Th): วันเกิดของลูกค้าบุคคล",
	bod__c                                                    	string        comment "Def(En): Banking On Demand Information
Def(Th): รายละเอียดการบริการ Banking On Demand",
	bol__c                                                    	string        comment "Def(En): BOL Message
Def(Th): ข้อความเฉพาะรายสำหรับลูกค้า BOL",
	bol_id__c                                                 	string        comment "Def(En): BOL ID
Def(Th): ID ของลูกค้า BOL",
	bot_customer__c                                           	string        comment "Def(En): BOT Customer
Def(Th): ลูกค้า BOT",
	branch_closeness__c                                       	string        comment "Def(En): Branch Closeness RC Code
Def(Th): รหัส RC Code ของสาขาคนสนิท",
	branch_closeness_name__c                                  	string        comment "Def(En): Branch Closeness Name
Def(Th): ชื่อของสาขาคนสนิท",
	branch_group__c                                           	string        comment "Def(En): The Branch Closeness that is sekected by sales
Def(Th): สาขาเลือกลูกค้าคนสนิท",
	branch_manager__c                                         	string        comment "Def(En): Related Branch Manager Name
Def(Th): ชื่อผู้การสาขาที่เกี่ยวข้องกับลูกค้า",
	branch_manager_phone__c                                   	string        comment "Def(En): Related Branch Manager Phone Number
Def(Th): เบอร์โทรศัพท์ผู้การสาขาที่เกี่ยวข้องกับลูกค้า",
	branch_selection_details__c                               	string        comment "Def(En): Details for select customer into branch
Def(Th): ข้อมูลที่ให้สาขาใช้ประกอบการเลือก Port",
	branchnamerbs__c                                          	string        comment "Def(En): Highest Priority Branch Name
Def(Th): ชื่อสาขาที่มี Priority สูงสุดบนลูกค้า",
	brief_info__c                                             	string        comment "Def(En): Importance Information
Def(Th): ข้อมูลสำคัญลูกค้าของสาขา",
	business_address__c                                       	string        comment "Def(En): Business Address
Def(Th): ที่อยู่ตามเอกสารสำคัญ",
	business_code_name_en__c                                  	string        comment "Def(En): Customer business type in English
Def(Th): ประเภทธุรกิจของลูกค้า ภาษาอังกฤษ",
	business_code_name_th__c                                  	string        comment "Def(En): Customer business type in Thai
Def(Th): ประเภทธุรกิจของลูกค้า ภาษาไทย",
	business_email__c                                         	string        comment "Def(En): Business email for organization customer
Def(Th): Email ที่ใช้สำหรับติดต่อธุรกิจสำหรับลูกค้านิติบุคคล",
	business_email__pc                                        	string        comment "Def(En): Business email for individual customer
Def(Th): Email ที่ใช้สำหรับติดต่อธุรกิจสำหรับลูกค้าบุคคล",
	business_email_mashup__c                                  	string        comment "Def(En): Business email that has masking
Def(Th): Email ที่ใช้สำหรับติดต่อธุรกิจสำหรับลูกค้าที่ถูก masking",
	c_sumwatchlist__c                                         	string        comment "Def(En): Customer Watchlist Information
Def(Th): ข้อมูลูกค้าพึ่งระวัง",
	c_watchlist__c                                            	string        comment "Def (En): Customer Watchlist Information
Def (Th): ข้อมูลูกค้าพึ่งระวัง",
	call_report_info__c                                       	string        comment "Def (En): Latest Call Report Information
Def (Th): ข้อมูลของ Call Report ใบล่าสุด",
	capacity_max_reward_amount__c                             	decimal(16,2) comment "Def (En): Number of max rewards amount
Def (Th): มูลค่าของสมนาคุณที่ลูกค้าสามารถรับได้",
	cbs_evp_fsvp_id_adjust__c                                 	string        comment "Def (En): CBS FSVP Employee ID
Def (Th): รหัสพนักงาน FSVP ของลูกค้า CBS",
	cbs_evp_fsvp_name_adjust__c                               	string        comment "Def (En): CBS FSVP Name
Def (Th): ชื่อพนักงาน FSVP ของลูกค้า CBS",
	cbs_high_value__c                                         	string        comment "Def(En): CBS High Value Customer
Def(Th): ลูกค้า High Value ของ CBS",
	cbs_report__c                                             	string        comment "Def(En): CBS Report Filter
Def(Th): ใข้เป็น Filter ในการแสดง Report ของ CBS",
	cbs_service_manager_phone__c                              	string        comment "Def(En): CBS Service Manager Phone Number
Def(Th): เบอร์โทรศัพท์ของ CBS Service Manager",
	cc_contacted__c                                           	string        comment "Def(En): Call Center Contact Result
Def(Th): ผลการติดต่อลูกค้าของ Call Center",
	chainname_tgl__c                                          	string        comment "Def(En): Additional Lead Information
Def(Th): ข้อมูลลีดที่เกี่ยวข้องกับลูกค้า",
	changed_owner_channel__c                                  	decimal(18,0) comment "Def(En): A field used to verify if the change owner command came from the following legit channels:
1 : HRIS
2 : Bulk Assignment
3 : Request/Release
4 : Manual Upload
Def(Th): ฟิลด์สำหรับเช็คว่าคำสั่ง Change Owner มาจากช่องทางที่อนุญาตให้ทำหรือไม่",
	channel_to_deliver__pc                                    	string        comment "Def(En): Channel to deliver
Def(Th): ช่องทางการติดต่อลูกค้า",
	character__pc                                             	string        comment "Def(En): Channel to deliver
Def(Th): ช่องทางการติดต่อลูกค้า",
	cheque_solution_lastestdate__c                            	date          comment "Def(En): Latest Order Cheque Solution Date
Def(Th): วันที่สั่งเช็ค Solution ล่าสุด",
	cheque_solution_number__c                                 	decimal(4,0)  comment "Def(En): Number of Cheque Solution
Def(Th): จำนวนชุดเช็ค Solution",
	cis__c                                                    	string        comment "Def(En): Customer CIS ID
Def(Th): เลข CIS ของลูกค้า",
	client_group__c                                           	string        comment "Def(En): Client Group use for Private Banking
Def(Th): กลุ่มลูกค้าใช้สำหรับลูกค้า Private Banking",
	collection__pc                                            	string        comment "Def(En): Items that customers like to collect
Def(Th): ของสะสมของลูกค้า",
	colour_owner__c                                           	string        comment "Def(En): Customer Owner Colour Group
Def(Th): กลุ่มสีของเจ้าของลูกค้า",
	commercial_exposure__c                                    	decimal(16,2) comment "Def(En): Sum of  Loan out+Limit (OD,PN,TF,LG,Aval,Acceptance )
Def(Th): ผลรวมของ Loan out+Limit (OD,PN,TF,LG,Aval,Acceptance )",
	commercial_limit__c                                       	decimal(16,2) comment "Def(En): Approve Amount of LN,OD,PN,TF,LG,Aval,Acceptance
Def(Th): วงเงินอนุมัติของ LN,OD,PN,TF,LG,Aval,Acceptance",
	commercial_out__c                                         	decimal(16,2) comment "Def(En): Outstanding Balance of LN,OD,PN,TF,LG,Aval,Acceptance
Def(Th): ยอดคงค้างของ LN,OD,PN,TF,LG,Aval,Acceptance",
	consumer_exposure__c                                      	decimal(16,2) comment "Def(En): Sum of Home Loan out and Limit  PL,CC,KEC
Def(Th): ยอดรวม Home Loan out+Limit ของ PL,CC,KEC",
	consumer_limit__c                                         	decimal(16,2) comment "Def(En): Approve Amount of Home LN,PL,CC,KEC 
Def(Th): วงเงินอนุมัติของ Home LN,PL,CC,KEC",
	consumer_out__c                                           	decimal(16,2) comment "Def(En): Outstanding Balance of Home LN,PL,CC,KEC
Def(Th): ยอดคงค้างของ Home LN,PL,CC,KEC",
	contact_firstname__pc                                     	string        comment "Def(En): Contact First Name
Def(Th): ชื่อของผู้ติดต่อ",
	contact_owner__pc                                         	string        comment "Def(En): Customer Owner Name
Def(Th): ชื่อและนามสกุลของเจ้าของลูกค้า",
	contact_position__pc                                      	string        comment "Def(En): Contact Position Name
Def(Th): ตำแหน่งของผู้ติดต่อ",
	contact_preference_communication__pc                      	string        comment "Def(En): Contact Preference Channel
Def(Th): ช่องทางการติตต่อผู้ติดต่อ",
	contact_preference_last_modified_by__pc                   	string        comment "Def(En): Contact Preference Last Modified By
Def(Th): คนที่ทำการแก้ไข Contact Preference ล่าสุด",
	contact_preference_last_modified_date__pc                 	timestamp     comment "Def(En): Contact Preference Last Modified Date
Def(Th): วันและเวลาทำการแก้ไข Contact Preference ล่าสุด",
	contact_representative_type__pc                           	string        comment "Def(En): Contact Representative Type


Def(Th): ประเภทตัวแทนของผู้ติดต่อ",
	convert_prospect_date__c                                  	date          comment "Def(En): Convert Prospect Date
Def(Th): วันที่มีการ Convert Prospect ไปเป็นลูกค้า",
	count_call_report_rm__c                                   	decimal(18,0) comment "Def(En): Number of Relationship Mangert Call Report
Def(Th): จำนวน Call Report ของ Relationship Manager",
	count_contacted_call_report__c                            	decimal(18,0) comment "Def(En): Number of Contacted Call Report
Def(Th): จำนวน Call Report ที่ติดต่อลูกค้าไปแล้ว",
	count_contacted_call_report_f2f__c                        	decimal(18,0) comment "Def(En): Number of Face to Face Call Report
Def(Th): จำนวน Call Report แบบ Face to Face",
	count_contacted_call_report_phone_call__c                 	decimal(18,0) comment "Def(En): Number of Phone Call Call Report
Def(Th): จำนวน Call Report แบบ Phone Call",
	credit_card__c                                            	string        comment "Def(En): This field indicates whether the customer has a credit card.
Def(Th): ลูกค้ามีผลิตภัณฑ์ Credit Card หรือไม่",
	credit_flag__c                                            	string        comment "Def(En): This field indicates whether the customer is a credit
Def(Th): เป็นลูกค้าเครดิตหรือไม่",
	criminal_offense__c                                       	string        comment "Def(En): Criminal Offense
Def(Th): ลูกค้ามีความผิดทางอาญา",
	current_activity__c                                       	string        comment "Def(En): Current Activity on the Customer
Def(Th): สถานะการดำเนินการปัจจุบันบนลูกค้า",
	current_activity_by__c                                    	string        comment "Def(En): Salesforce ID of the latest person who create call plan or call report
Def(Th): Salesforce ID 18 หลักผู้ดำเนินการบนลูกค้าล่าสุด",
	current_ah_name__r_external_id__c                         	string        comment "Def(En): External ID of current AH team that owns the customer
Def(Th): รหัสทีมปัจจุบันในระดับ AH ที่ดูแลลูกค้า",
	current_lead__c                                           	string        comment "Def(En): Salesforce ID of Related Target List
Def(Th): Salesforce ID 18 หลักของ Target List ที่ผูกกับลูกค้า",
	current_nh_name__r_external_id__c                         	string        comment "Def(En): External ID of current team that owns the customer
Def(Th): รหัสทีมปัจจุบันในระดับ NH ที่ดูแลลูกค้า",
	current_owner_extension__r_external_id__c                 	string        comment "Def(En): Customer Owner Employee ID
Def(Th): รหัสพนักงานของเจ้าของลูกค้า",
	current_ratio__c                                          	decimal(8,2)  comment "Def(En): Current Ratio
Def(Th): อัตราส่วนสภาพคล่องทางการเงิน",
	current_refer__c                                          	string        comment "Def(En): Salesforce ID of Related Lead
Def(Th): Salesforce ID 18 หลักของ Lead ที่ผูกกับลูกค้า",
	current_team_name__r_external_id__c                       	string        comment "Def(En): External ID of current team that owns the customer
Def(Th): รหัสทีมปัจจุบันที่ดูแลลูกค้า",
	currentleadassignedto__r_employee_id__c                   	string        comment "Def(En): Assign Lead Employee ID
Def(Th): รหัสพนักงานของทีมขายที่ได้รับมอบหมายลีด",
	customer_business_status__c                               	string        comment "Def(En): Customer Business Status
Def(Th): สถานภาพของลูกค้า",
	customer_business_type_and_description2__c                	string        comment "Def(En): Customer Business Status Information
Def(Th): ข้อมูลสถานภาพของลูกค้า",
	customer_importance_note__c                               	string        comment "Def(En): Customer important note
Def(Th): ข้อมูลสำคัญของลูกค้า",
	customer_in_action__c                                     	string        comment "Def(En): Customer Occupation Group
Def(Th): กลุ่มอาชีพของลูกค้า",
	customer_name__pc                                         	string        comment "Def(En): Customer Name
Def(Th): ชื่อของลูกค้า",
	customer_owner2__c                                        	string        comment "Def(En): Customer Owner Name
Def(Th): ชื่อเจ้าของลูกค้า",
	customer_owner_changed_date__c                            	date          comment "Def(En): Customer Owner Changed Date
Def(Th): วันที่เปลี่ยน Owner ลูกค้า",
	customer_owner_phone__c                                   	string        comment "Def(En): Customer Owner Phone
Def(Th): เบอร์โทรศัพท์ของเจ้าของลูกค้า",
	customer_segment_desc__c                                  	string        comment "Def(En): Customer Segment Description
Def(Th): คำอธิบายของ Customer Segment",
	customer_status_desc__c                                   	string        comment "Def(En): This field indicates whether the customer status is Prospect or Customer
Def(Th): สถานะของลูกค้าว่าเป็น Prospect หรือ Customer",
	customer_type__c                                          	string        comment "Def(En): This field indicates whether the customer type is Individual or Oganization
Def(Th): ประเภทของลูกค้าว่าเป็นบุคคล หรือ นิติบุคคล",
	customer_type_dc__c                                       	string        comment "Def(En): 
Def(Th): เป็นลูกค้าที่เกิดจากการ Dipchip หรือไม่",
	custype_code__c                                           	string        comment "Def(En): Identify Customer Type such as 01, 02 and etc. This field use for generate PromptPay form

Def(Th): ใช้อธิบายประเภทของลูกค้านิติบุคคล 01  บริษัทจำกัด, 02  ห้างหุ้นส่วนจำกัด and etc",
	de_ratio__c                                               	decimal(8,2)  comment "Def(En): Debt to Equity Ratio 
Def(Th): อัตราส่วนทางการเงินที่เป็นการเปรียบเทียบระหว่าง “หนี้สินรวม (Debt)” เทียบกับ “ส่วนของผู้ถือหุ้นรวม (Equity)”",
	debt_restructuring__c                                     	string        comment "Def(En): This field indicates that the customer needs the Debt Restructuring Process or not
Def(Th): ลูกค้ามีการปรับปรุงโครงสร้างหนี้หรือไม่",
	deposit_fund__c                                           	string        comment "Def(En): Amount of Deposit and Fund
Def(Th): มูลค่าเงินฝากและกองทุน",
	derivery_channel_cbs__pc                                  	string        comment "Def(En): Delivery Channel 
Def(Th): ช่องทางการจัดส่งของให้กับลูกค้า",
	do_not_contact_by_direct_mail__c                          	string        comment "Def(En): This field indicates wheather sales can contact the customer via Direct Mail
Def(Th): ลูกค้าให้ติดต่อทางจดหมายหรือไม่",
	do_not_contact_by_e_mail__c                               	string        comment "Def(En): This field indicates wheather sales can contact the customer via E-mail
Def(Th): ลูกค้าให้ติดต่อทางอีเมลล์หรือไม่",
	do_not_contact_by_fax__c                                  	string        comment "Def(En): This field indicates wheather sales can contact the customer via Fax
Def(Th): ลูกค้าให้ติดต่อทาง Fax หรือไม่",
	do_not_contact_by_site_visit__c                           	string        comment "Def(En): This field indicates wheather sales can contact the customer via Site Visit
Def(Th): ลูกค้าให้ติดต่อทางการเข้าเยี่ยมนอกสถานที่หรือไม่",
	do_not_contact_by_sms__c                                  	string        comment "Def(En): This field indicates wheather sales can contact the customer via SMS
Def(Th): ลูกค้าให้ติดต่อทาง SMS หรือไม่",
	do_not_contact_by_telemarketing__c                        	string        comment "Def(En): This field indicates wheather sales can contact the customer via Telemarketing
Def(Th): ลูกค้าให้ติดต่อเพื่อขายทางโทรศัพท์หรือไม่",
	document_type__c                                          	string        comment "Def(En): Document Type
Def(Th): ประเภทเอกสารสำคัญของลูกค้า",
	document_type_prospect__c                                 	string        comment "Def(En): Document Type for Prospect
Def(Th): ประเภทเอกสารสำคัญของลูกค้า Prospect",
	dual_ah_rc_code__c                                        	string        comment "Def(En): Dual RM Area RC Code
Def(Th): รหัส RC Code ของเขต",
	dual_rm_name__r_employee_id__c                            	string        comment "Def(En): Dual RM Employee ID
Def(Th): รหัสพนักงาน Dual RM",
	dual_rm_segment_code__c                                   	string        comment "Def(En): Dual RM Segment Code
Def(Th): Segment ของ Dual RM",
	dual_segment_code__c                                      	string        comment "Def(En): Customer Dual Segment
Def(Th): Dual Segment ของลูกค้า",
	dual_segment_customer_owner__c                            	string        comment "Def(En): Dual RM Name
Def(Th): ชื่อเจ้าของลูกค้าที่เป็น Dual RM",
	dual_sub_segment_code__c                                  	string        comment "Def(En): Dual Sub Segment Code
Def(Th): Sub Segment Code ของ Dual",
	ebanlastmodifieddate__c                                   	date          comment "Def(En): The date that identify the data being updated from Sales Smart into DIH
Def(Th): วันที่ใช้กำหนดข้อมูลที่ถูก update จาก Sales Smart ลงไปยัง DIH",
	email_encrypted__c                                        	string        comment "Def(En): Customer Email
Def(Th): ชื่อ Email ของลูกค้า",
	estimate_sale__c                                          	decimal(16,2) comment "Def(En): Estimate Sale Per Year
Def(Th): ประมาณยอดขายธุรกิจต่อปี",
	estimated_business_monthly_sales_volumee__c               	string        comment "Def(En): Estimate Sale Per Month
Def(Th): ประมาณการยอดขายธุรกิจต่อเดือน",
	event_name_cbs__pc                                        	string        comment "Def(En): Giveaway for the customer
Def(Th): ของที่แจกให้กับลูกค้า",
	exit__c                                                   	string        comment "Def(En): This flag use to calculate customer colour risk
Def(Th): เป็น Flag ที่เอาไว้ใช้คิดสีความเสี่ยงของลูกค้า",
	external_id__c                                            	string        comment "Def(En): Field is used to identify that information has been passed through Adobe
Def(Th): Field เพื่อบอกว่าข้อมูลถูกส่งมาจากทาง Adobe (ใช้ในกรณีที่ลูกค้าไม่มี CIS/Ident No.)",
	external_id__pc                                           	string        comment "Def(En): Contact External ID
Def(Th): External ID ของ Contact",
	facebook_id__pc                                           	string        comment "Def(En): Customer Facebook Name
Def(Th): ชื่อ Facebook ของลูกค้า",
	family_id__c                                              	string        comment "Def(En): Customer Family ID
Def(Th): รหัส Family ID ของลูกค้า",
	favorite_food__pc                                         	string        comment "Def(En): Customer Favourite Menu
Def(Th): ประเภทอาหารที่ลูกค้าชอบ",
	favourite_brand__pc                                       	string        comment "Def(En): Customer Favourite Brand
Def(Th): แบรนด์ที่ลูกค้าชอบ",
	favourite_magazine__pc                                    	string        comment "Def(En): Customer Favourite Magazine
Def(Th): นิตยสารที่ลูกค้าชอบ",
	favourite_restaurant__pc                                  	string        comment "Def(En): Customer Favourite Restaurant
Def(Th): ร้านอาหารที่ลูกค้าชอบ",
	favourite_sport__pc                                       	string        comment "Def(En): Customer Favourite Sport
Def(Th): กีฬาที่ลูกค้าชอบ",
	fico_score__c                                             	decimal(18,0) comment "Def(En): Credit Score
Def(Th): คะแนน Credit",
	finserv__affiliations__pc                                 	string        comment "Def(En): Related Company
Def(Th): บริษัทในเครือ",
	finserv__aum__c                                           	string        comment "Def(En): Value of this individual’s financial accounts that your firm manages. Calculated as the sum of TotalAUMPrimaryOwner__c and TotalAUMJointOwner__c.
Def(Th): มูลค่าของบัญชีการเงินของบุคคลนี้ที่บริษัทของคุณจัดการ คำนวณเป็นผลรวมของ TotalAUMPrimaryOwner__c และ TotalAUMJointOwner__c",
	finserv__banknumber__c                                    	string        comment "Def(En): Identifies a financial institution for electronic purposes.
Identifies a financial institution for electronic purposes.
Def(Th): ระบุสถาบันการเงินเพื่อวัตถุประสงค์ทางอิเล็กทรอนิกส์",
	finserv__billingaddress__pc                               	string        comment "Def(En): Billing Address.
Def(Th): ที่อยู่สำหรับการเรียกเก็บเงิน",
	finserv__borrowinghistory__c                              	string        comment "Def(En): Customer Borrowing History 
Def(Th): ประวัติการกู้ยืมของลูกค้า",
	finserv__borrowingpriorities__c                           	string        comment "Def(En): Borrowing Objective
Def(Th): วัตถุประสงต์การกู้ยืม",
	finserv__branchcode__c                                    	string        comment "Def(En): Identifies an office or building of a financial institution. Code format is based on the financial institution.
Record type for this account. The value is copied from RecordType.Name and can’t be changed.
Def(Th): ระบุสำนักงานหรืออาคารของสถาบันการเงิน รูปแบบรหัสจะขึ้นอยู่กับสถาบันการเงิน",
	finserv__branchname__c                                    	string        comment "Def(En): Location name for a financial institution office.
Record type for this account. The value is copied from RecordType.Name and can’t be changed.
Def(Th): ชื่อที่ตั้งสถาบันทางการเงิน ประเภท Record คือ ข้อมูลที่ถูกคัดลอกจาก RecordType.Name จะไม่สามารถเปลี่ยนแปลงได้",
	finserv__citizenship__pc                                  	string        comment "Def(En): Country of primary citizenship.
Def(Th): ประเทศที่เป็นพลเมืองหลัก",
	finserv__clientcategory__c                                	string        comment "Def(En): Rates the value of this individual’s business with your firm. 
Def(Th): แบ่งเรทมูลค่าธุรกิจของบุคคลกับบริษัท",
	finserv__communicationpreferences__pc                     	string        comment "Def(En): Preferred communication channel.
Def(Th): ช่องทางการติดต่อที่ต้องการ",
	finserv__contactpreference__pc                            	string        comment "Def(En): Preferred communication method.
Def(Th): วิธีการสื่อสาสรที่ต้องการ",
	finserv__conversiondatetime__c                            	timestamp     comment "Def(En): Lead conversion Date and Time
Def(Th): วันที่และเวลาของการแปลงลูกค้าเป้าหมาย",
	finserv__countryofbirth__pc                               	string        comment "Def(En): This individual’s country of birth.
Def(Th): ประเทศบ้านเกิดของบุคคล",
	finserv__countryofresidence__pc                           	string        comment "Def(En): Country of residence.
Def(Th): ประเทศที่อยู่อาศัย",
	finserv__createdfromlead__pc                              	string        comment "Def(En): Indicates whether this individual was created from a converted lead (true) or not (false).
Def(Th): ระบุว่าบุคคลนี้มาจากการแปลงจากลีด (True) หรือ ไม่ (Not)",
	finserv__creditrating__c                                  	string        comment "Def(En): Assessment of creditworthiness.
Def(Th): การประเมินความน่าเชื่อถือทางเครดิต",
	finserv__creditscore__c                                   	decimal(4,0)  comment "Def(En): Numerical rating of borrower’s creditworthiness.
Def(Th): อันดับเครดิตของผู้กู้ยืม",
	finserv__currentemployer__pc                              	string        comment "Def(En): Name of current employer.
Def(Th): ชื่อของนายจ้างปัจจุบัน",
	finserv__customerid__c                                    	string        comment "Def(En): Financial institution's identification number for this individual (80 characters)
Record type for this account. The value is copied from RecordType.Name and can’t be changed.
Def(Th): หมายเลขประจำตัวสถาบันการเงินสำหรับบุคคลนี้ (80 ตัวอักษร)",
	finserv__customersegment__c                               	string        comment "Def(En): Individual’s market segment.
Def(Th): แบ่งส่วนตลาดตามส่วนบุลคล",
	finserv__customertimezone__pc                             	string        comment "Def(En): Primary time zone.
Def(Th): โซนเวลาของแต่ละประเทศ",
	finserv__customertype__c                                  	string        comment "Def(En): Individual’s financial category.
Def(Th): แบ่งหมวดหมู่ทางการเงินแต่ละบุคคล",
	finserv__emailverified__pc                                	string        comment "Def(En): Indicates that the individual’s email address has been verified (true), or not (false).
Def(Th): ระบุที่อยู่อีเมล์ของบุคคลที่ได้รับการยืนยันแล้ว (true) หรือ ไม่ (false)",
	finserv__employedsince__pc                                	date          comment "Def(En): Year when client started with current employer.
Def(Th): ปีที่ลูกค้าเริ่มต้นกับนายจ้างปัจจุบัน",
	finserv__facebook__pc                                     	string        comment "Def(En): Facebook profile URL.
Def(Th): ลิงค์หน้าโปรไฟล์เฟซบุ๊ค",
	finserv__faxverified__pc                                  	string        comment "Def(En): Indicates that the individual’s fax number has been verified (true), or not (false).
Def(Th): ระบุว่าหมายเลขแฟกซ์ของแต่ละบุคคลได้รับการยืนยันแล้ว (true) หรือไม่ (false)",
	finserv__financialinterests__c                            	string        comment "Def(En): This individual’s financial areas of interest.
Def(Th): ความสนใจในแต่ละพื้นที่ทางการเงินของแต่ละบุคคล",
	finserv__gender__pc                                       	string        comment "Def(En): Gender
Def(Th): เพศ",
	finserv__homeownership__pc                                	string        comment "Def(En): Relationship to primary residence.
Def(Th): ความสัมพันธ์กับผู้อยู่อาศัยหลัก",
	finserv__homephoneverified__pc                            	string        comment "Def(En): Indicates that the home phone number has been verified
(true), or not (false).
Def(Th): ระบุหมายเลขโทรศัพท์บ้านได้รับการยืนยันแล้ว (true) หรือ ไม่ (false)",
	finserv__individualid__c                                  	string        comment "Def(En): Unique ID that relates this individual’s contact record to its account record. Calculated from Account.IndividualId__c.
Def(Th): รหัสเฉพาะที่เกี่ยวข้องกับบันทึกการติดต่อของบุคคลนี้กับบันทึกบัญชี คำนวณจาก Account.IndividualId__c",
	finserv__individualid__pc                                 	string        comment "Def(En): Unique ID that relates this individual's contact record to its account record.
Def(Th): Unique ID ของผู้ติดต่อที่สัมพันธ์กับลูกค้า",
	finserv__individualtype__c                                	string        comment "Def(En): Individual Type
Def(Th): ประเภทของบุคคล",
	finserv__individualtype__pc                               	string        comment "Def(En): Individual Type
Def(Th): ประเภทของบุคคล",
	finserv__investmentexperience__c                          	string        comment "Def(En): Client's investment experience.
Def(Th): ประสบการณ์ด้านทางลงทุนของลูกค้า",
	finserv__investmentobjectives__c                          	string        comment "Def(En): Client's preference for growth versus income investments.
Def(Th): ความพึงพอใจของลูกค้าในด้านการเติบโตเทียบกับการลงทุนด้านรายได้",
	finserv__languagesspoken__pc                              	string        comment "Def(En): Languages spoken.
Def(Th): ภาษาที่ลูกค้าพูด",
	finserv__lastfourdigitssn__pc                             	string        comment "Def(En): Last 4-Digits of SSN or Tax ID
Def(Th): ตัวเลข 4 ตัวท้ายของ SSN หรือ เลขประจำตัวผู้เสียภาษี",
	finserv__lastinteraction__c                               	date          comment "Def(En): Date of the last client meeting or call.
Def(Th): วันที่ของวันประชุมหรือโทรกับลูกค้าครั้งล่าสุด",
	finserv__lastreview__c                                    	date          comment "Def(En): Date of the last client review.
Def(Th): วันที่ตรวจสอบลูกค้าครั้งล่าสุด",
	finserv__lasttransactiondate__c                           	string        comment "Def(En): Last transaction date.
Def(Th): วันที่ทำรายการครั้งล่าสุด",
	finserv__lasttransactiondatejointowner__c                 	timestamp     comment "Def(En): Date of the last transaction - joint owner.
Def(Th): วันที่ทำรายการครั้งล่าสุด - เจ้าของร่วม",
	finserv__lasttransactiondateprimaryowner__c               	timestamp     comment "Def(En): Primary owner's last transaction date.
Def(Th): วันที่ทำรายการครั้งล่าสุดของเจ้าของหลัก",
	finserv__lastusedchannel__c                               	string        comment "Def(En): Most recent contact channel
Def(Th): ช่องทางการติดต่อล่าสุด",
	finserv__lengthofrelationship__c                          	string        comment "Def(En): Individual’s tenure with the financial institution.
Def(Th): การดำรงตำแหน่งของบุคคลกับสถาบันการเงิน",
	finserv__lifetimevalue__c                                 	decimal(16,2) comment "Def(En): Individual’s lifetime net asset value to your financial institution.
Def(Th): มูลค่าทรัพย์สินสุทธิตลอดชีพของแต่ละบุคคลต่อสถาบันการเงิน",
	finserv__linkedin__pc                                     	string        comment "Def(En): LinkedIn profile URL.
Def(Th): โปรไฟล์ LinkedIn URL",
	finserv__mailingaddress__pc                               	string        comment "Def(En): Compound field for Mailing Address.
Def(Th): ที่อยู่สำหรับจัดส่งจดหมาย",
	finserv__maritalstatus__pc                                	string        comment "Def(En): Marital status.
Def(Th): สถานภาพการสมรส",
	finserv__marketingoptout__pc                              	string        comment "Def(En): Indication that the individual has opted out of receiving marketing materials.
Def(Th): บ่งชี้ว่าบุคคลนั้นได้เลือกที่จะไม่รับเอกสารทางการตลาด",
	finserv__marketingsegment__c                              	string        comment "Def(En): Market segments that characterize the client.
Def(Th): ส่วนตลาดที่เป็นลักษณะเฉพาะของลูกค้า",
	finserv__mobileverified__pc                               	string        comment "Def(En): Indicates the mobile phone number has been verified
(true), or not (false).
Def(Th): แสดงว่าหมายเลขโทรศัพท์มือถือได้รับการยืนยันแล้ว
(จริง) หรือไม่ (เท็จ)",
	finserv__mostusedchannel__pc                              	string        comment "Def(En): Most frequent communication channel.
Def(Th): ช่องทางการติดต่อสื่อสารบ่อยที่สุด",
	finserv__mothermaidenname__pc                             	string        comment "Def(En): Mother's Maiden Name
Def(Th): ชื่อของ Mother's Maiden",
	finserv__networth__c                                      	decimal(16,2) comment "Def(En): Value of this individual’s assets minus liabilities.
Def(Th): มูลค่าทรัพย์สินของบุคคลนี้ลบด้วยหนี้สิน",
	finserv__nextinteraction__c                               	date          comment "Def(En): Date of the next meeting or call.
Def(Th): วันนัดหมายของการประชุมครั้งถัดไป",
	finserv__nextlifeevent__pc                                	string        comment "Def(En): Next major life event.
Def(Th): เหตุการณ์สำคัญในชีวิตครั้งต่อไป",
	finserv__nextreview__c                                    	date          comment "Def(En): Date of the next review.
Def(Th): วันที่ครั้งถัดไปของการรีวิว",
	finserv__notes__c                                         	string        comment "Def(En): Important notes about the individual. Label is Important Notes.
Def(Th): หมายเหตุสำคัญที่เกี่ยวกับบุคคล",
	finserv__numberofchildren__pc                             	decimal(3,0)  comment "Def(En): Number of children.
Def(Th): จำนวนบุตร",
	finserv__numberofdependents__pc                           	decimal(3,0)  comment "Def(En): Number of dependents.
Def(Th): จำนวนผู้อยู่ในอุปการะ",
	finserv__otheraddress__pc                                 	string        comment "Def(En): Compound field for Other Address.
Def(Th): ฟิลด์ที่รวมกันสำหรับที่อยู่อื่นๆ",
	finserv__preferredname__pc                                	string        comment "Def(En): This individual’s preferred name.
Def(Th): ชื่อที่ต้องการของบุคคลนี้",
	finserv__primaryaddressisbilling__pc                      	string        comment "Def(En): Designates Billing Address as the primary address.
Def(Th): ที่อยู่สำหรับการเรียกเก็บเงินเป็นที่อยู่หลัก",
	finserv__primaryaddressismailing__pc                      	string        comment "Def(En): Designates Mailing Address as the primary address.
Def(Th): กำหนดที่อยู่ทางไปรษณีย์เป็นที่อยู่หลัก",
	finserv__primaryaddressisother__pc                        	string        comment "Def(En): Designates Other Address as the primary address.
Def(Th): กำหนดที่อยู่อื่นเป็นที่อยู่หลัก",
	finserv__primaryaddressisshipping__pc                     	string        comment "Def(En): Designates Shipping Address as the primary address.
Def(Th): กำหนดที่อยู่สำหรับจัดส่งเป็นที่อยู่หลัก",
	finserv__primarycitizenship__pc                           	string        comment "Def(En): Country of primary citizenship.
Def(Th): ประเทศที่เป็นพลเมืองหลัก",
	finserv__primarycontact__c                                	string        comment "Def(En): Read only. ID of the contact record associated with this individual’s account record.

Def(Th): อ่านเท่านั้น. ID ของบันทึกการติดต่อที่เกี่ยวข้องกับบันทึกบัญชีของบุคคลนี้",
	finserv__primarylanguage__pc                              	string        comment "Def(En): This individual’s primary language.
Def(Th): ภาษาหลัก",
	finserv__referredbycontact__c                             	string        comment "Def(En): External contact referring this individual.
Def(Th): ผู้ติดต่อภายนอกที่อ้างอิงถึงบุคคลนี้",
	finserv__referredbycontact__pc                            	string        comment "Def(En): External contact referring this individual.
Def(Th): ผู้ติดต่อภายนอกที่อ้างอิงถึงบุคคลนี้",
	finserv__referredbyuser__c                                	string        comment "Def(En): Internal user referring this opportunity.
Def(Th): ผู้ใช้ภายในที่อ้างอิง",
	finserv__referredbyuser__pc                               	string        comment "Def(En): Internal user referring this opportunity.
Def(Th): ผู้ใช้ภายในที่อ้างอิง",
	finserv__referrerscore__pc                                	decimal(16,2) comment "Def(En): A value of 0 to 100. A high score reflects a high rate of referral conversion.
Def(Th): ค่าตั้งแต่ 0 ถึง 100 คะแนนที่สูงสะท้อนถึงอัตราการแปลงผู้อ้างอิงที่สูง",
	finserv__relationshipstartdate__c                         	date          comment "Def(En): Date this individual started working with your company
Def(Th): วันที่เริ่มทำงาน",
	finserv__reviewfrequency__c                               	string        comment "Def(En): Frequency of reviews.
Def(Th): ความถี่ของการวิจารณ์",
	finserv__risktolerance__c                                 	string        comment "Def(En): Level of risk this individual is comfortable with.
Def(Th): ระดับความเสี่ยงที่บุคคลนี้พอใจ",
	finserv__secondarycitizenship__pc                         	string        comment "Def(En): Country of secondary citizenship.
Def(Th): ประเทศที่เป็นพลเมืองรอง",
	finserv__secondarylanguage__pc                            	string        comment "Def(En): This individual’s secondary language.
Def(Th): ภาษารอง",
	finserv__servicemodel__c                                  	string        comment "Def(En): Service level assigned to client.
Def(Th): ระดับการบริการที่กำหนดให้กับลูกค้า",
	finserv__shippingaddress__pc                              	string        comment "Def(En): Concatenated shipping address field.
Def(Th): ช่องที่อยู่สำหรับจัดส่งที่ต่อกัน",
	finserv__sourcesystemid__c                                	string        comment "Def(En): ID that uniquely identifies the individual in an external data source.
Def(Th): รหัสที่ระบุตัวบุคคลโดยไม่ซ้ำกันในแหล่งข้อมูลภายนอก",
	finserv__sourcesystemid__pc                               	string        comment "Def(En): ID that uniquely identifies the individual in an external data source.
Def(Th): รหัสที่ระบุตัวบุคคลโดยไม่ซ้ำกันในแหล่งข้อมูลภายนอก",
	finserv__status__c                                        	string        comment "Def(En): Status of goal.
Def(Th): สถานะของเป้าหมาย",
	finserv__taxbracket__pc                                   	string        comment "Def(En): Rate at which this individual is taxed.
Def(Th): อัตราที่บุคคลนี้ถูกเก็บภาษี",
	finserv__taxid__pc                                        	string        comment "Def(En): Tax Identification Number associated with this financial account.
Def(Th): หมายเลขประจำตัวผู้เสียภาษีที่เกี่ยวข้องกับบัญชีการเงินนี้",
	finserv__timehorizon__c                                   	string        comment "Def(En): Individual’s investment time frame.
Def(Th): กรอบเวลาการลงทุนของแต่ละบุคคล",
	finserv__totalaumjointowner__c                            	decimal(16,2) comment "Def(En): Total value of financial accounts that your company manages, for which this individual is the joint owner of jointly owned accounts.
Def(Th): มูลค่ารวมของบัญชีการเงินที่อยู่ใต้การจัดการของธนาคาร โดยบุคคลนี้เป็นเจ้าของร่วมของบัญชีที่เป็นเจ้าของร่วมกัน",
	finserv__totalaumprimaryowner__c                          	decimal(16,2) comment "Def(En): Total value of financial accounts that your company manages, for which this individual is the primary owner of either separately owned or jointly owned accounts.
Def(Th): มูลค่ารวมของบัญชีการเงินที่อยู่ใต้การจัดการของธนาคาร โดยบุคคลนี้เป็นเจ้าของหลักของบัญชีที่เป็นเจ้าของแยกต่างหากหรือเป็นเจ้าของร่วมกัน",
	finserv__totalbankdeposits__c                             	string        comment "Def(En): Value of all banking deposit accounts.
Def(Th): มูลค่าบัญชีเงินฝากธนาคารทั้งหมด",
	finserv__totalbankdepositsjointowner__c                   	decimal(16,2) comment "Def(En): Value of all banking deposit accounts for which the client is the joint owner.
Def(Th): มูลค่าของบัญชีเงินฝากธนาคารทั้งหมดที่ลูกค้าเป็นเจ้าของร่วม",
	finserv__totalbankdepositsprimaryowner__c                 	decimal(16,2) comment "Def(En): Value of all banking deposit accounts for which the client is the primary owner.
Def(Th): มูลค่าของบัญชีเงินฝากธนาคารทั้งหมดที่ลูกค้าเป็นเจ้าของหลัก",
	finserv__totalfinacctsjointowner__c                       	decimal(16,2) comment "Def(En): Calculated total of jointly owned financial account balances for which the client is the joint owner.
Def(Th): ยอดรวมจากการคำนวณของยอดคงเหลือในบัญชีการเงินที่ลูกค้าเป็นเจ้าของร่วม",
	finserv__totalfinacctsprimaryowner__c                     	decimal(16,2) comment "Def(En): Calculated total of financial account balances where the client is the primary owner of either individually owned and jointly owned accounts.
Def(Th): ยอดรวมในบัญชีทางการเงินที่คำนวณโดยที่ลูกค้าเป็นเจ้าของหลักของบัญชีที่เป็นของตนเองหรือเป็นเจ้าของร่วมกัน",
	finserv__totalfinancialaccounts__c                        	string        comment "Def(En): Sum of Total Bank Deposits and Total Investments.
Def(Th): ผลรวมของเงินฝากธนาคารทั้งหมดและเงินลงทุนทั้งหมด",
	finserv__totalheldfinacctsjointowner__c                   	decimal(16,2) comment "Def(En): Calculated total of held, jointly owned financial account balances for which the client is the joint owner.
Def(Th): ยอดรวมจากการคำนวณของยอดคงเหลือในบัญชีการเงินที่ถือครองและเป็นเจ้าของร่วมกันซึ่งลูกค้าเป็นเจ้าของร่วม",
	finserv__totalheldfinacctsprimaryowner__c                 	decimal(16,2) comment "Def(En): Calculated total of held financial account balances where the client is the primary owner of either individually owned or jointly owned accounts.
Def(Th): ยอดรวมที่คำนวณของยอดคงเหลือในบัญชีการเงินที่ลูกค้าเป็นเจ้าของหลักของบัญชีที่เป็นของตนเองหรือเป็นเจ้าของร่วมกัน",
	finserv__totalinsurance__c                                	string        comment "Def(En): Value of all insurance policies.
Def(Th): มูลค่ากรมธรรม์ประกันภัยทั้งหมด",
	finserv__totalinsurancejointowner__c                      	decimal(16,2) comment "Def(En): Value of all insurance policies for which the client is the joint owner.
Def(Th): มูลค่ากรมธรรม์ประกันภัยทั้งหมดที่ลูกค้าเป็นเจ้าของร่วม",
	finserv__totalinsuranceprimaryowner__c                    	decimal(16,2) comment "Def(En): Value of all insurance policies for which the client is the primary owner.
Def(Th): มูลค่ากรมธรรม์ประกันภัยทั้งหมดที่ลูกค้าเป็นเจ้าของหลัก",
	finserv__totalinvestments__c                              	string        comment "Def(En): Value of all investment accounts.
Def(Th): มูลค่าของบัญชีการลงทุนทั้งหมด",
	finserv__totalinvestmentsjointowner__c                    	decimal(16,2) comment "Def(En): Value of all investment accounts for which the client is the joint owner.
Def(Th): มูลค่าของบัญชีการลงทุนทั้งหมดที่ลูกค้าเป็นเจ้าของร่วม",
	finserv__totalinvestmentsprimaryowner__c                  	decimal(16,2) comment "Def(En): Value of all investment accounts for which the client is the primary owner.
Def(Th): มูลค่าของบัญชีการลงทุนทั้งหมดที่ลูกค้าเป็นเจ้าของหลัก",
	finserv__totalliabilities__c                              	string        comment "Def(En): Value of all liabilities accounts.
Def(Th): มูลค่าของบัญชีหนี้สินทั้งหมด",
	finserv__totalliabilitiesjointowner__c                    	decimal(16,2) comment "Def(En): Total value of liabilities, for which this individual is the joint owner of jointly owned liabilities.
Def(Th): มูลค่ารวมของหนี้สินซึ่งบุคคลนี้เป็นเจ้าของร่วมของหนี้สินที่เป็นเจ้าของร่วมกัน",
	finserv__totalliabilitiesprimaryowner__c                  	decimal(16,2) comment "Def(En): Total value of liabilities, for which this individual is the primary owner of either separately owned or jointly owned liabilities.
Def(Th): มูลค่ารวมของหนี้สิน ซึ่งบุคคลนี้เป็นเจ้าของหลักของหนี้สินที่เป็นเจ้าของแยกต่างหากหรือที่เป็นเจ้าของร่วมกัน",
	finserv__totalnonfinancialassets__c                       	string        comment "Def(En): Value of all physical assets such as collectibles or precious metals.
Def(Th): มูลค่าของทรัพย์สินทางกายภาพทั้งหมด เช่น ของสะสมหรือโลหะมีค่า",
	finserv__totalnonfinancialassetsjointowner__c             	decimal(16,2) comment "Def(En): Value of all physical assets such as collectibles or precious metals for which the client is the joint owner.
Def(Th): มูลค่าของทรัพย์สินทางกายภาพทั้งหมด เช่น ของสะสมหรือโลหะมีค่าที่ลูกค้าเป็นเจ้าของร่วม",
	finserv__totalnonfinancialassetsprimaryowner__c           	decimal(16,2) comment "Def(En): Value of all physical assets such as collectibles or precious metals for which the client is the primary owner.
Def(Th): มูลค่าของทรัพย์สินทางกายภาพทั้งหมด เช่น ของสะสมหรือโลหะมีค่าที่ลูกค้าเป็นเจ้าของหลัก",
	finserv__totalnumberoffinaccounts__c                      	string        comment "Def(En): Total number of the client's financial accounts that are managed by our firm.
Def(Th): จำนวนบัญชีทางการเงินทั้งหมดของลูกค้าที่บริษัทของเราจัดการ",
	finserv__totalnumberoffinaccountsjointowner__c            	decimal(16,2) comment "Def(En): Total numbers of client's financial accounts as a joint owner.
Def(Th): จำนวนบัญชีทางการเงินของลูกค้าทั้งหมดในฐานะเจ้าของร่วม",
	finserv__totalnumberoffinaccountsprimaryowner__c          	decimal(16,2) comment "Def(En): Total numbers of client's financial accounts as a primary owner.
Def(Th): จำนวนบัญชีทางการเงินของลูกค้าทั้งหมดในฐานะเจ้าของหลัก",
	finserv__totaloutstandingcredit__c                        	string        comment "Def(En): Value of client's total outstanding credit from the financial accounts that are managed by our firm.
Def(Th): มูลค่าเครดิตคงค้างทั้งหมดของลูกค้าจากบัญชีการเงินที่บริษัทของเราจัดการ",
	finserv__totaloutstandingcreditjointowner__c              	decimal(16,2) comment "Def(En): Value of the total outstanding credit for which the client is a joint owner from the financial accounts that are managed by a specific firm.
Def(Th): มูลค่าของเครดิตคงค้างทั้งหมดที่ลูกค้าเป็นเจ้าของร่วมจากบัญชีทางการเงินที่ได้รับการจัดการโดยบริษัทเฉพาะ",
	finserv__totaloutstandingcreditprimaryowner__c            	decimal(16,2) comment "Def(En): Value of the total outstanding credit for which the client is the primary owner from the financial accounts that are managed by a specific firm.
Def(Th): มูลค่าของเครดิตคงค้างทั้งหมดที่ลูกค้าเป็นเจ้าของหลักจากบัญชีทางการเงินที่จัดการโดยบริษัทเฉพาะ",
	finserv__totalpremium__c                                  	decimal(18,0) comment "Def(En): Policyholder’s total annual premium.
Def(Th): เบี้ยประกันภัยรายปีรวมของผู้ถือกรมธรรม์",
	finserv__totalrevenue__c                                  	decimal(16,2) comment "Def(En): Total amount of revenue for a client.
Def(Th): จำนวนรายได้ทั้งหมดสำหรับลูกค้า",
	finserv__twitter__pc                                      	string        comment "Def(En): Twitter profile URL.
Def(Th): โปรไฟล์ทวิตเตอร์ URL",
	finserv__walletshare__c                                   	string        comment "Def(En): Percentage of this individual’sfinancial assets that your company manages or administers. Calculated as the percent of financial accounts that are held
Def(Th): เปอร์เซ็นต์ของสินทรัพย์ทางการเงินของบุคคลนี้ที่อยู่ใต้การบริหารจัดการของธนาคาร คำนวณเป็นเปอร์เซ็นต์ของบัญชีการเงินที่ถือครอง",
	finserv__weddinganniversary__pc                           	date          comment "Def(En): Date of wedding anniversary.
Def(Th): วันครบรอบแต่งงาน.",
	first_visited_date__c                                     	date          comment "Def(En): First Visited Date This Year
Def(Th): วันที่ทำการเข้าเยี่ยมลูกค้าครั้งแรกของปีนี้",
	generation__pc                                            	string        comment "Def(En): Customer Generation
Def(Th): รุ่น Generation ของลูกค้า",
	gift_baskets_cbs__pc                                      	string        comment "Def(En): Type of Gift Basket 
Def(Th): ประเภทกระเช้าของขวัญ",
	gift_cbs__pc                                              	string        comment "Def(En): Event tickets as gifts for customers
Def(Th): ของขวัญประเภทบัตรเข้าร่วม Event",
	gift_derivery__pc                                         	string        comment "Def(En): Pending Gift for deliver
Def(Th): ของขวัญที่รอจัดส่ง",
	grading_high_value2__c                                    	string        comment "Def(En): This field indicates whether the customer is high value
Def(Th): เป็นลูกค้า High Value หรือไม่",
	grading_non_high_value2__c                                	string        comment "Def(En): This field indicates whether the customer is non high value
Def(Th):เป็นลูกค้า Non High Value หรือไม่",
	greenlane__c                                              	string        comment "Def(En): This field indicates whether a customer is greenlane customer
Def(Th): เป็นลูกค้ากรีนเลนหรือไม่",
	group__c                                                  	string        comment "Def(En): Customer Group CBS
Def(Th): ชื่อกลุ่มลูกค้า CBS",
	group_sub_group_global__c                                 	string        comment "Def(En): Saesforce ID of Group / Sub Group Data
Def(Th): Salesforce ID 18 หลักของข้อมูล Group / Sub Group",
	group_subgroup_teamleadname__c                            	string        comment "Def(En): Team Lead Name of Group/Sub Group CBS
Def(Th): ชื่อ Team Lead ของ Group/Sub Group CBS",
	have_you_ever_use_contact_with_consult2__c                	string        comment "Def(En): This field indicates that the customer contact with consult
Def(Th): ลูกค้าเคยทำการติดต่อผู้ให้คำปรึกษาหรือไม่",
	health_body_life_style__pc                                	string        comment "Def(En): Healthy body Lifestyle
Def(Th): วิธีการรักษาสุขภาพร่างกาย",
	health_mind_life_style__pc                                	string        comment "Def(En): Healthy Mind Lifestyle
Def(Th): วิธีการรักษาสุขภาพจิตใจ",
	high_value__c                                             	string        comment "Def(En): High Value Customer Information
Def(Th): รายละเอียดลูกค้า High Value",
	high_value_flag__pc                                       	string        comment "Def(En): This field indicates whether a customer is a potential customer
Def(Th): เป็นลูกค้าที่มีโอกาสในการขายหรือไม่",
	icr_ratio__c                                              	decimal(8,2)  comment "Def(En): Interest Coverage Ratio
Def(Th): อัตราส่วนความสามารถในการจ่ายดอกเบี้ย",
	identification_no__c                                      	string        comment "Def(En): Customer Identification Number
Def(Th): เลขบัตรประชาชนของลูกค้า",
	identification_no_prospect__c                             	string        comment "Def(En): Prospect Identification Number
Def(Th): เลขบัตรประชาชนของลูกค้าที่เป็น Prospect",
	import_experiences__c                                     	string        comment "Def(En): Import Experience
Def(Th): ประสบการณ์ในการ Import",
	income_to_bank_last_1_month__c                            	decimal(18,0) comment "Def(En): Income to Bank Last 1 Month
Def(Th): รายได้ต่อธนาคาร 1 เดือนที่ผ่านมา",
	income_to_bank_last_year__c                               	decimal(18,0) comment "Def(En): Income to Bank Last Year
Def(Th): รายได้ต่อธนาคารปีที่แล้ว",
	income_to_bank_last_year_range__c                         	string        comment "Def(En): Income to Bank Last Year Range
Def(Th): ช่วงรายได้ต่อธนาคารปีที่แล้ว",
	income_to_bank_this_year__c                               	decimal(18,0) comment "Def(En): Income to Bank This Year
Def(Th): รายได้ต่อธนาคารปีนี้",
	income_to_bank_this_year_range__c                         	string        comment "Def(En): Income to Bank This Year Range
Def(Th): ช่วงรายได้ต่อธนาคารปีนี้",
	income_to_sme__c                                          	decimal(16,2) comment "Def(En): Income to SME
Def(Th): รายได้ของ SME",
	incorrect_name__c                                         	string        comment "Def(En): The Value is Done if the customer is not the main contact (use for Lead Cus Sat)
Def(Th): มีค่าเป็น Done เมื่อไม่ใช่ผู้ติดต่อหลักใช้กับ Lead Cus Sat",
	incorrect_phone_number__c                                 	string        comment "Def(En): The Value is Done if the customer's phone number incorect (use for Lead Cus Sat)
Def(Th): มีค่าเป็น Done เมื่อเบอร์โทรผู้ติดต่อผิดใช้กับ Lead Cus Sat",
	industry_color_group__c                                   	string        comment "Def(En): Industry Color Group
Def(Th): สีความเสี่ยงด้านเครดิต",
	industry_grade__c                                         	string        comment "Def(En): Industry Grade
Def(Th): เกรดอุคสาหกรรม",
	industry_risk__c                                          	string        comment "Def(En): Induxtry Risk
Def(Th): ความเสี่ยงอุตสาหกรรม",
	isconverted__c                                            	string        comment "Def(En): This field indicates whether the customer is converted
Def(Th): ลูกค้าได้มีการ convert แล้วหรือไม่",
	issuedandpaidup__c                                        	decimal(16,2) comment "Def(En): Shareholder Capital and Issued and paid-up share capital.


Def(Th): ทุนส่วนของผู้ถือหุ้นและทุนที่ออกและชำระแล้ว",
	kpb_monthly_statement_subscription__c                     	string        comment "Def(En): Kbank Private Banking Monthly Statement Subscription
Def(Th): การสมัครสมาชิกใบแจ้งยอดรายเดือนของ Kbank Private Banking",
	ksec_call_log__c                                          	string        comment "Def(En): Results of collaboration between KBANK - KSEC
Def(Th): ผลการทำงานร่วมกันระหว่าง KBANK - KSEC",
	kyb__c                                                    	string        comment "Def(En): This field indicates whether a customer is KYB Customer
Def(Th): ลูกค้าที่ธนาคารรู้จักลักษณะธุรกิจ (Know Your Business : KYB) ไม่ต้องยื่นเอกสารประกอบธุรกรรมเงินโอนออกต่างประเทศ",
	last_answer_lead_by__r_external_id__c                     	string        comment "Def(En): Latest Employee ID that response lead
Def(Th): รหัสพนักงานที่ทำการตอบลีดคนล่าสุด",
	last_answer_lead_datetime__c                              	timestamp     comment "Def(En): The lastest datetime that lead has been updated
Def(Th): วันที่ทำการตอบลีดล่าสุด",
	last_callreprt_opty_updated_date__c                       	timestamp     comment "Def(En): The lastest datetime that call report has been updated
Def(Th): วันที่ทำการอัพเดทผลการเยี่ยมล่าสุด",
	last_setup_by__c                                          	string        comment "Def(En): The lastest employee name that setup application
Def(Th): ชื่อพนักงานที่ทำการตั้งวงเงิน",
	last_setup_date__c                                        	date          comment "Def(En): The lastest datetime that application has been setup
Def(Th): วันและเวลาที่ทำการตั้งวงเงิน",
	last_visited_by__c                                        	string        comment "Def(En): The lastest employee name that visit the customer
Def(Th): ชื่อพนักงานที่ทำการเข้าเยี่ยมลูกค้าล่าสุด",
	last_visited_datetime__c                                  	timestamp     comment "Def(En): The lastest datetime that customer has been visited
Def(Th): วันและเวลาที่เข้าเยี่ยมล่าสุด",
	last_year_gift_cbs__pc                                    	string        comment "Def(En): Last year gift for the customer
Def(Th): ของขวัญที่เคยได้รับ",
	lead_for_feedback_cbs__c                                  	string        comment "Def(En): Customer Lead for Feedback
Def(Th): ชื่อ Lead for Feedback บนลูกค้า",
	lead_for_sales__c                                         	string        comment "Def(En): Customer Lead for Sales
Def(Th): ชื่อ Lead for Sales บนลูกค้า",
	lead_sharing_expired_date__c                              	date          comment "Def(En): Lead Sharing Expired Date
Def(Th): วันหมดอายุของ Lead Sharing",
	lead_status__c                                            	string        comment "Def(En): Customer Lead Status
Def(Th): สถานะการดำเนินการลีดบนลูกค้า",
	lead_to_do__c                                             	string        comment "Def(En): Customer Lead for Feedback
Def(Th): ชื่อ Lead To Do บนลูกค้า",
	lead_to_inform__c                                         	string        comment "Def(En): Customer Lead for Feedback
Def(Th): ชื่อ Lead To Inform บนลูกค้า",
	lead_visit_cbs__c                                         	string        comment "Def(En): This field indicates wheather lead CBS is response
Def(Th): มีการดำเนินการลีดของ CBS ไปแล้วหรือไม่",
	liabilitiesaccountpayable__c                              	decimal(16,2) comment "Def(En): Liabilities Accounts Payable
Def(Th): เจ้าหนี้การค้า",
	liabilitiescurrentliability__c                            	decimal(16,2) comment "Def(En): Liabilities Current Liability 
Def(Th): รวมหนี้สินหมุนเวียน",
	liabilitiesetc2__c                                        	decimal(16,2) comment "Def(En): Other Liabilities 2
Def(Th): รวมหนี้สินอื่นๆ 2",
	liabilitiesetc__c                                         	decimal(16,2) comment "Def(En): Other Liabilities
Def(Th): รวมหนี้สินอื่นๆ",
	liabilitieslongtermloan__c                                	decimal(16,2) comment "Def(En): Liabilities Long Term Loan
Def(Th): เงินกู้ยืมระยะยาว",
	liabilitiesnoncurrentliabilites__c                        	decimal(16,2) comment "Def(En): Non Current Liabilities 
Def(Th): รวมหนี้สินไม่หมุนเวียน",
	liabilitiesod__c                                          	decimal(16,2) comment "Def(En): Liabilities Overdraft
Def(Th): เงินเบิกเกินบัญชีและเงินกู้ยืม",
	liabilitiesshorttermloan__c                               	decimal(16,2) comment "Def(En): Liabilities Short Term Loan 
Def(Th): เงินกู้ยืมระยะสั้น",
	liabilitiestotalliability__c                              	decimal(16,2) comment "Def(En): Total Liabilities
Def(Th): รวมหนี้สิน",
	life_style__pc                                            	string        comment "Def(En): Customer LifeStyle
Def(Th): ไลฟ์สไตล์ของลูกค้า",
	life_style_details__pc                                    	string        comment "Def(En): Additional Life Style Detail
Def(Th): รายละเอียดเพิ่มเติม Life Style ของลูกค้า",
	line_id__pc                                               	string        comment "Def(En): Customer Line ID
Def(Th): Line ID ของลูกค้า",
	main_bank__c                                              	string        comment "Def(En):  This field indicates that the customer is a Main Bank
Def(Th): ลูกค้าเป็น Main Bank หรือไม่",
	main_bank_corporate__c                                    	string        comment "Def(En): This field indicates that the customer is a Coporate Main Bank
Def(Th): ลูกค้าเป็น Coporate Main Bank หรือไม่",
	main_bank_retail__c                                       	string        comment "Def(En): This field indicates that the customer is a Retail Main Bank
Def(Th): ลูกค้าเป็น Retail Main Bank หรือไม่",
	master_rm_reason__c                                       	string        comment "Def(En): Reason to become Master RM
Def(Th): สาเหตุที่เป็น Master RM",
	mbb__c                                                    	string        comment "Def(En): Main Borrower Bank
Def(Th): ธนาคารผู้กู้หลัก",
	mbb_rbs__c                                                	string        comment "Def(En): Main Borrower Bank (RBS)
Def(Th): ธนาคารผู้กู้หลักของลูกค้า RBS",
	merge_status__c                                           	string        comment "Def(En): Main Borrower Bank (RBS)
Def(Th): สถานะการ Merge ของลูกค้า",
	merge_status_code__c                                      	string        comment "Def(En): Main Borrower Bank (RBS)
Def(Th): Code การ Merge ลูกค้า",
	mf_guarantee__c                                           	string        comment "Def(En): This field indicates that the fund can use as a collateral or not
Def(Th): สามารถใช้กองทุนเป็นหลักประกันได้",
	mob__c                                                    	string        comment "Def(En): Monthly Outstanding Balance
Def(Th): ยอดค้างชำระรายเดือน",
	mob_rbs__c                                                	string        comment "Def(En): RBS Monthly Outstanding Balance
Def(Th): ยอดค้างชำระรายเดือน RBS",
	mobile_phone_2__c                                         	string        comment "Def(En): Mobile Phone 2
Def(Th): เบอร์โทรศัพท์มือถือ 2",
	mobile_phone__c                                           	string        comment "Def(En): Mobile Phone
Def(Th): เบอร์โทรศัพท์มือถือ",
	monthly_income__c                                         	string        comment "Def(En): Customer Monthly Income
Def(Th): รายได้ต่อเดือน",
	most_interested_topic__pc                                 	string        comment "Def(En): The most interesting Topic
Def(Th): Topic ที่ลูกค้าสนใจมากที่สุด",
	most_visit_place__c                                       	string        comment "Def(En): The place that most visited by the customer
Def(Th): สถานที่ลูกค้าไปบ่อยที่สุด",
	msib_rbs__c                                               	string        comment "Def(En): Main saving and investment bank
Def(Th): ธนาคารหลักในการออมและการลงทุน",
	name_surname_en__c                                        	string        comment "Def(En): Name and Surname in English
Def(Th): ชื่อและนามสกุลลูกค้าภาษาอังกฤษ",
	name_surname_th__c                                        	string        comment "Def(En): Name and Surname in Thai
Def(Th): ชื่อและนามสกุลลูกค้าภาษาไทย",
	nationality_cbs__pc                                       	string        comment "Def(En): CBS Nationality
Def(Th): สัญชาติของลูกค้า CBS",
	network_name__c                                           	string        comment "Def(En): Network Name
Def(Th): ชื่อทีมของภาค",
	nh_emp_id__c                                              	string        comment "Def(En): Owner NH Emp ID
Def(Th): รหัส Emp ID ของ NH ของ Owner",
	nh_name__c                                                	string        comment "Def(En): Owner NH Name
Def(Th): ชื่อ NH ของ Owner",
	nh_rc_code__c                                             	string        comment "Def(En): NH RC Code
Def(Th): รหัส NH RC Code ของภาค",
	nh_tl_name__c                                             	string        comment "Def(En): CBS Team Lead Name
Def(Th): ชื่อ Team Lead ของ CBS",
	nickname__pc                                              	string        comment "Def(En): Customer Nickname
Def(Th): ชื่อเล่นของลูกค้า",
	no_of_selection__c                                        	decimal(2,0)  comment "Def(En): Count selection from RBS Port Selection
Def(Th): จำนวนพนักงานที่เลือกลูกค้าเข้า Port",
	number_of_product_holding__c                              	decimal(18,0) comment "Def(En): Number of Product Holding
Def(Th): จำนวน Product Holding",
	office_ext_cbs__pc                                        	string        comment "Def(En): Internal extension number
Def(Th): หมายเลขติดต่อภายใน",
	office_fax_mashup__c                                      	string        comment "Def(En): Company Fax
Def(Th): เบอร์แฟกซ์บริษัท",
	office_mobile_mashup__c                                   	string        comment "Def(En): Company Mobile phone number
Def(Th): เบอร์โทรศัพท์มือถือบริษัท",
	office_number__pc                                         	string        comment "Def(En): Phone format must be in number with 9 or 10 digits
Def(Th):",
	office_phone_mashup__c                                    	string        comment "Def(En): Company Phone number
Def(Th): เบอร์โทรศัพท์บริษัท",
	online_channel__c                                         	string        comment "Def(En): Value if customer has online shop, filled in by Branch from Call Report
Def(Th): เป็น field Stamp ค่าจาก Call Report ที่สาขากรอกว่าลูกค้ามีการขายของออนไลน์หรือไม่",
	other_info_about_character__pc                            	string        comment "Def(En): Customer Character Information
Def(Th): ข้อมูลบุคลิกหรืออุปนิสัยอื่นๆของลูกค้า",
	other_life_style_detail__pc                               	string        comment "Def(En): Customer Life Style Details
Def(Th): ข้อมูล Life Style ของลูกค้า",
	other_segment__c                                          	string        comment "Def(En): Others Segment
Def(Th): Segment อื่น",
	owner_ah_rc_code__c                                       	string        comment "Def(En): Area Head RC Code
Def(Th): รหัส RC Code ของเขต",
	owner_emp_id__c                                           	string        comment "Def(En): Owner Employee ID
Def(Th): รหัสพนักงานผู้ดูแล",
	owner_name__c                                             	string        comment "Def(En): Customer Owner Name
Def(Th): ชื่อเจ้าของลูกค้า",
	owner_name_pb__c                                          	string        comment "Def(En): Private Banking Customer Owner Name
Def(Th): ชื่อเจ้าของลูกค้า Private Banking",
	owner_nh_rc_code__c                                       	string        comment "Def(En): Network Head RC Code
Def(Th): รหัส NH RC Code ของลูกค้า",
	owner_profile__c                                          	string        comment "Def(En): Customer Owner Profile Name
Def(Th): Profile ของเจ้าของลูกค้า",
	owner_rc_code__c                                          	string        comment "Def(En): Customer Owner RC Code
Def(Th): เลข RC Code ของเจ้าของลูกค้า",
	ownerid_text__c                                           	string        comment "Def(En): Salesforce ID of Owner
Def(Th): Salesforce ID ของเจ้าของลูกค้า",
	pb_last_visited_datetime__c                               	timestamp     comment "Def(En): PB Last Visited Date Time
Def(Th): วันเวลาที่ PB ออกไปหาลูกค้าล่าสุด",
	pb_phone_1__c                                             	string        comment "Def(En): Phone 1 for HN Customer. Manually upload by PB-Admin.
Def(Th): เบอร์ Phone 1 สำหรับลูกค้า HN",
	pb_phone_2__c                                             	string        comment "Def(En): Phone 2 for HN Customer. Manually upload by PB-Admin.
Def(Th): เบอร์ Phone 2 สำหรับลูกค้า HN",
	pb_team_formula__c                                        	string        comment "Def(En): PB's Team Name
Def(Th): ชื่อสาขาของ PB",
	personal_email__c                                         	string        comment "Def(En): Personal Email
Def(Th): อีเมลล์ส่วนตัว",
	personal_email__pc                                        	string        comment "Def(En): Personal Email
Def(Th): อีเมลล์ส่วนตัว",
	personal_email_mashup__c                                  	string        comment "Def(En): Personal Email
Def(Th): อีเมลล์ส่วนตัว",
	personal_mobile_mashup__c                                 	string        comment "Def(En): Personal Mobile Number
Def(Th): เบอร์โทรศัพท์มือถือส่วนตัว",
	personalized_msg_1__c                                     	string        comment "Def(En): Trigger Information 1
Def(Th): รายละเอียด Trigger 1",
	personalized_msg_2__c                                     	string        comment "Def(En): Trigger Information 2
Def(Th): รายละเอียด Trigger 2",
	personalized_msg_3__c                                     	string        comment "Def(En): Trigger Information 3
Def(Th): รายละเอียด Trigger 3",
	personalized_msg_4__c                                     	string        comment "Def(En): Trigger Information 4
Def(Th): รายละเอียด Trigger 4",
	personalized_msg_5__c                                     	string        comment "Def(En): Trigger Information 5
Def(Th): รายละเอียด Trigger 5",
	personalized_msg_6__c                                     	string        comment "Def(En): Trigger Information 6
Def(Th): รายละเอียด Trigger 6",
	personalized_msg_7__c                                     	string        comment "Def(En): Trigger Information 7
Def(Th): รายละเอียด Trigger 7",
	personalized_msg_8__c                                     	string        comment "Def(En): Trigger Information 8
Def(Th): รายละเอียด Trigger 8",
	ph_ca__c                                                  	string        comment "Def(En): This field indicates whether the customer has Current Account
Def(Th): ลูกค้ามีบัญชีกระแสรายวันหรือไม่",
	ph_credit_card__c                                         	string        comment "Def(En): This field indicates whether the customer has Credit Card
Def(Th): ลูกค้ามีบัตรเครดิตหรือไม่",
	ph_sav__c                                                 	string        comment "Def(En): This field indicates whether the customer has Saving Account
Def(Th): ลูกค้ามีบัญชีเงืนฝากหรือไม่",
	phone_2__c                                                	string        comment "Def(En): Customer Phone Number
Def(Th): เบอร์โทรศัพท์ของลูกค้า",
	phone_number__pc                                          	string        comment "Def(En): Customer Phone Number
Def(Th): เบอร์โทรศัพท์ของลูกค้า",
	phone_numbers__pc                                         	string        comment "Def(En): Customer Phone Number
Def(Th): เบอร์โทรศัพท์ของลูกค้า",
	phonesale_service__c                                      	string        comment "Def(En): This field indicates whether the customer has phone sales service
Def(Th): ลูกค้ามีบริการ Phone Sale หรือไม่",
	port_pool__c                                              	string        comment "Def(En): Port/Pool status of Owner
Def(Th): สถานะ Port/Pool ของ Owner",
	port_pool_branch__c                                       	string        comment "Def(En): Branch Port / Pool
Def(Th): ค่า Port/Pool ของ Branch",
	port_pool_dual_rm__c                                      	string        comment "Def(En): Port/Pool Dual Status
Def(Th): สถานะ Port/Pool Dual",
	port_priority__c                                          	string        comment "Def(En): Customer's Priority for Master RM
Def(Th): Priority ลูกค้า ให้ Master RM จัดระดับความสำคัญ",
	portpoolformula__c                                        	string        comment "Def(En): DNW Port/Pool
Def(Th): ค่า Port/Pool ของทีมขาย DNW",
	position_recipient_cbs__pc                                	string        comment "Def(En): Gift recipient position
Def(Th): ตำแหน่งผู้รับของขวัญ",
	potential_value__c                                        	string        comment "Def(En): Potential customer
Def(Th): ลูกค้าที่มี Potential",
	presentation_skill__pc                                    	string        comment "Def(En): Presentation skill
Def(Th): ทักษะการนำเสนอ",
	previous_ah_name__c                                       	string        comment "Def(En): Previous AH Name
Def(Th): AH คนก่อนหน้า",
	previous_dual_rm__c                                       	string        comment "Def(En): Previous Dual RM
Def(Th): Dual RM คนก่อนหน้า",
	previous_hn_name__c                                       	string        comment "Def(En): Salesforce ID of Previous HN
Def(Th): Salesforce ID ของ HN คนก่อนหน้า",
	previous_hn_team__c                                       	string        comment "Def(En): Salesforce ID of Previous HN's Team
Def(Th): Salesforce ID ของทีม HN คนก่อนหน้า",
	previous_inactive_bm_rc_code__c                           	string        comment "Def(En): Previous Owner RC Code
Def(Th): รหัส RC Code ของทีมเจ้าของลูกค้าก่อนหน้านี้",
	previous_nh_name__c                                       	string        comment "Def(En): Previous HN Name
Def(Th): ชื่อของ HN คนก่อนหน้า",
	previous_owner__c                                         	string        comment "Def(En): Salesforce ID of Previous Owner
Def(Th): Salesforce ID ของเจ้าของลูกค้าคนก่อนหน้า",
	previous_owner_emp_id__c                                  	string        comment "Def(En): Previous Owner Employee ID
Def(Th): รหัสพนักงานของ Owner คนก่อนหน้า",
	previous_owner_extension__c                               	string        comment "Def(En): Previous Owner User Extension
Def(Th): User Extension ของ Owner คนก่อนหน้า",
	previous_owner_segment_code__c                            	string        comment "Def(En): Previous Owner Segment Code
Def(Th): Segment ของ Owner คนก่อน",
	previous_service_rm__c                                    	string        comment "Def(En): Previous Service RM Emp ID
Def(Th): รหัส Service RM คนก่อนหน้า",
	previous_service_rm_team__c                               	string        comment "Def(En): Previous Service RM team
Def(Th): ทีมของ Service RM คนก่อนหน้า",
	previous_team_name__r_external_id__c                      	string        comment "Def(En): Previous Team Code
Def(Th): รหัสทีมเจ้าของลูกค้าก่อนหน้านี้",
	primary_contact__pc                                       	string        comment "Def(En): Primary customer contact
Def(Th): ติดต่อลำดับแรก",
	primary_segment_code__c                                   	string        comment "Def(En): Used to stored RM Segment Code
Def(Th): เปลี่ยนชื่อมาจาก Primary Segment Code
ใช้เก็บ RM Segment Code",
	primary_segment_desc__c                                   	string        comment "Def(En): Segment full name
Def(Th): แปลตัวย่อ Segment ให้เป็นชื่อเต็ม",
	primary_sub_segment_code__c                               	string        comment "Def(En): Segment abbreviation
Def(Th): ชื่อย่อ segment",
	prospect_create_duration__c                               	string        comment "Def(En): Duration of creating prospect
Def(Th): ระยะเวลาที่สร้างลูกค้า prospect",
	prospect_create_duration_number__c                        	string        comment "Def(En): Duration of creating prospect
Def(Th): ระยะเวลาที่สร้างลูกค้า prospect",
	ps_name_cbs__c                                            	string        comment "Def(En): 
Def(Th): PS ที่ดูแลลูกค้าของ CBS",
	race__c                                                   	string        comment "Def(En): Race
Def(Th): เชื้อชาติ",
	rbs_branch_closeness__c                                   	string        comment "Def(En): Branch Closness RC Code
Def(Th): เลข RC สาขาคนสนิท",
	rbs_previous_branch_closeness__c                          	string        comment "Def(En): Previous Branch Closness RC Code
Def(Th): เลข RC สาขาคนสนิทคนก่อน",
	rbsbranchcode__c                                          	string        comment "Def(En): Branch RC Code calculated from priority > 1.Closeness > 2.Max Wealth > 3.Max Frequency > 4.Open Branch
Def(Th): เลข RC ของสาขาที่คำนวณจาก Priority > 1.สาขาสนิท > 2.Max Wealth > 3.Max Frequency > 4.Open Branch",
	rbsbranchmgrempid__c                                      	string        comment "Def(En): Employee ID of Branch Closeness's Manager
Def(Th): รหัสพนักงานของผู้จัดการสาขาสนิทของลูกค้า",
	rc_code__c                                                	string        comment "Def(En): Owner RC code
Def(Th): RC Code ของเจ้าของลูกค้า",
	recipient_cbs__pc                                         	string        comment "Def(En): Name of gift recipient
Def(Th): ชื่อ-นามสกุล ผู้รับของขวัญ (กรณีไม่ตรง contact)",
	recipient_mobile_cbs__pc                                  	string        comment "Def(En): Gift recipient's phone number
Def(Th): เบอร์โทรศัพท์ที่ติดต่อได้ของผู้รับของขวัญ",
	recreation_life_style__pc                                 	string        comment "Def(En): lifestyle
Def(Th): รูปแบบการใช้ชีวิน",
	refer_customer_type__c                                    	string        comment "Def(En): Customer type
Def(Th): ประเภทลูกค้า",
	refer_source__c                                           	string        comment "Def(En): Refer source
Def(Th): แหล่งที่มาของลูกค้า",
	refer_source_other__c                                     	string        comment "Def(En): Refer source
Def(Th): แหล่งที่มาของลูกค้ากรณีเลือก Refer_Source__c เป็นอื่นๆ",
	refer_type_other__c                                       	string        comment "Def(En): Customer other type
Def(Th): ประเภทลูกค้าอื่นๆ",
	refertome__c                                              	string        comment "Def(En): Is it refer to me ?
Def(Th): RM ได้รับ refer มามั้ย",
	relationship_level__pc                                    	string        comment "Def(En): Customer relationship level
Def(Th): ระดับความสัมพันธ์กับลูกค้า",
	remaining_benefit__c                                      	string        comment "Def(En): Remaining benefit
Def(Th): กำไรคงเหลือ",
	remaining_wallet__c                                       	string        comment "Def(En): Remaining Wallet Analysis Flag
Def(Th): Flag วิเคราะห์กระเป๋าคงเหลือของลูกค้า
1. กระเป๋า Working Cap : พิจารณาจากข้อมูล NCB
2. กระเป๋า Trade : พิจารณาข้อมูลกรมศุลฯ
3. กระเป๋า LI : พิจารณาจากงบการเงินของบริษัท (เฉพาะลูกค้าในกลุ่ม Construction เท่านั้น)
4. Financing Needs : พิจารณา Source & Use เทียบเครดิตที่ Kbank",
	remark__c                                                 	string        comment "Def(En): Remark
Def(Th): หมายเหตุ",
	report_sme_myteamport__c                                  	string        comment "Def(En): Is my port or pool
Def(Th): เป็นลูกค้าใน port หรือ pool",
	report_sme_teampool__c                                    	string        comment "Def(En): Is my team & Pool
Def(Th): อยู่ในทีมเดียวกันและมาจาก pool หรือไม่",
	report_wallet_size_exposure_range__c                      	string        comment "Def(En): Outstanding and limiting renge for report
Def(Th): วงเงินสินเชื่อที่อนุมัติและสิงเชื่อคงค้างสำหรับ report",
	report_wallet_size_limit_range__c                         	string        comment "Def(En): Limiting renge for report
Def(Th): วงเงินสินเชื่อที่อนุมัติสำหรับ report",
	report_wallet_size_outstanding_range__c                   	string        comment "Def(En): Outstanding range for report
Def(Th): สินเชื่อคงค้างสำหรับ report",
	retainedearning__c                                        	decimal(16,2) comment "Def(En): Retained Earning
Def(Th): Equity ส่วนของผู้ถือหุ้น - กำไร (ขาดทุน)สะสม",
	returnchequenotification__c                               	string        comment "Def(En): Return cheque notification services
Def(Th): บริการแจ้งเตือนเช็คคืน",
	review_note__c                                            	string        comment "Def(En): Customer type
Def(Th): ประเภทลูกค้า",
	reviewportdata1__c                                        	string        comment "Def(En): Reason for port review
Def(Th): สาเหตุในการรีวิวพอร์ท.",
	reviewportdata2__c                                        	string        comment "Def(En): SME Exposure as of 202005.
Def(Th): SME Exposure ณ เดือน 202005.",
	reviewportdata3__c                                        	string        comment "Def(En): Total AUM as of 202005.
Def(Th): Total AUM ณ เดือน 202005.",
	reviewportdata4__c                                        	string        comment "Def(En): Business income (per year) Tier
Def(Th): TIER รายได้ทางธุรกิจ (ต่อปี).",
	reviewportdata5__c                                        	string        comment "Def(En): 12 Months inflow account deposit Tier
Def(Th): TIER ยอดเงินเข้าบัญชี INFLOW 12 เดือน.",
	reviewportdata6__c                                        	string        comment "Def(En): Major Customer Group
Def(Th): GROUP ลูกค้ารายใหญ่",
	reviewportdata7__c                                        	string        comment "Def(En): Did Master RM visit customer in 2020
Def(Th): มีเยี่ยมโดย Master RM ในปี 2020.",
	reviewportdata8__c                                        	string        comment "Def(En): Last visited not by Master RM
Def(Th): ไม่ใช่ Master RM ที่ไปเยี่ยมล่าสุด.",
	risk__c                                                   	string        comment "Def(En): Risk level
Def(Th): ระดับความเสี่ยงที่รับได้",
	risk_symbol__c                                            	string        comment "Def(En): Picture of risk level
Def(Th): รูปภาพตามความเสี่ยงที่รับได้",
	rm_contact__c                                             	decimal(18,0) comment "Def(En): Account Owner's Phone Number
Def(Th): เบอร์ติดต่อของ RM เจ้าของลุกค้า",
	rm_name__c                                                	string        comment "Def(En): Account Owner's Name
Def(Th): ชื่อของ RM ของเจ้าของลูกค้า",
	rm_phone__c                                               	string        comment "Def(En): Account Owner's Phone Number
Def(Th): เบอร์ติดต่อของ RM เจ้าของลุกค้า",
	sales_division__c                                         	string        comment "Def(En): Is WBG segment
Def(Th): Segment ผู้ดูแลเป็น WBG",
	sales_kcl_trend__c                                        	string        comment "Def(En): Customer are likely to sell KLC
Def(Th): ลูกค้ามีแนวโน้มขาย KCL ใช้แบบสอบถาม",
	sales_size__c                                             	decimal(18,0) comment "Def(En): Sales Size
Def(Th): ยอดขาย",
	salesforce_id__c                                          	string        comment "Def(En): Account Salesforce ID
Def(Th): Salesforce ID ของ Account",
	salessizerange__c                                         	string        comment "Def(En): Manual upload Range value of sales_size__c (Manual Upload)
Def(Th): โหลดข้อมูลเพิ่มตาม field: sales_size__c",
	same_cust_rm_segment__c                                   	string        comment "Def(En): Is RM in the same segment
Def(Th): RM ผู้ดูแลอยู่ใน segment เดียวกันหรือไม่",
	scriptcustomer__c                                         	string        comment "Def(En): Customer script
Def(Th): Script รายลูกค้า",
	securitiesservicesgroup__c                                	string        comment "Def(En): Securities Services
Def(Th): บริการด้านหลักทรัพย์",
	segment__c                                                	string        comment "Def(En): Picture of primary segment code
Def(Th): รูปภาพแบ่งตาม Promary segment code",
	segmentformula__c                                         	string        comment "Def(En): This field shows Primary segment / Secondary segment
Def(Th): แสดง primary & secondary segment code",
	select_branch__c                                          	string        comment "Def(En): Team RC Code that select the customer (Port Selection)
Def(Th): รหัสทีมที่ทำการเลือกลูกค้าเข้า Port",
	sensitive_customer__c                                     	string        comment "Def(En): Check Sensitive customer
Def(Th): ลูกค้าเปราะบางมั้ย",
	senstivecustomer__c                                       	string        comment "Def(En): Check Sensitive customer
Def(Th): ลูกค้าเปราะบางมั้ย",
	service_manager__c                                        	string        comment "Def(En): Service Manager Name
Def(Th): ชื่อ Service Manager",
	service_manager_name__c                                   	string        comment "Def(En): Service Manager Name
Def(Th): ชื่อพนักงานของ Service Manager",
	service_manager_phone__c                                  	string        comment "Def(En): Service Manager Phone Number
Def(Th): เบอร์ติดต่อของ Service Manager",
	service_rm__c                                             	string        comment "Def(En): Service RM Salesforce ID
Def(Th): Salesforce ID ของ Service RM",
	service_rm_emp_id__c                                      	string        comment "Def(En): Service RM Employee ID
Def(Th): รหัสพนักงานของ Service RM",
	service_rm_phone__c                                       	string        comment "Def(En): Service RM Phone Number
Def(Th): เบอร์ติดต่อของ Service RM",
	service_team__c                                           	string        comment "Def(En): Service Team Slaesforce ID
Def(Th): Salesforce ID ของ Service Team",
	share_with__c                                             	string        comment "Def(En): Who are you sharing customer with ?
Def(Th): ในกรณีที่มีการ Share ลูกค้าโดย Lead Sharing อยู่ จะแสดงชื่อของ Bad User ที่ทำการ Share ให้อยู่",
	sharing_status__c                                         	string        comment "Def(En): Do you share customer with AN segment ?
Def(Th): แสดงสถานะของ Lead Sharing ปัจจุบันว่ามีการ Share ให้  Bad User อยู่หรือไม่ โดยหากมีค่าเป็น Sharing with AN จะมีการ Share ลูกค้าให้ Bad User",
	site_visit__c                                             	string        comment "Def(En): Able to meet customer
Def(Th): สามารถเข้าพบลูกค้าได้",
	sme_service_rm_phone__c                                   	string        comment "Def(En): RM contact number
Def(Th): เบอร์ติดต่อ RM",
	sme_temporary_customer__c                                 	string        comment "Def(En): Employee ID of customer temporary owner that has been lookuped from User object
Def(Th): รหัสพนักงาน ที่เป็นผู้ดูแลลูกค้าชั่วคราวของ ลูกค้าซึ่ง Lookup จาก User object",
	sms__c                                                    	string        comment "Def(En): Able to contact via SMS
Def(Th): สามารถติดต่อผ่าน SMS ได้",
	social_network_type__pc                                   	string        comment "Def(En): Customer Social Media
Def(Th): โซเชียลที่สามารถติดต่อลูกค้าได้",
	source_system_id__c                                       	string        comment "Def(En): Soure System
Def(Th): ที่มาของข้อมูลลูกค้า",
	sp_estimated_income_entrepreneur_account__c               	string        comment "Def(En): Estimated Income Entrepreneur
Def(Th): ประมาณการณ์รายได้ผู้ประกอบการ",
	sp_estimated_income_salary_account__c                     	string        comment "Def(En): Customer Estimated Salary
Def(Th): ประมาณเงินเดือนของลูกค้า",
	statement_email__c                                        	string        comment "Def(En): Email use for send Statement 
Def(Th): Email เตือนใบแจ้งยอด",
	statement_password_sms__c                                 	string        comment "Def(En): Phone Number use for Statement Password SMS
Def(Th): เบอร์โทรศัพท์ที่แจ้ง SMS รหัสผ่านใบแจ้งยอด",
	statusicon__c                                             	string        comment "Def(En): Customer status icon
Def(Th): สัญลักษณ์ของสถานะลูกค้า",
	stock_day_on_hand_days__c                                 	decimal(16,2) comment "Def(En): Stock Day on Hand Days
Def(Th): หุ้นที่ครอบครองในวันนี้",
	sub_group__c                                              	string        comment "Def(En): Securities company
Def(Th): บริษัทหลักทรัพย์",
	survey_oximeter_cbs__pc                                   	string        comment "Def(En): Customer contact recieved gift
Def(Th): Contact ลูกค้าที่รับของขวัญ",
	svm_ah_emp_id__c                                          	string        comment "Def(En): SVM AH's Employee ID
Def(Th): รหัสพนักงานของ AH ของ SVM ที่ดูแลลูกค้า",
	svm_ah_name__c                                            	string        comment "Def(En): SVM AH's Name
Def(Th): ชื่อพนักงานของ AH ของ SVM ที่ดูแลลูกค้า",
	svm_emp_id__c                                             	string        comment "Def(En): SVM Employee ID
Def(Th): รหัสพนักงานของ SVM ที่ดูแลลูกค้า",
	svm_in_charge__r_employee_id__c                           	string        comment "Def(En): SVM In Charge Employee ID
Def(Th): รหัสพนักงาน SVM ผู้รับผิดชอบลูกค้า",
	svm_name__c                                               	string        comment "Def(En): SVM Name
Def(Th): ชื่อพนักงานของ SVM ที่ดูแลลูกค้า",
	svm_nh_emp_id__c                                          	string        comment "Def(En): SVM NH's Employee ID
Def(Th): รหัสพนักงานของ NH ของ SVM ที่ดูแลลูกค้า",
	svm_nh_name__c                                            	string        comment "Def(En): SVM NH's Name
Def(Th): ชื่อพนักงานของ NH ของ SVM ที่ดูแลลูกค้า",
	svm_rc_code__c                                            	string        comment "Def(En): SVM RC Code
Def(Th): รหัสสาขาของ SVM ที่ดูแลลูกค้า",
	svm_tm_emp_id__c                                          	string        comment "Def(En): SVM TM's Employee ID
Def(Th): รหัสพนักงานของ TM ของ SVM ที่ดูแลลูกค้า",
	svm_tm_name__c                                            	string        comment "Def(En): SVM TM's Name
Def(Th): ชื่อพนักงานของ TM ของ SVM ที่ดูแลลูกค้า",
	tax_deduction__c                                          	string        comment "Def(En): Customer tax deduction
Def(Th): รูปแบบการลดหย่อนภาษีของลูกค้า",
	team_head_pb__c                                           	string        comment "Def(En): Team head of customer owner dual port
Def(Th): ทีมของหัวหน้า RM ที่เป็นเจ้าของ dual port บนลูกค้า",
	team_name__c                                              	string        comment "Def(En): Customer owner team name
Def(Th): ชื่อทีมเจ้าของลูกค้า",
	team_structure_list_port__c                               	string        comment "Def(En): List of port team structure external IDs
Def(Th): รหัส external ID ของ team structure ของ port",
	telemarketing__c                                          	string        comment "Def(En): Able to contact customer to sell via phone
Def(Th): สามารถติดต่อลูกค้าผ่านโทรศัพท์เพื่อทำการขายได้",
	temporary_ownership_flag__c                               	string        comment "Def(En): This flag will be true when TM take temporary ownership from other TM pool by create call plan/call report or create opportunity. For other scenario that make customer value changed, this flag will turn to false
Def(Th): สำหรับขอเป็น Owner ของลูกค้าจากก TM Pool โดยการสร้าง Call Plan / Call Report / Job",
	title__c                                                  	string        comment "Def(En): Salutation
Def(Th): คำนำหน้าชื่อ",
	title_number__c                                           	string        comment "Def(En): For replacing salutation wiht number
Def(Th): หมายเลขคำนำหน้าชื่อ",
	tm_emp_id__c                                              	string        comment "Def(En): TM Owner's Employee ID
Def(Th): รหัสพนักงานของ TM ของเจ้าของลูกค้า",
	tm_name__c                                                	string        comment "Def(En): TM Owner's Name
Def(Th): ชื่อของ TM ของเจ้าของลูกค้า",
	total_asset_exclude_land__c                               	decimal(16,2) comment "Def(En): Total assets excluding land
Def(Th): สินทรัพย์ทั้งหมดไม่รวมที่ดิน",
	total_benefit_contact__c                                  	decimal(18,0) comment "Def(En): Number of Total Benefir
Def(Th): จำนวนผลประโยชน์ทั้งหมด",
	total_contact_of_customers__c                             	decimal(18,0) comment "Def(En): Number of total contact
Def(Th): จำนวนผู้ติดต่อทั้งหมดบนลูกค้า",
	total_credit_limit__c                                     	decimal(18,0) comment "Def(En): Customer Credit Limit
Def(Th): วงเงินทั้งหมดบนลูกค้า",
	total_exposure__c                                         	string        comment "Def(En): Sum of Commercial exposure and Consumer exposure
Def(Th): ผลรวมของยอดเงินคงค้างและวงเงินที่อนุมัติโดยดูจาก Commercial & Consumer",
	total_limit__c                                            	string        comment "Def(En): Sum of Commercial limit and Consumer limit
Def(Th): วงเงินรวมที่อนุมัติโดยดูจาก Commercial & Consumer",
	total_out__c                                              	string        comment "Def(En): Sum of Commercial out and Consumer out
Def(Th): ยอดเงินคงค้างทั้งหมดโดยดูจาก Commercial & Consumer",
	total_outstanding__c                                      	decimal(16,2) comment "Def(En): Sum of all Total Outstanding of CIS record
Def(Th): ผลรวมเงินคงค้างของลูกค้าโดยเช็คจาก CIS",
	total_sme_exposure__c                                     	decimal(18,0) comment "Def(En): Sum of out standing amount and limit amount for SME
Def(Th): ผลรวมของวงเงินที่อนุมัติกับยอดเงินคงค้างของ SME",
	total_sme_exposure_range__c                               	string        comment "Def(En): Range of outstanding and limiting amount for SME
Def(Th): ปริมาณของยอดเงินคงค้างกับวงเงินที่อนุมัติของ SME",
	total_sme_limit__c                                        	decimal(18,0) comment "Def(En): Approved credit amount for SME
Def(Th): วงเงินที่อนุมัติของ SME",
	total_sme_limit_range__c                                  	string        comment "Def(En): Range of Limiting amount for SME
Def(Th): ปริมาณวงเงินที่อนุมัติของ SME",
	total_sme_out__c                                          	decimal(18,0) comment "Def(En): Outstanding amount for SME
Def(Th): ยอดเงินคงค้างของ SME",
	total_sme_out_range__c                                    	string        comment "Def(En): Range of outstanding amount for SME
Def(Th): ปริมาณของยอดเงินคงค้างของ SME",
	totalliabilitiesandshareholders__c                        	decimal(16,2) comment "Def(En): Total liabilities and shareholder
Def(Th): รวมส่วนหนี้สินและผู้ถือหุ้น",
	totalshareholdersequity__c                                	decimal(16,2) comment "Def(En): Total shareholder equity
Def(Th): รวมต้นทุนผู้ถือหุ้น",
	touch_cbs__c                                              	string        comment "Def(En): Have visited customer this year
Def(Th): ปีนี้มีการเข้าพบลูกค้ามั้ย",
	trash_pool_flag__c                                        	string        comment "Def(En): Pool (SME-Admin)
Def(Th):  ลูกค้าอยู่ใน pool ของ SME Admin มั้ย",
	travel_life_style__pc                                     	string        comment "Def(En): Travel Life Style
Def(Th): รูปแบบการเดินทางท่องเที่ยว",
	trigger1__c                                               	string        comment "Def(En): Trigger Name 1
Def(Th): ชื่อTrigger 1",
	trigger2__c                                               	string        comment "Def(En): Trigger Name 2
Def(Th): ชื่อTrigger 2",
	trigger3__c                                               	string        comment "Def(En): Trigger Name 3
Def(Th): ชื่อTrigger 3",
	trigger4__c                                               	string        comment "Def(En): Trigger Name 4
Def(Th): ชื่อTrigger 4",
	trigger5__c                                               	string        comment "Def(En): Trigger Name 5
Def(Th): ชื่อTrigger 5",
	trigger6__c                                               	string        comment "Def(En): Trigger Name 6
Def(Th): ชื่อTrigger 6",
	trigger7__c                                               	string        comment "Def(En): Trigger Name 7
Def(Th): ชื่อTrigger 7",
	trigger8__c                                               	string        comment "Def(En): Trigger Name 8
Def(Th): ชื่อTrigger 8",
	trigger_action__c                                         	string        comment "Def(En): Trigger Action
Def(Th): ข้อแนะนำในการดำเนินการ Lead ของลูกค้า",
	trigger_group_name__c                                     	string        comment "Def(En): Trigger Group Name
Def(Th): ประเภทของกลุ่มของ Lead ของลูกค้า",
	trigger_nearest_end_date__c                               	string        comment "Def(En): Trigger Nearest End Date
Def(Th): วันหยุดอายุของ Lead ที่ใกล้ที่สุดของลูกค้า",
	trigger_summary__c                                        	string        comment "Def(En): Trigger Summary
Def(Th): สรุปรายละเอียด Lead ของลูกค้า",
	type_of_customer__c                                       	string        comment "Def(En): Type of customer
Def(Th): ประเภทของลูกค้า",
	used_reward_amount__c                                     	decimal(16,2) comment "Def(En): Amount of reward spent
Def(Th): จำนวนเงินรางวัลที่ใช้ไป",
	uw_group__c                                               	string        comment "Def(En): Color of UW customer
Def(Th): สีของลูกค้าใน UW",
	uw_group_symbol__c                                        	string        comment "Def(En): Image classified by color of UW customer
Def(Th):  รูปภาพแบ่งตามสีของประเภทลูกค้าใน UW",
	uw_strategy_cbs__c                                        	string        comment "Def(En): UW customer type
Def(Th): ประเภทลูกค้าของ UW",
	vvip_flag__c                                              	string        comment "Def(En): Is an account freezing in web CSR ?
Def(Th): มีการอายัดบัญชีใน web CSR มั้ย",
	vvip_list__c                                              	string        comment "Def(En): Detail of account freezing in web CSR
Def(Th): รายละเอียดเรื่อง อายัดบัญชี ใน web CSR",
	wallet_size_credit_exposure_range__c                      	string        comment "Def(En): Sum of Wallet Size Limit and Outstanding
Def(Th): ผลรวมของวงเงินที่อนุมัติกับยอดเงินคงค้าง",
	wallet_size_credit_limit_range__c                         	string        comment "Def(En): Range of Limiting credit
Def(Th): ปริมาณวงเงินของสินเชื่อที่อนุมัติของ",
	wallet_size_credit_outstanding_range__c                   	string        comment "Def(En): Range of outstanding credit
Def(Th): ปริมาณของสินเชื่อคงค้าง",
	wallet_size_exposure__c                                   	decimal(18,0) comment "Def(En): Sum of Wallet Size Limit and Outstanding
Def(Th): ผลรวมของวงเงินที่อนุมัติกับยอดเงินคงค้าง",
	wallet_size_limit__c                                      	decimal(18,0) comment "Def(En): Approved credit limit
Def(Th): วงเงินที่อนุมัติ",
	wallet_size_outstanding__c                                	decimal(18,0) comment "Def(En): Outstanding amount
Def(Th): ยอดเงินคงค้าง",
	wallet_size_rbs__c                                        	decimal(18,0) comment "Def(En): Investment amount
Def(Th): ยอดเงินลงทุน",
	wallet_size_rbs_range__c                                  	string        comment "Def(En): Range of investment amount
Def(Th): ปริมาณเงินลงทุน",
	watch_list__c                                             	string        comment "Def(En): Is watch list customer ?
Def(Th): เป็นลูกค้าพึงระวังหรือไม่",
	watchlistcustomer__c                                      	string        comment "Def(En): Watch list customer
Def(Th): ลูกค้าพึงระวัง",
	whitelist2rm__c                                           	string        comment "Def(En): Whitelisted authentication method 2 RM
Def(Th): อนุโลมการพิสูจน์ตัวตนแบบ 2 RM",
	whitelisted_e_wht__c                                      	string        comment "Def(En): Whitelisted document and e-signature
Def(Th): อนุโลมเอกสารและลายเซนต์",
	why_you_need_consult2__c                                  	string        comment "Def(En): Why you need consult
Def(Th): เหตุผลที่ต้องการ Consult",
	with_without_pains__c                                     	string        comment "Def(En): Have customer pain point ?
Def(Th): มี pain point มั้ย",
	workplace__c                                              	string        comment "Def(En): Workplace
Def(Th): สถานที่ทำงาน",
	xpc__c                                                    	string        comment "Def(En): K Express Cash
Def(Th): มีผลิตภัณฑ์ XPC",
	year_of_operation__c                                      	string        comment "Def(En): Age of business 
Def(Th): อายุของกิจการ",
	createdbyid                                               	string        comment "Def(En):Salesforce ID of User who create record
Def(Th):Salesforce ID 18 หลักของ User ที่สร้าง record",
	account_extensions__r_createddate                         	timestamp     comment "Def(En): Account Extension record created date
Def(Th): วันที่และเวลาที่สร้าง Record",
	account_extensions__r_account__c                          	string        comment "Def(En):Salesforce ID of Account
Def(Th):Salesforce ID 18 หลักของ Account",
	account_extensions__r_amount__c                           	decimal(16,2) comment "Def(En): Total amount
Def(Th): จำนวนเงินรวม",
	account_extensions__r_app__c                              	string        comment "Def(En): Investing Appliacation
Def(Th): App ที่ใช้ในการลงทุน",
	account_extensions__r_as_of_date_aum__c                   	date          comment "Def(En): Asset under manadement value as of date
Def(Th): มูลค่ารวมของ สินทรัพย์/หลักทรัพย์ในพอร์ตการลงทุน ณ วันที่",
	account_extensions__r_as_of_date_cheque__c                	date          comment "Def(En): Cheque date
Def(Th): ตรวจสอบ ณ วันที่",
	account_extensions__r_aum_avg_bal_month_1__c              	string        comment "Def(En): Asset under management average balance on Jan.
Def(Th): ยอดคงเหลือเฉลี่ยของมูลค่ารวมของ สินทรัพย์/หลักทรัพย์ในพอร์ตการลงทุน เดือนมกราคม",
	account_extensions__r_aum_avg_bal_month_10__c             	string        comment "Def(En): Asset under management average balance on Oct.
Def(Th): ยอดคงเหลือเฉลี่ยของมูลค่ารวมของ สินทรัพย์/หลักทรัพย์ในพอร์ตการลงทุน เดือนตุลาคม",
	account_extensions__r_aum_avg_bal_month_11__c             	string        comment "Def(En): Asset under management average balance on Nov.
Def(Th): ยอดคงเหลือเฉลี่ยของมูลค่ารวมของ สินทรัพย์/หลักทรัพย์ในพอร์ตการลงทุน เดือนพฤศจิกายน",
	account_extensions__r_aum_avg_bal_month_12__c             	string        comment "Def(En): Asset under management average balance on Dec.
Def(Th): ยอดคงเหลือเฉลี่ยของมูลค่ารวมของ สินทรัพย์/หลักทรัพย์ในพอร์ตการลงทุน เดือนธันวาคม",
	account_extensions__r_aum_avg_bal_month_2__c              	string        comment "Def(En): Asset under management average balance on Feb.
Def(Th): ยอดคงเหลือเฉลี่ยของมูลค่ารวมของ สินทรัพย์/หลักทรัพย์ในพอร์ตการลงทุน เดือนกุมภาพันธ์",
	account_extensions__r_aum_avg_bal_month_3__c              	string        comment "Def(En): Asset under management average balance on Mar.
Def(Th): ยอดคงเหลือเฉลี่ยของมูลค่ารวมของ สินทรัพย์/หลักทรัพย์ในพอร์ตการลงทุน เดือนมีนาคม",
	account_extensions__r_aum_avg_bal_month_4__c              	string        comment "Def(En): Asset under management average balance on Apr.
Def(Th): ยอดคงเหลือเฉลี่ยของมูลค่ารวมของ สินทรัพย์/หลักทรัพย์ในพอร์ตการลงทุน เดือนเมษายน",
	account_extensions__r_aum_avg_bal_month_5__c              	string        comment "Def(En): Asset under management average balance on May.
Def(Th): ยอดคงเหลือเฉลี่ยของมูลค่ารวมของ สินทรัพย์/หลักทรัพย์ในพอร์ตการลงทุน เดือนพฤษภาคม",
	account_extensions__r_aum_avg_bal_month_6__c              	string        comment "Def(En): Asset under management average balance on Jun.
Def(Th): ยอดคงเหลือเฉลี่ยของมูลค่ารวมของ สินทรัพย์/หลักทรัพย์ในพอร์ตการลงทุน เดือนมิถุนายน",
	account_extensions__r_aum_avg_bal_month_7__c              	string        comment "Def(En): Asset under management average balance on Jul.
Def(Th): ยอดคงเหลือเฉลี่ยของมูลค่ารวมของ สินทรัพย์/หลักทรัพย์ในพอร์ตการลงทุน เดือนกรกฏาคม",
	account_extensions__r_aum_avg_bal_month_8__c              	string        comment "Def(En): Asset under management average balance on Aug.
Def(Th): ยอดคงเหลือเฉลี่ยของมูลค่ารวมของ สินทรัพย์/หลักทรัพย์ในพอร์ตการลงทุน เดือนสิงหาคม",
	account_extensions__r_aum_avg_bal_month_9__c              	string        comment "Def(En): Asset under management average balance on Sep.
Def(Th): ยอดคงเหลือเฉลี่ยของมูลค่ารวมของ สินทรัพย์/หลักทรัพย์ในพอร์ตการลงทุน เดือนกันยายน",
	account_extensions__r_avg_pyrl_amt__c                     	string        comment "Def(En): Average payroll amount
Def(Th): จำนวนเงินเดือนโดยเฉลี่ย",
	account_extensions__r_c_watchlist__c                      	string        comment "Def(En): Customer information should be treated with caution.
Def(Th): ข้อมูลลูกค้าพึงระวัง (กรณีมีมากกว่า 1 คั่นด้วย ;)",
	account_extensions__r_c_watchlist_wealth__c               	string        comment "Def(En):  Wealth Customer Watchlist
Def(Th): ข้อมูลลูกค้าพึ่งระวังของลูกค้า Wealtj",
	account_extensions__r_c_watchlisttext__c                  	string        comment "Def(En): 
Def(Th): ข้อมูลแต่ละตัวอักษรหมายถึงมีความหมายที่แตกต่างกัน
 ดูได้จาก Flow Oneteam Watchlist โดยเป็นดังนี้
 A=ลูกค้าปิดกิจการถาวร
 B=ลูกค้าไม่มีศักยภาพในการชำระหนี้
 C=ลูกค้ามีพฤติกรรมขอเปลี่ยน RM บ่อย
 D=สามี/ภรรยา/เครือญาติที่ทำธุรกิจเดียวกันได้รับวงเงินนี้แล้วนำธุรกิจนี้มาขอกู้อีก
 E=ลูกค้าเดินบัญชีผิดปกติ/ ปั่น statement
 F=ลูกค้าไม่ได้ทำธุรกิจ
 G=ลูกค้ามีกลุ่มนายหน้าจัดหาพามา
 H=ลูกค้าเจตนาปลอมเอกสาร",
	account_extensions__r_c_watchlistupdateby__c              	string        comment "Def(En): The latest person's Id who revise the client's watchlist.
Def(Th): รหัส Id ชองคนแก้ไขลูกค้าพึงระวังล่าสุด",
	account_extensions__r_c_watchlistupdatedate__c            	timestamp     comment "Def(En): Date and time of each client's watchlist revision.
Def(Th): วันที่แก้ไขลูกค้าพึงระวังล่าสุด",
	account_extensions__r_commitcollectiontype__c             	string        comment "Def(En): DPD Collection Type
Def(Th): ประเภทการติดตามหนี้",
	account_extensions__r_committopaydate__c                  	date          comment "Def(En): The client's payment date.
Def(Th): วันนัดชำระของลูกค้า",
	account_extensions__r_companyrelation__c                  	string        comment "Def(En): Relationship with company
Def(Th): มีความสัมพันธ์กับบริษัท",
	account_extensions__r_contact_frequency__c                	string        comment "Def(En): Customer contact frequency
Def(Th): ความถี่ที่ลูกค้าต้องการให้ติดต่อ",
	account_extensions__r_credit__c                           	string        comment "Def(En): Size of business
Def(Th): โอกาสในการขาย Credit – ขนาดธุรกิจ",
	account_extensions__r_cu_status__c                        	string        comment "Def(En): Customer watchlist status
Def(Th): สถานะของลูกค้าพึงระวัง",
	account_extensions__r_emailpdf__c                         	string        comment "Def(En): Customer Email
Def(Th): Email ของลูกค้า",
	account_extensions__r_est_incm_result__c                  	string        comment "Def(En): Estimated Income Result
Def(Th): ผลการประเมิณรายได้",
	account_extensions__r_external_id__c                      	string        comment "Def(En):  Account Extension External ID
Def(Th):  เลข External ID ของ Account Extension",
	account_extensions__r_family__c                           	string        comment "Def(En): Family Status
Def(Th): สถานะการมีครอบครัว",
	account_extensions__r_field_1__c                          	string        comment "Def(En): Additional Information for debt collection
Def(Th): ข้อมูลเพิ่มเติมเกี่ยวกับลีด DPD",
	account_extensions__r_field_10__c                         	string        comment "Def(En): Additional Information 10
Def(Th): ข้อมูลเพิ่มเติม 10",
	account_extensions__r_field_11__c                         	string        comment "Def(En): Additional Information 11
Def(Th): ข้อมูลเพิ่มเติม 11",
	account_extensions__r_field_12__c                         	string        comment "Def(En): Additional Information 12
Def(Th): ข้อมูลเพิ่มเติม 12",
	account_extensions__r_field_13__c                         	string        comment "Def(En): Additional Information 13
Def(Th): ข้อมูลเพิ่มเติม 13",
	account_extensions__r_field_14__c                         	string        comment "Def(En): Additional Information 14
Def(Th): ข้อมูลเพิ่มเติม 14",
	account_extensions__r_field_15__c                         	string        comment "Def(En): Additional Information 15
Def(Th): ข้อมูลเพิ่มเติม 15",
	account_extensions__r_field_16__c                         	string        comment "Def(En): Additional Information 16
Def(Th): ข้อมูลเพิ่มเติม 16",
	account_extensions__r_field_17__c                         	string        comment "Def(En): Additional Information 17
Def(Th): ข้อมูลเพิ่มเติม 17",
	account_extensions__r_field_18__c                         	string        comment "Def(En): Additional Information 18
Def(Th): ข้อมูลเพิ่มเติม 18",
	account_extensions__r_field_19__c                         	string        comment "Def(En): Additional Information 19
Def(Th): ข้อมูลเพิ่มเติม 19",
	account_extensions__r_field_2__c                          	string        comment "Def(En): Additional Information for debt collection
Def(Th): ข้อมูลเพิ่มเติมเกี่ยวกับลีด DPD",
	account_extensions__r_field_20__c                         	string        comment "Def(En): Additional Information 20
Def(Th): ข้อมูลเพิ่มเติม 20",
	account_extensions__r_field_3__c                          	string        comment "Def(En): Additional Information for debt collection
Def(Th): ข้อมูลเพิ่มเติมเกี่ยวกับลีด DPD",
	account_extensions__r_field_4__c                          	string        comment "Def(En): Additional Information for debt collection
Def(Th): ข้อมูลเพิ่มเติมเกี่ยวกับลีด DPD",
	account_extensions__r_field_5__c                          	string        comment "Def(En): Additional Information for debt collection
Def(Th): ข้อมูลเพิ่มเติมเกี่ยวกับลีด DPD",
	account_extensions__r_field_6__c                          	string        comment "Def(En): Additional Information 6
Def(Th): ข้อมูลเพิ่มเติม 6",
	account_extensions__r_field_7__c                          	string        comment "Def(En): Additional Information 7
Def(Th): ข้อมูลเพิ่มเติม 7",
	account_extensions__r_field_8__c                          	string        comment "Def(En): Additional Information 8
Def(Th): ข้อมูลเพิ่มเติม 8",
	account_extensions__r_field_9__c                          	string        comment "Def(En): Additional Information 9
Def(Th): ข้อมูลเพิ่มเติม 9",
	account_extensions__r_fund_update__c                      	string        comment "Def(En): Update fund situation
Def(Th): อัพเดทสถานการณ์กองทุน",
	account_extensions__r_high_value__c                       	string        comment "Def(En): Group of SIERRA
Def(Th): ลูกค้าสร้างรายได้ให้ธนาคาร (High Value)",
	account_extensions__r_industry__c                         	string        comment "Def(En): Industry Group
Def(Th): กลุ่มอุตสาหกรรม",
	account_extensions__r_intensity__c                        	string        comment "Def(En): DPD Intensity
Def(Th): ความเข้มข้น",
	account_extensions__r_iscalculatemaxdpd__c                	string        comment "Def(En): This field indicate that the customer doesn't make the payment on time
Def(Th): Flag ที่กำหนดว่าลูกค้ามีวันค้างหรือไม่",
	account_extensions__r_lead_status__c                      	string        comment "Def(En): Lead Status
Def(Th): สถานะของลูกค้า",
	account_extensions__r_lifestyle__c                        	string        comment "Def(En): Customer lifestyle
Def(Th): รูปแบบการใช้ชีวิต",
	account_extensions__r_marital_status__c                   	string        comment "Def(En): Marital status
Def(Th): สถานภาพ/ครอบครัว",
	account_extensions__r_marital_status_information__c       	string        comment "Def(En): Marital status information
Def(Th): รายละเอียดเพิ่มเติมของสถานภาพ/ครอบครัว",
	account_extensions__r_measure__c                          	string        comment "Def(En): Customer Measures
Def(Th): มาตรการของลูกค้า",
	account_extensions__r_memo1__c                            	string        comment "Def(En): Memo 1
Def(Th): Memo 1",
	account_extensions__r_memo2__c                            	string        comment "Def(En): Memo 2
Def(Th): Memo 2",
	account_extensions__r_mf_balance_y20_21__c                	string        comment "Def(En): Port has Balance Fund
Def(Th): มี Balance Fund อยู่ใน Port",
	account_extensions__r_mf_balance_y20_21_no__c             	string        comment "Def(En): Number of Balance Fund investment transactions in port
Def(Th): จำนวนครั้งที่ลงทุนของ Balance fund ใน port",
	account_extensions__r_mf_equity_fif_y20_21__c             	string        comment "Def(En): Port has FIF/Equity Fund
Def(Th): มี FIF/Equity Fund อยู่ใน Port",
	account_extensions__r_mf_equity_fif_y20_21_no__c          	string        comment "Def(En): Number of FIF/Equity fund investment transactions in port
Def(Th): จำนวนครั้งที่ลงทุน FIF/Equity fund  ใน port",
	account_extensions__r_mf_liquidity_y20_21__c              	string        comment "Def(En): Port has Liquidity Fund
Def(Th): มี Liquidity Fund อยู่ใน Port",
	account_extensions__r_mf_liquidity_y20_21_no__c           	string        comment "Def(En): Number of Liquidity Fund investment transactions in port
Def(Th): จำนวนครั้งที่ลงทุน Liquidity fund ใน port",
	account_extensions__r_mf_tax_y20_21__c                    	string        comment "Def(En): Port has TaxSaving Fund
Def(Th): มี TaxSaving Fund อยู่ใน Port",
	account_extensions__r_mf_tax_y20_21_no__c                 	string        comment "Def(En): Number of TaxSaving Fund investment transactions in port
Def(Th): จำนวนครั้งที่ลงทุน Tax saving fund ใน port",
	account_extensions__r_mf_termfund_y20_21__c               	string        comment "Def(En): Port has Term Fund
Def(Th): มี Term Fund อยู่ใน Port",
	account_extensions__r_mf_termfund_y20_21_no__c            	string        comment "Def(En): Number of Term Fund investment transactions in port
Def(Th): จำนวนครั้งที่ลงทุน Term fund ใน port",
	account_extensions__r_mf_txn_y20_21_no__c                 	string        comment "Def(En): Number of investment transactions
Def(Th): จำนวนครั้งที่ลงทุน",
	account_extensions__r_mf_valid_y20_21__c                  	string        comment "Def(En): Has fund account
Def(Th): มีบัญชีกองทุน",
	account_extensions__r_min_start_date_lead_from_website__c 	timestamp     comment "Def(En): Min Start Date Lead From Website
Def(Th): วันที่และเวลาที่รับลูกค้าจากเว็บไซต์",
	account_extensions__r_no_of_payroll__c                    	string        comment "Def(En): Number of payroll
Def(Th): จำนวน Payroll",
	account_extensions__r_notcontactedleadsubtype__c          	string        comment "Def(En): Type of customer prohibited from contact
Def(Th): ประเภทของลูกค้าที่ห้ามติดต่อ",
	account_extensions__r_notification_statement__c           	string        comment "Def(En): Notification of profit & loss of fund
Def(Th): แจ้งเตือนลูกค้ากำไร-ขาดทุนกองทุน",
	account_extensions__r_occupation__c                       	string        comment "Def(En): Occupation / Business type
Def(Th): อาชีพ/ลักษณะธุรกิจ",
	account_extensions__r_occupation1__c                      	string        comment "Def(En): Occupation
Def(Th): อาชีพ",
	account_extensions__r_onlinebusiness__c                   	string        comment "Def(En): Type of online business
Def(Th): ประเภทการทำธุรกิจออนไลน์",
	account_extensions__r_personalised_message__c             	string        comment "Def(En): Personalized message
Def(Th): ข้อความเพิ่มเติมสำหรับลูกค้า",
	account_extensions__r_pos_dt__c                           	timestamp     comment "Def(En): Account Extension Pos Date
Def(Th): วัน Pos Date ของ Account Extension",
	account_extensions__r_priority__c                         	decimal(16,2) comment "Def(En):  Account Extension Priority
Def(Th):  Priority ของ Account Extension",
	account_extensions__r_remark__c                           	string        comment "Def(En): Remark
Def(Th): หมายเหตุ",
	account_extensions__r_riskable__c                         	string        comment "Def(En): Ability to hndle risks
Def(Th): ความสามารถในการถือครองความเสี่ยง",
	account_extensions__r_rm_aum__c                           	string        comment "Def(En): Does RM want to know customer's AUM?
Def(Th): RM ต้องการทราบความเคลื่อนไหวด้านการเงิน (AUM) ของลูกค้าหรือไม่",
	account_extensions__r_rmf_purchase_amt__c                 	decimal(16,2) comment "Def(En): Total purchases RMF this year
Def(Th): ยอดซื้อ RMF ปีนี้",
	account_extensions__r_salary_model_result__c              	string        comment "Def(En): Salary base
Def(Th): ฐานเงินเดือน",
	account_extensions__r_sender_information__c               	string        comment "Def(En): Who receives  & transfer information to customer
Def(Th): ใครเป็นคนรับข้อมูลที่จะส่งต่อลูกค้า",
	account_extensions__r_sp_all_product_code__c              	string        comment "Def(En): All Product Code
Def(Th): โค้ดของผลิตภัณฑ์",
	account_extensions__r_sp_benefits__c                      	string        comment "Def(En): Customer benefit
Def(Th): สิทธิประโยชน์ที่ลูกค้าได้รับ",
	account_extensions__r_sp_canuseestincome__c               	string        comment "Def(En): Prior for approval date
Def(Th): คำนวณ Fied สามารถใช้ในการสมัครและพิจารณาก่อนวันที่ บวกไป 2 เดือน",
	account_extensions__r_sp_canuseestincomedisplay__c        	string        comment "Def(En): Prior for approval date
Def(Th): คำนวณ Fied สามารถใช้ในการสมัครและพิจารณาก่อนวันที่ บวกไป 2 เดือน",
	account_extensions__r_sp_canusestableincome__c            	string        comment "Def(En): Prior for approval date
Def(Th): คำนวณ Fied สามารถใช้ในการสมัครและพิจารณาก่อนวันที่ บวกไป 2 เดือน",
	account_extensions__r_sp_canusestableincomedisplay__c     	string        comment "Def(En): Prior for approval date
Def(Th): คำนวณ Fied สามารถใช้ในการสมัครและพิจารณาก่อนวันที่ บวกไป 2 เดือน",
	account_extensions__r_sp_cis__c                           	string        comment "Def(En): Customer CIS 
Def(Th): CIS ของลูกค้า",
	account_extensions__r_sp_e_cc__c                          	string        comment "Def(En): Condition for submitting income document for entrepreneur (CC)
Def(Th): เงื่อนไขการส่งเอกสารแสดงรายได้ของการสมัครผลิตภัณฑ์ CC ผ่านการประเมิณรายได้ของผู้ประกอบการ",
	account_extensions__r_sp_e_hl__c                          	string        comment "Def(En): Condition for submitting income document for entrepreneur (HL)
Def(Th): เงื่อนไขการส่งเอกสารแสดงรายได้ของการสมัครผลิตภัณฑ์ HL ผ่านการประเมิณรายได้ของผู้ประกอบการ",
	account_extensions__r_sp_e_k_car_new_car__c               	string        comment "Def(En): Condition for submitting income document for entrepreneur (K-Car/ New Car)
Def(Th): เงื่อนไขการส่งเอกสารแสดงรายได้ของการสมัครผลิตภัณฑ์ K-Car/ New Car ผ่านการประเมิณรายได้ของผู้ประกอบการ",
	account_extensions__r_sp_e_sme__c                         	string        comment "Def(En): Condition for submitting income document for entrepreneur (SME)
Def(Th): เงื่อนไขการส่งเอกสารแสดงรายได้ของการสมัครผลิตภัณฑ์ SME ผ่านการประเมิณรายได้ของผู้ประกอบการ",
	account_extensions__r_sp_e_xpc__c                         	string        comment "Def(En): Condition for submitting income document for entrepreneur (XpressCash)
Def(Th): เงื่อนไขการส่งเอกสารแสดงรายได้ของการสมัครผลิตภัณฑ์ XpressCash ผ่านการประเมิณรายได้ของผู้ประกอบการ",
	account_extensions__r_sp_e_xpl__c                         	string        comment "Def(En): Condition for submitting income document for entrepreneur (XpressLoan)
Def(Th): เงื่อนไขการส่งเอกสารแสดงรายได้ของการสมัครผลิตภัณฑ์ XpressLoan  ผ่านการประเมิณรายได้ของผู้ประกอบการ",
	account_extensions__r_sp_estimate_income_link__c          	string        comment "Def(En): 
Def(Th): ลิงค์สำหรับกรอกประเมิณรายได้ของผู้ประกอบการ",
	account_extensions__r_sp_estimated_income_entrepreneur1__c	string        comment "Def(En): Entrepreneur's income assessment link
Def(Th): ประเมิณรายได้ของผู้ประกอบการ",
	account_extensions__r_sp_estimated_income_remark__c       	string        comment "Def(En): Entrepreneur's income assessment remark
Def(Th): หมายเหตุการประเมิณรายได้ของผู้ประกอบการ",
	account_extensions__r_sp_estimated_income_remark_1__c     	string        comment "Def(En): Entrepreneur's income assessment remark
Def(Th): หมายเหตุการประเมิณรายได้ของผู้ประกอบการ",
	account_extensions__r_sp_estimated_income_salary2__c      	string        comment "Def(En): Estimated individual monthly income
Def(Th): ประมาณการรายได้ต่อเดือน",
	account_extensions__r_sp_remark_adhoc__c                  	string        comment "Def(En): Remark
Def(Th): หมายเหตุ",
	account_extensions__r_sp_s_cc__c                          	string        comment "Def(En): Applying loan details with product code (CC)
Def(Th): รายละเอียดการขอสินเชื่อผลิตภัณฑ์ CC ควบคู่กับการดู All Product Code",
	account_extensions__r_sp_s_hl__c                          	string        comment "Def(En): Applying loan details with product code (HL)
Def(Th): รายละเอียดการขอสินเชื่อผลิตภัณฑ์ HL ควบคู่กับการดู All Product Code",
	account_extensions__r_sp_s_k_car_new_car__c               	string        comment "Def(En): Applying loan details with product code (K-Car/ New Car)
Def(Th): รายละเอียดการขอสินเชื่อผลิตภัณฑ์ K-Car/ New Car ควบคู่กับการดู All Product Code",
	account_extensions__r_sp_s_xpc__c                         	string        comment "Def(En): Applying loan details with product code (XpressCash)
Def(Th): รายละเอียดการขอสินเชื่อผลิตภัณฑ์ XpressCash ควบคู่กับการดู All Product Code",
	account_extensions__r_sp_s_xpl__c                         	string        comment "Def(En): Applying loan details with product code (XpressLoan)
Def(Th): รายละเอียดการขอสินเชื่อผลิตภัณฑ์ XpressLoan ควบคู่กับการดู All Product Code",
	account_extensions__r_ssf_purchase_amt__c                 	decimal(16,2) comment "Def(En): Total purchases SSF this year
Def(Th): ยอดซื้อ SSF ปีนี้",
	account_extensions__r_ssf_rmf_as_of_date__c               	date          comment "Def(En): SSF Purchase date
Def(Th): วันที่ซื้อ SSF",
	account_extensions__r_taxdeduction__c                     	string        comment "Def(En): Customer tax deduction
Def(Th): รูปแบบการลดหย่อนภาษีของลูกค้า",
	account_extensions__r_total_ssf_rmf_purchase_amt__c       	decimal(16,2) comment "Def(En): Total SSF & RMF this year
Def(Th): ยอดซื้อรวม SSF และ RMF ปีนี้",
	account_extensions__r_trade__c                            	string        comment "Def(En): Tradind frquency
Def(Th): ความถี่ในการเทรด",
	account_extensions__r_type__c                             	string        comment "Def(En): Fee collection format
Def(Th): รูปแบบการเก็บค่าธรรมเนียม",
	account_extensions__r_typeofoccupation__c                 	string        comment "Def(En): Type of Occupation
Def(Th): ลักษณะอาชีพ",
	account_extensions__r_wallet_size_potential_group1__c     	string        comment "Def(En): Wallet size & Potential Group
Def(Th): ศักยภาพในการลงทุน",
	account_extensions__r_wallet_size_potential_group2__c     	string        comment "Def(En): Wallet size & Potential Group
Def(Th): ศักยภาพในการลงทุน",
	load_tms                                                  	timestamp     comment "Def(En): The timestamp on which the instance of the entity was last updated.
Def(Th): วันที่ที่ระบบได้รับข้อมูลล่าสุด",
	src_sys_id                                                	string        comment "Def(En): Source system ID
Def(Th):เลขที่แสดงระบบงาน",
	ptn_yyyy                                                  	string        comment "Def(En): Partition Year (YYYY)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับปี",
	ptn_mm                                                    	string        comment "Def(En): Partition Month (MM)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับเดือน",
	ptn_dd                                                    	string        comment "Def(En): Partition Date (DD)
Def(Th): พาทิชั่นฟิลด์แบ่งข้อมูลระดับวัน",
	upd_tms                                                   	timestamp     comment "Def(En): Partition field - Record update timestamp
Def(Th):"
) using delta partitioned by (ptn_yyyy, ptn_mm, ptn_dd) location 'abfss://${storage_persist}/${catalog}/persist_rmst/rmst_customer' tblproperties (
	'delta.minreaderversion' = '2',
	'delta.minwriterversion' = '5',
	'delta.columnmapping.mode' = 'name'
);