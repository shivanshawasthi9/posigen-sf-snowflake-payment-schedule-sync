%dw 2.0
output application/json
---
{
	salesforce: {
		soql: p("salesforce.query")
	},
	snowflake: {
		sql: p("snowflake.query"),
		source: p("snowflake.source"),
		record: p("snowflake.record")
	}
}
