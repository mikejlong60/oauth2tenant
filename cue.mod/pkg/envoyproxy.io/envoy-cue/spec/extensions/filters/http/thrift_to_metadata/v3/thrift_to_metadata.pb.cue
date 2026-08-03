// Code generated from envoy/extensions/filters/http/thrift_to_metadata/v3/thrift_to_metadata.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/filters/network/thrift_proxy/v3"
)

#KeyValuePair: {
	"@type":             "type.googleapis.com/envoy.extensions.filters.http.thrift_to_metadata.v3.KeyValuePair"
	metadata_namespace?: string
	key!:                string & strings.MinRunes(1)
	value?:              _
}

#FieldSelector: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.thrift_to_metadata.v3.FieldSelector"
	name!:   string & strings.MinRunes(1)
	id?:     int32 & >=-32768 & <=32767
	child?:  #FieldSelector
}

#Rule: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.http.thrift_to_metadata.v3.Rule"
	field?:          #Field
	field_selector?: #FieldSelector
	method_name?:    string
	on_present?:     #KeyValuePair
	on_missing?:     #KeyValuePair
}

#ThriftToMetadata: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.thrift_to_metadata.v3.ThriftToMetadata"
	request_rules?: [...#Rule]
	response_rules?: [...#Rule]
	transport?: v3_1.#TransportType
	protocol?:  v3_1.#ProtocolType
	allow_content_types?: [...string]
	allow_empty_content_type?: bool
}

#ThriftToMetadataPerRoute: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.thrift_to_metadata.v3.ThriftToMetadataPerRoute"
	request_rules?: [...#Rule]
	response_rules?: [...#Rule]
}

#Field: "METHOD_NAME" | "PROTOCOL" | "TRANSPORT" | "HEADER_FLAGS" | "SEQUENCE_ID" | "MESSAGE_TYPE" | "REPLY_TYPE"
