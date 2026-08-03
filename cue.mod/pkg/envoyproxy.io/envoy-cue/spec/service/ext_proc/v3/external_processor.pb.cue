// Code generated from envoy/service/ext_proc/v3/external_processor.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/filters/http/ext_proc/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#ProtocolConfiguration: {
	"@type":                                        "type.googleapis.com/envoy.service.ext_proc.v3.ProtocolConfiguration"
	request_body_mode?:                             v3_1.#ProcessingMode_BodySendMode
	response_body_mode?:                            v3_1.#ProcessingMode_BodySendMode
	send_body_without_waiting_for_header_response?: bool
}

#ProcessingRequest: {
	"@type":            "type.googleapis.com/envoy.service.ext_proc.v3.ProcessingRequest"
	request_headers?:   #HttpHeaders
	response_headers?:  #HttpHeaders
	request_body?:      #HttpBody
	response_body?:     #HttpBody
	request_trailers?:  #HttpTrailers
	response_trailers?: #HttpTrailers
	metadata_context?:  v3_2.#Metadata
	attributes?: {[string]: {...}}
	observability_mode?: bool
	protocol_config?:    #ProtocolConfiguration
}

#ProcessingResponse: {
	"@type":                      "type.googleapis.com/envoy.service.ext_proc.v3.ProcessingResponse"
	request_headers?:             #HeadersResponse
	response_headers?:            #HeadersResponse
	request_body?:                #BodyResponse
	response_body?:               #BodyResponse
	request_trailers?:            #TrailersResponse
	response_trailers?:           #TrailersResponse
	immediate_response?:          #ImmediateResponse
	streamed_immediate_response?: #StreamedImmediateResponse
	dynamic_metadata?: {...}
	mode_override?:            v3_1.#ProcessingMode
	request_drain?:            bool
	override_message_timeout?: string
}

#HttpHeaders: {
	"@type":  "type.googleapis.com/envoy.service.ext_proc.v3.HttpHeaders"
	headers?: v3_2.#HeaderMap
	attributes?: {[string]: {...}}
	end_of_stream?: bool
}

#HttpBody: {
	"@type":                        "type.googleapis.com/envoy.service.ext_proc.v3.HttpBody"
	body?:                          bytes
	end_of_stream?:                 bool
	end_of_stream_without_message?: bool
	grpc_message_compressed?:       bool
}

#HttpTrailers: {
	"@type":   "type.googleapis.com/envoy.service.ext_proc.v3.HttpTrailers"
	trailers?: v3_2.#HeaderMap
}

#HeadersResponse: {
	"@type":   "type.googleapis.com/envoy.service.ext_proc.v3.HeadersResponse"
	response?: #CommonResponse
}

#BodyResponse: {
	"@type":   "type.googleapis.com/envoy.service.ext_proc.v3.BodyResponse"
	response?: #CommonResponse
}

#TrailersResponse: {
	"@type":          "type.googleapis.com/envoy.service.ext_proc.v3.TrailersResponse"
	header_mutation?: #HeaderMutation
}

#StreamedImmediateResponse: {
	"@type":            "type.googleapis.com/envoy.service.ext_proc.v3.StreamedImmediateResponse"
	headers_response?:  #HttpHeaders
	body_response?:     #StreamedBodyResponse
	trailers_response?: v3_2.#HeaderMap
}

#CommonResponse: {
	"@type":            "type.googleapis.com/envoy.service.ext_proc.v3.CommonResponse"
	status?:            #CommonResponse_ResponseStatus
	header_mutation?:   #HeaderMutation
	body_mutation?:     #BodyMutation
	trailers?:          v3_2.#HeaderMap
	clear_route_cache?: bool
}

#CommonResponse_ResponseStatus: "CONTINUE" | "CONTINUE_AND_REPLACE"

#ImmediateResponse: {
	"@type":      "type.googleapis.com/envoy.service.ext_proc.v3.ImmediateResponse"
	status!:      v3_3.#HttpStatus
	headers?:     #HeaderMutation
	body?:        bytes
	grpc_status?: #GrpcStatus
	details?:     string
}

#GrpcStatus: {
	"@type": "type.googleapis.com/envoy.service.ext_proc.v3.GrpcStatus"
	status?: uint32
}

#HeaderMutation: {
	"@type": "type.googleapis.com/envoy.service.ext_proc.v3.HeaderMutation"
	set_headers?: [...v3_2.#HeaderValueOption]
	remove_headers?: [...string]
}

#StreamedBodyResponse: {
	"@type":                        "type.googleapis.com/envoy.service.ext_proc.v3.StreamedBodyResponse"
	body?:                          bytes
	end_of_stream?:                 bool
	end_of_stream_without_message?: bool
	grpc_message_compressed?:       bool
}

#BodyMutation: {
	"@type":            "type.googleapis.com/envoy.service.ext_proc.v3.BodyMutation"
	body?:              bytes
	clear_body?:        bool
	streamed_response?: #StreamedBodyResponse
}
