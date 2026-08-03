// Code generated from envoy/extensions/filters/network/thrift_proxy/filters/payload_to_metadata/v3/payload_to_metadata.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#PayloadToMetadata: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.filters.payload_to_metadata.v3.PayloadToMetadata"
	request_rules!: [...#PayloadToMetadata_Rule] & list.MinItems(1)
}

#PayloadToMetadata_KeyValuePair: {
	"@type":              "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.filters.payload_to_metadata.v3.PayloadToMetadata.KeyValuePair"
	metadata_namespace?:  string
	key!:                 string & strings.MinRunes(1)
	value?:               string
	regex_value_rewrite?: v3_1.#RegexMatchAndSubstitute
	type?:                #PayloadToMetadata_ValueType
}

#PayloadToMetadata_Rule: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.filters.payload_to_metadata.v3.PayloadToMetadata.Rule"
	method_name?:    string
	service_name?:   string
	field_selector!: #PayloadToMetadata_FieldSelector
	on_present?:     #PayloadToMetadata_KeyValuePair
	on_missing?:     #PayloadToMetadata_KeyValuePair
}

#PayloadToMetadata_FieldSelector: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.filters.payload_to_metadata.v3.PayloadToMetadata.FieldSelector"
	name!:   string & strings.MinRunes(1)
	id?:     int32 & >=-32768 & <=32767
	child?:  #PayloadToMetadata_FieldSelector
}

#PayloadToMetadata_ValueType: "STRING" | "NUMBER"
