// Code generated from envoy/config/filter/http/header_to_metadata/v2/header_to_metadata.proto. DO NOT EDIT.
package v2

#Config: {
	"@type": "type.googleapis.com/envoy.config.filter.http.header_to_metadata.v2.Config"

	// The list of rules to apply to requests.
	request_rules?: [...#Config_Rule]

	// The list of rules to apply to responses.
	response_rules?: [...#Config_Rule]
}

// [#next-free-field: 6]
#Config_KeyValuePair: {
	"@type": "type.googleapis.com/envoy.config.filter.http.header_to_metadata.v2.Config.KeyValuePair"

	// The namespace — if this is empty, the filter's namespace will be used.
	metadata_namespace?: string

	// The key to use within the namespace.
	key!: string & !=""

	// The value to pair with the given key.
	//
	// When used for a `on_header_present` case, if value is non-empty it'll be used
	// instead of the header value. If both are empty, no metadata is added.
	//
	// When used for a `on_header_missing` case, a non-empty value must be provided
	// otherwise no metadata is added.
	value?: string

	// The value's type — defaults to string.
	type?: #Config_ValueType

	// How is the value encoded, default is NONE (not encoded).
	// The value will be decoded accordingly before storing to metadata.
	encode?: #Config_ValueEncode
}

// A Rule defines what metadata to apply when a header is present or missing.
#Config_Rule: {
	"@type": "type.googleapis.com/envoy.config.filter.http.header_to_metadata.v2.Config.Rule"

	// The header that triggers this rule — required.
	header!: string & !="" // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// If the header is present, apply this metadata KeyValuePair.
	//
	// If the value in the KeyValuePair is non-empty, it'll be used instead
	// of the header value.
	on_header_present?: #Config_KeyValuePair

	// If the header is not present, apply this metadata KeyValuePair.
	//
	// The value in the KeyValuePair must be set, since it'll be used in lieu
	// of the missing header value.
	on_header_missing?: #Config_KeyValuePair

	// Whether or not to remove the header after a rule is applied.
	//
	// This prevents headers from leaking.
	remove?: bool
}

#Config_ValueType:
	"STRING" |
	"NUMBER" |

	// The value is a serialized `protobuf.Value
	// <https://github.com/protocolbuffers/protobuf/blob/master/src/google/protobuf/struct.proto#L62>`_.
	"PROTOBUF_VALUE"

// ValueEncode defines the encoding algorithm.
#Config_ValueEncode:
	// The value is not encoded.
	"NONE" |

	// The value is encoded in `Base64 <https://tools.ietf.org/html/rfc4648#section-4>`_.
	// Note: this is mostly used for STRING and PROTOBUF_VALUE to escape the
	// non-ASCII characters in the header.
	"BASE64"
