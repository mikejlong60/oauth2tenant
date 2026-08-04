// Code generated from envoy/extensions/filters/http/header_to_metadata/v3/header_to_metadata.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
)

#Config: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.header_to_metadata.v3.Config"

	// The list of rules to apply to requests.
	request_rules?: [...#Config_Rule]

	// The list of rules to apply to responses.
	response_rules?: [...#Config_Rule]

	// Optional prefix to use when emitting filter statistics. When configured,
	// statistics are emitted with the prefix ``http_filter_name.<stat_prefix>``.
	//
	// This emits statistics such as:
	//
	// - ``http_filter_name.my_header_converter.rules_processed``
	// - ``http_filter_name.my_header_converter.metadata_added``
	//
	// If not configured, no statistics are emitted.
	stat_prefix?: string
}

// [#next-free-field: 7]
#Config_KeyValuePair: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.header_to_metadata.v3.Config.KeyValuePair"

	// The namespace — if this is empty, the filter's namespace will be used.
	metadata_namespace?: string

	// The key to use within the namespace.
	key!: string & strings.MinRunes(1)

	// The value to pair with the given key.
	//
	// When used for a
	// :ref:`on_header_present <envoy_v3_api_field_extensions.filters.http.header_to_metadata.v3.Config.Rule.on_header_present>`
	// case, if value is non-empty it'll be used instead of the header value. If both are empty, no metadata is added.
	//
	// When used for a :ref:`on_header_missing <envoy_v3_api_field_extensions.filters.http.header_to_metadata.v3.Config.Rule.on_header_missing>`
	// case, a non-empty value must be provided otherwise no metadata is added.
	value?: string

	// If present, the header's value will be matched and substituted with this. If there is no match or substitution, the header value
	// is used as-is.
	//
	// This is only used for :ref:`on_header_present <envoy_v3_api_field_extensions.filters.http.header_to_metadata.v3.Config.Rule.on_header_present>`.
	//
	// .. note::
	//
	//   If the ``value`` field is non-empty this field should be empty.
	regex_value_rewrite?: v3_1.#RegexMatchAndSubstitute

	// The value's type — defaults to string.
	type?: #Config_ValueType

	// How is the value encoded, default is NONE (not encoded).
	// The value will be decoded accordingly before storing to metadata.
	encode?: #Config_ValueEncode
}

// A Rule defines what metadata to apply when a header is present or missing.
// [#next-free-field: 6]
#Config_Rule: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.header_to_metadata.v3.Config.Rule"

	// Specifies that a match will be performed on the value of a header or a cookie.
	//
	// The header to be extracted.
	header?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// The cookie to be extracted.
	cookie?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// If the header or cookie is present, apply this metadata ``KeyValuePair``.
	//
	// If the value in the ``KeyValuePair`` is non-empty, it'll be used instead
	// of the header or cookie value.
	on_header_present?: #Config_KeyValuePair

	// If the header or cookie is not present, apply this metadata ``KeyValuePair``.
	//
	// The value in the ``KeyValuePair`` must be set, since it'll be used in lieu
	// of the missing header or cookie value.
	on_header_missing?: #Config_KeyValuePair

	// Whether or not to remove the header after a rule is applied.
	//
	// This prevents headers from leaking.
	// This field is not supported in case of a cookie.
	remove?: bool
}

// Specifies the value type to use in metadata.
#Config_ValueType:
	"STRING" |
	"NUMBER" |

	// The value is a serialized `protobuf.Value
	// <https://github.com/protocolbuffers/protobuf/blob/master/src/google/protobuf/struct.proto#L62>`_.
	"PROTOBUF_VALUE"

// Specifies the encoding scheme for the value.
#Config_ValueEncode:
	// No encoding is applied.
	"NONE" |

	// The value is encoded in `Base64 <https://tools.ietf.org/html/rfc4648#section-4>`_.
	//
	// .. note::
	//
	//   This is mostly used for ``STRING`` and ``PROTOBUF_VALUE`` to escape the
	//   non-ASCII characters in the header.
	"BASE64"
