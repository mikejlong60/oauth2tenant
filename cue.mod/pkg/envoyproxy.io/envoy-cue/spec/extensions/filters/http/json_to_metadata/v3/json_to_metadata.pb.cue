// Code generated from envoy/extensions/filters/http/json_to_metadata/v3/json_to_metadata.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#JsonToMetadata: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.json_to_metadata.v3.JsonToMetadata"

	// At least one of request_rules and response_rules must be provided.
	// Rules to match json body of requests.
	request_rules?: #JsonToMetadata_MatchRules

	// Rules to match json body of responses.
	response_rules?: #JsonToMetadata_MatchRules
}

// [#next-free-field: 6]
#JsonToMetadata_KeyValuePair: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.json_to_metadata.v3.JsonToMetadata.KeyValuePair"

	// The namespace — if this is empty, the filter's namespace will be used.
	metadata_namespace?: string

	// The key to use within the namespace.
	key!: string & strings.MinRunes(1)

	// The value's type — defaults to protobuf.Value.
	type?: #JsonToMetadata_ValueType

	// False if we want to overwrite the existing metadata value. Default to false.
	preserve_existing_metadata_value?: bool

	// oneof value_type: at most one may be set
	*{} |
	{

		// The value to pair with the given key.
		//
		// When used for on_present case, if value is non-empty it'll be used instead
		// of the the value of the JSON key. If both are empty, the the value of the
		// JSON key is used as-is.
		//
		// When used for on_missing/on_error case, a non-empty value
		// must be provided.
		//
		// It ignores ValueType, i.e., not type casting.
		value!: _
	}
}

#JsonToMetadata_Selector: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.json_to_metadata.v3.JsonToMetadata.Selector"

	// oneof selector: at most one may be set
	*{} |
	{

		// key to match
		key!: string & strings.MinRunes(1)
	}
}

// A Rule defines what metadata to apply when a key-value is present, missing in the json
// or fail to parse the payload.
#JsonToMetadata_Rule: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.json_to_metadata.v3.JsonToMetadata.Rule"

	// Specifies that a match will be performed on the value of a property.
	// Here's an example to match on 1 in {"foo": {"bar": 1}, "bar": 2}
	//
	// selectors:
	// - key: foo
	// - key: bar
	selectors!: [...#JsonToMetadata_Selector] & list.MinItems(1)

	// If the attribute is present, apply this metadata KeyValuePair.
	on_present?: #JsonToMetadata_KeyValuePair

	// If the attribute is missing, apply this metadata KeyValuePair.
	//
	// The value in the KeyValuePair must be set.
	on_missing?: #JsonToMetadata_KeyValuePair

	// If the body is too large or fail to parse or content-type is mismatched, apply this metadata KeyValuePair.
	//
	// The value in the KeyValuePair must be set.
	on_error?: #JsonToMetadata_KeyValuePair
}

#JsonToMetadata_MatchRules: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.json_to_metadata.v3.JsonToMetadata.MatchRules"

	// The list of rules to apply.
	rules!: [...#JsonToMetadata_Rule] & list.MinItems(1)

	// Allowed content-type for json to metadata transformation.
	// Default to ``{"application/json"}``.
	//
	// Set ``allow_empty_content_type`` if empty/missing content-type header
	// is allowed.
	allow_content_types?: [...string]

	// Allowed empty content-type for json to metadata transformation.
	// Default to false.
	allow_empty_content_type?: bool

	// Allowed content-type by regex match for json to metadata transformation.
	// This can be used in parallel with ``allow_content_types``.
	allow_content_types_regex?: v3_1.#RegexMatcher
}

#JsonToMetadata_ValueType:
	// The value is a serialized `protobuf.Value
	// <https://github.com/protocolbuffers/protobuf/blob/master/src/google/protobuf/struct.proto#L62>`_.
	"PROTOBUF_VALUE" |
	"STRING" |
	"NUMBER"
