// Code generated from envoy/extensions/filters/network/thrift_proxy/filters/header_to_metadata/v3/header_to_metadata.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#HeaderToMetadata: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.filters.header_to_metadata.v3.HeaderToMetadata"
	request_rules!: [...#HeaderToMetadata_Rule] & list.MinItems(1)
}

#HeaderToMetadata_KeyValuePair: {
	"@type":             "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.filters.header_to_metadata.v3.HeaderToMetadata.KeyValuePair"
	metadata_namespace?: string
	key!:                string & strings.MinRunes(1)
	type?:               #HeaderToMetadata_ValueType
	encode?:             #HeaderToMetadata_ValueEncode

	// oneof value_type: at most one may be set
	*{} |
	{value!: string} |
	{regex_value_rewrite!: v3_1.#RegexMatchAndSubstitute}
}

#HeaderToMetadata_Rule: {
	"@type":     "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.filters.header_to_metadata.v3.HeaderToMetadata.Rule"
	header!:     string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	on_present?: #HeaderToMetadata_KeyValuePair
	on_missing?: #HeaderToMetadata_KeyValuePair
	remove?:     bool
}

#HeaderToMetadata_ValueType: "STRING" | "NUMBER" | "PROTOBUF_VALUE"

#HeaderToMetadata_ValueEncode: "NONE" | "BASE64"
