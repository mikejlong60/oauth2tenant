// Code generated from envoy/service/auth/v2/attribute_context.proto. DO NOT EDIT.
package v2

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#AttributeContext: {
	"@type":      "type.googleapis.com/envoy.service.auth.v2.AttributeContext"
	source?:      #AttributeContext_Peer
	destination?: #AttributeContext_Peer
	request?:     #AttributeContext_Request
	context_extensions?: {[string]: string}
	metadata_context?: core_1.#Metadata
}

#AttributeContext_Peer: {
	"@type":  "type.googleapis.com/envoy.service.auth.v2.AttributeContext.Peer"
	address?: core_1.#Address
	service?: string
	labels?: {[string]: string}
	principal?:   string
	certificate?: string
}

#AttributeContext_Request: {
	"@type": "type.googleapis.com/envoy.service.auth.v2.AttributeContext.Request"
	time?:   string
	http?:   #AttributeContext_HttpRequest
}

#AttributeContext_HttpRequest: {
	"@type": "type.googleapis.com/envoy.service.auth.v2.AttributeContext.HttpRequest"
	id?:     string
	method?: string
	headers?: {[string]: string}
	path?:     string
	host?:     string
	scheme?:   string
	query?:    string
	fragment?: string
	size?:     int64
	protocol?: string
	body?:     string
}
