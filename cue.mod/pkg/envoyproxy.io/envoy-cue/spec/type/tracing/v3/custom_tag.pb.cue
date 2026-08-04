// Code generated from envoy/type/tracing/v3/custom_tag.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/metadata/v3"
)

#CustomTag: {
	"@type": "type.googleapis.com/envoy.type.tracing.v3.CustomTag"
	tag!:    string & strings.MinRunes(1)

	// oneof type: exactly one must be set
	{literal!: #CustomTag_Literal} |
	{environment!: #CustomTag_Environment} |
	{request_header!: #CustomTag_Header} |
	{metadata!: #CustomTag_Metadata} |
	{value!: string}
}

#CustomTag_Literal: {
	"@type": "type.googleapis.com/envoy.type.tracing.v3.CustomTag.Literal"
	value!:  string & strings.MinRunes(1)
}

#CustomTag_Environment: {
	"@type":        "type.googleapis.com/envoy.type.tracing.v3.CustomTag.Environment"
	name!:          string & strings.MinRunes(1)
	default_value?: string
}

#CustomTag_Header: {
	"@type":        "type.googleapis.com/envoy.type.tracing.v3.CustomTag.Header"
	name!:          string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	default_value?: string
}

#CustomTag_Metadata: {
	"@type":        "type.googleapis.com/envoy.type.tracing.v3.CustomTag.Metadata"
	kind?:          v3_1.#MetadataKind
	metadata_key?:  v3_1.#MetadataKey
	default_value?: string
}
