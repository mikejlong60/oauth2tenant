// Code generated from envoy/extensions/filters/http/json_to_metadata/v3/json_to_metadata.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#JsonToMetadata: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.http.json_to_metadata.v3.JsonToMetadata"
	request_rules?:  #JsonToMetadata_MatchRules
	response_rules?: #JsonToMetadata_MatchRules
}

#JsonToMetadata_KeyValuePair: {
	"@type":                           "type.googleapis.com/envoy.extensions.filters.http.json_to_metadata.v3.JsonToMetadata.KeyValuePair"
	metadata_namespace?:               string
	key!:                              string & strings.MinRunes(1)
	type?:                             #JsonToMetadata_ValueType
	preserve_existing_metadata_value?: bool

	// oneof value_type: at most one may be set
	*{} |
	{value!: _}
}

#JsonToMetadata_Selector: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.json_to_metadata.v3.JsonToMetadata.Selector"

	// oneof selector: at most one may be set
	*{} |
	{key!: string & strings.MinRunes(1)}
}

#JsonToMetadata_Rule: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.json_to_metadata.v3.JsonToMetadata.Rule"
	selectors!: [...#JsonToMetadata_Selector] & list.MinItems(1)
	on_present?: #JsonToMetadata_KeyValuePair
	on_missing?: #JsonToMetadata_KeyValuePair
	on_error?:   #JsonToMetadata_KeyValuePair
}

#JsonToMetadata_MatchRules: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.json_to_metadata.v3.JsonToMetadata.MatchRules"
	rules!: [...#JsonToMetadata_Rule] & list.MinItems(1)
	allow_content_types?: [...string]
	allow_empty_content_type?:  bool
	allow_content_types_regex?: v3_1.#RegexMatcher
}

#JsonToMetadata_ValueType: "PROTOBUF_VALUE" | "STRING" | "NUMBER"
