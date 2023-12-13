%dw 2.0
fun toNum(i) = if(isEmpty(i)) null else (i as Number)
fun c(i) = if(isEmpty(i)) null else (i as Date {format: "yyyy-MM-dd"})
fun toDateTs(i) = if(isEmpty(i)) null else (i as Date)  //Use this function to change the date
fun checkEmpty(str) = if(isEmpty(str)) null else (str)
output application/json
---
payload map (v,k) -> {
    "UNIQUE_ID": checkEmpty(v.Account__c),
	"ID": checkEmpty(v.Id as String),
	"OWNER_ID": checkEmpty(v.OwnerId as String),
	"NAME": checkEmpty(v.Name as String),
	"CREATED_DATE": checkEmpty(v.CreatedDate as String),
	"CREATED_BY_ID": checkEmpty(v.CreatedById as String),
	"LAST_MODIFIED_DATE": checkEmpty(v.LastModifiedDate as String),
	"LAST_MODIFIED_BY_ID": checkEmpty(v.LastModifiedById as String),
	"LOAD_DATE": (now() as DateTime >> "GMT") as String,
	"UPSERT_ID_C":  checkEmpty(v.Upsert_Id__c as String),
	"BILLING_AMOUNT_C": toNum(v.Billing_Amount__c as String),
	"ESCALATED_PRICING_VALUE_C" :toNum(v.Escalated_Pricing_Value__c  as String),
	"OPPORTUNITY__C": checkEmpty(v.Opportunity__c as String),
	"PAYMENT_SCHEDULE_NAME_C" : checkEmpty(v.Payment_Schedule_Name__c as String),
	"PAYMENT_TYPE_C" : checkEmpty(v.Payment_Type__c as String),
	"PRICING_PERIOD_C": checkEmpty(v.Pricing_Period__c as String),
	"PRICING_TERM_C": checkEmpty(v.Pricing_Term__c as String)
}