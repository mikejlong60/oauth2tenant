// Code generated from envoy/config/filter/http/header_to_metadata/v2/header_to_metadata.proto. DO NOT EDIT.
package v2

#Config: {
	"@type": "type.googleapis.com/envoy.config.filter.http.header_to_metadata.v2.Config"
	request_rules?: [...#Config_Rule]
	response_rules?: [...#Config_Rule]
}

#Config_KeyValuePair: {
	"@type":             "type.googleapis.com/envoy.config.filter.http.header_to_metadata.v2.Config.KeyValuePair"
	metadata_namespace?: string
	key!:                string & !=""
	value?:              string
	type?:               #Config_ValueType
	encode?:             #Config_ValueEncode
}

#Config_Rule: {
	"@type":            "type.googleapis.com/envoy.config.filter.http.header_to_metadata.v2.Config.Rule"
	header!:            string & !="" // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	on_header_present?: #Config_KeyValuePair
	on_header_missing?: #Config_KeyValuePair
	remove?:            bool
}

#Config_ValueType: "STRING" | "NUMBER" | "PROTOBUF_VALUE"

#Config_ValueEncode: "NONE" | "BASE64"
