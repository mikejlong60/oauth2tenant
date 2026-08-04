// Code generated from envoy/type/tracing/v3/custom_tag.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/metadata/v3"
)

// Describes custom tags for the active span.
// [#next-free-field: 7]
#CustomTag: {
	"@type": "type.googleapis.com/envoy.type.tracing.v3.CustomTag"

	// Used to populate the tag name.
	tag!: string & strings.MinRunes(1)

	// Used to specify what kind of custom tag.
	// oneof type: exactly one must be set
	// A literal custom tag.
	{literal!: #CustomTag_Literal} |
	{

		// An environment custom tag.
		environment!: #CustomTag_Environment
	} |
	{

		// A request header custom tag.
		request_header!: #CustomTag_Header
	} |
	{

		// A custom tag to obtain tag value from the metadata.
		metadata!: #CustomTag_Metadata
	} |
	{

		// Custom tag value.
		//
		// The same :ref:`format specifier <config_access_log_format>` as used for
		// :ref:`HTTP access logging <config_access_log>` applies here, however
		// unknown specifier values are replaced with the empty string instead of ``-``.
		value!: string
	}
}

// Literal type custom tag with static value for the tag value.
#CustomTag_Literal: {
	"@type": "type.googleapis.com/envoy.type.tracing.v3.CustomTag.Literal"

	// Static literal value to populate the tag value.
	value!: string & strings.MinRunes(1)
}

// Environment type custom tag with environment name and default value.
#CustomTag_Environment: {
	"@type": "type.googleapis.com/envoy.type.tracing.v3.CustomTag.Environment"

	// Environment variable name to obtain the value to populate the tag value.
	name!: string & strings.MinRunes(1)

	// When the environment variable is not found,
	// the tag value will be populated with this default value if specified,
	// otherwise no tag will be populated.
	default_value?: string
}

// Header type custom tag with header name and default value.
#CustomTag_Header: {
	"@type": "type.googleapis.com/envoy.type.tracing.v3.CustomTag.Header"

	// Header name to obtain the value to populate the tag value.
	name!: string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// When the header does not exist,
	// the tag value will be populated with this default value if specified,
	// otherwise no tag will be populated.
	default_value?: string
}

// Metadata type custom tag using
// :ref:`MetadataKey <envoy_v3_api_msg_type.metadata.v3.MetadataKey>` to retrieve the protobuf value
// from :ref:`Metadata <envoy_v3_api_msg_config.core.v3.Metadata>`, and populate the tag value with
// `the canonical JSON <https://developers.google.com/protocol-buffers/docs/proto3#json>`_
// representation of it.
#CustomTag_Metadata: {
	"@type": "type.googleapis.com/envoy.type.tracing.v3.CustomTag.Metadata"

	// Specify what kind of metadata to obtain tag value from.
	kind?: v3_1.#MetadataKind

	// Metadata key to define the path to retrieve the tag value.
	metadata_key?: v3_1.#MetadataKey

	// When no valid metadata is found,
	// the tag value would be populated with this default value if specified,
	// otherwise no tag would be populated.
	default_value?: string
}
