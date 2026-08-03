// Code generated from envoy/service/auth/v3/attribute_context.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#AttributeContext: {
	"@type":      "type.googleapis.com/envoy.service.auth.v3.AttributeContext"
	source?:      #AttributeContext_Peer
	destination?: #AttributeContext_Peer
	request?:     #AttributeContext_Request
	context_extensions?: {[string]: string}
	metadata_context?:       v3_1.#Metadata
	route_metadata_context?: v3_1.#Metadata
	tls_session?:            #AttributeContext_TLSSession
}

#AttributeContext_Peer: {
	"@type":  "type.googleapis.com/envoy.service.auth.v3.AttributeContext.Peer"
	address?: v3_1.#Address
	service?: string
	labels?: {[string]: string}
	principal?:   string
	certificate?: string
}

#AttributeContext_Request: {
	"@type": "type.googleapis.com/envoy.service.auth.v3.AttributeContext.Request"
	time?:   string
	http?:   #AttributeContext_HttpRequest
}

#AttributeContext_HttpRequest: {
	"@type": "type.googleapis.com/envoy.service.auth.v3.AttributeContext.HttpRequest"
	id?:     string
	method?: string
	headers?: {[string]: string}
	header_map?: v3_1.#HeaderMap
	path?:       string
	host?:       string
	scheme?:     string
	query?:      string
	fragment?:   string
	size?:       int64
	protocol?:   string
	body?:       string
	raw_body?:   bytes
}

#AttributeContext_TLSSession: {
	"@type": "type.googleapis.com/envoy.service.auth.v3.AttributeContext.TLSSession"
	sni?:    string
}
