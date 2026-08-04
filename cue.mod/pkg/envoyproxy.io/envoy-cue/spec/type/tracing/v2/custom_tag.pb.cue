// Code generated from envoy/type/tracing/v2/custom_tag.proto. DO NOT EDIT.
package v2

import (
	v2_1 "envoyproxy.io/envoy-cue/spec/type/metadata/v2"
)

#CustomTag: {
	"@type": "type.googleapis.com/envoy.type.tracing.v2.CustomTag"
	tag!:    string & !=""

	// oneof type: exactly one must be set
	{literal!: #CustomTag_Literal} |
	{environment!: #CustomTag_Environment} |
	{request_header!: #CustomTag_Header} |
	{metadata!: #CustomTag_Metadata}
}

#CustomTag_Literal: {
	"@type": "type.googleapis.com/envoy.type.tracing.v2.CustomTag.Literal"
	value!:  string & !=""
}

#CustomTag_Environment: {
	"@type":        "type.googleapis.com/envoy.type.tracing.v2.CustomTag.Environment"
	name!:          string & !=""
	default_value?: string
}

#CustomTag_Header: {
	"@type":        "type.googleapis.com/envoy.type.tracing.v2.CustomTag.Header"
	name!:          string & !="" // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	default_value?: string
}

#CustomTag_Metadata: {
	"@type":        "type.googleapis.com/envoy.type.tracing.v2.CustomTag.Metadata"
	kind?:          v2_1.#MetadataKind
	metadata_key?:  v2_1.#MetadataKey
	default_value?: string
}
