// Code generated from envoy/extensions/filters/http/header_to_metadata/v3/header_to_metadata.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#Config: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.header_to_metadata.v3.Config"
	request_rules?: [...#Config_Rule]
	response_rules?: [...#Config_Rule]
	stat_prefix?: string
}

#Config_KeyValuePair: {
	"@type":              "type.googleapis.com/envoy.extensions.filters.http.header_to_metadata.v3.Config.KeyValuePair"
	metadata_namespace?:  string
	key!:                 string & strings.MinRunes(1)
	value?:               string
	regex_value_rewrite?: v3_1.#RegexMatchAndSubstitute
	type?:                #Config_ValueType
	encode?:              #Config_ValueEncode
}

#Config_Rule: {
	"@type":            "type.googleapis.com/envoy.extensions.filters.http.header_to_metadata.v3.Config.Rule"
	header?:            string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	cookie?:            string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	on_header_present?: #Config_KeyValuePair
	on_header_missing?: #Config_KeyValuePair
	remove?:            bool
}

#Config_ValueType: "STRING" | "NUMBER" | "PROTOBUF_VALUE"

#Config_ValueEncode: "NONE" | "BASE64"
