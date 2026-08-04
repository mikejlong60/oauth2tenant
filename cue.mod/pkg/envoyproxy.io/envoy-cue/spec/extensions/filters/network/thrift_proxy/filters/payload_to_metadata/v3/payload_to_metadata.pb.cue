// Code generated from envoy/extensions/filters/network/thrift_proxy/filters/payload_to_metadata/v3/payload_to_metadata.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#PayloadToMetadata: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.filters.payload_to_metadata.v3.PayloadToMetadata"

	// The list of rules to apply to requests.
	request_rules!: [...#PayloadToMetadata_Rule] & list.MinItems(1)
}

// [#next-free-field: 6]
#PayloadToMetadata_KeyValuePair: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.filters.payload_to_metadata.v3.PayloadToMetadata.KeyValuePair"

	// The namespace — if this is empty, the filter's namespace will be used.
	metadata_namespace?: string

	// The key to use within the namespace.
	key!: string & strings.MinRunes(1)

	// The value's type — defaults to string.
	type?: #PayloadToMetadata_ValueType

	// oneof value_type: at most one may be set
	*{} |
	{

		// The value to pair with the given key.
		//
		// When used for on_present case, if value is non-empty it'll be used instead
		// of the field value. If both are empty, the field value is used as-is.
		//
		// When used for on_missing case, a non-empty value must be provided.
		value!: string
	} |
	{

		// If present, the header's value will be matched and substituted with this.
		// If there is no match or substitution, the field value is used as-is.
		//
		// This is only used for on_present.
		regex_value_rewrite!: v3_1.#RegexMatchAndSubstitute
	}
}

// A Rule defines what metadata to apply when a field is present or missing.
// [#next-free-field: 6]
#PayloadToMetadata_Rule: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.filters.payload_to_metadata.v3.PayloadToMetadata.Rule"

	// Specifies that a match will be performed on the value of a field.
	field_selector!: #PayloadToMetadata_FieldSelector

	// If the field is present, apply this metadata KeyValuePair.
	on_present?: #PayloadToMetadata_KeyValuePair

	// If the field is missing, apply this metadata KeyValuePair.
	//
	// The value in the KeyValuePair must be set, since it'll be used in lieu
	// of the missing field value.
	on_missing?: #PayloadToMetadata_KeyValuePair

	// oneof match_specifier: exactly one must be set
	// If specified, the route must exactly match the request method name. As a special case,
	// an empty string matches any request method name.
	{method_name!: string} |
	{

		// If specified, the route must have the service name as the request method name prefix.
		// As a special case, an empty string matches any service name. Only relevant when service
		// multiplexing.
		service_name!: string
	}
}

#PayloadToMetadata_FieldSelector: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.thrift_proxy.filters.payload_to_metadata.v3.PayloadToMetadata.FieldSelector"

	// field name to log
	name!: string & strings.MinRunes(1)

	// field id to match
	id?: int32 & >=-32768 & <=32767

	// next node of the field selector
	child?: #PayloadToMetadata_FieldSelector
}

#PayloadToMetadata_ValueType: "STRING" | "NUMBER"
