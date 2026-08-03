// Code generated from envoy/data/accesslog/v2/accesslog.proto. DO NOT EDIT.
package v2

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#TCPAccessLogEntry: {
	"@type":                "type.googleapis.com/envoy.data.accesslog.v2.TCPAccessLogEntry"
	common_properties?:     #AccessLogCommon
	connection_properties?: #ConnectionProperties
}

#HTTPAccessLogEntry: {
	"@type":            "type.googleapis.com/envoy.data.accesslog.v2.HTTPAccessLogEntry"
	common_properties?: #AccessLogCommon
	protocol_version?:  #HTTPAccessLogEntry_HTTPVersion
	request?:           #HTTPRequestProperties
	response?:          #HTTPResponseProperties
}

#HTTPAccessLogEntry_HTTPVersion: "PROTOCOL_UNSPECIFIED" | "HTTP10" | "HTTP11" | "HTTP2" | "HTTP3"

#ConnectionProperties: {
	"@type":         "type.googleapis.com/envoy.data.accesslog.v2.ConnectionProperties"
	received_bytes?: uint64
	sent_bytes?:     uint64
}

#AccessLogCommon: {
	"@type":                            "type.googleapis.com/envoy.data.accesslog.v2.AccessLogCommon"
	sample_rate?:                       float64 & >0 & <=1
	downstream_remote_address?:         core_1.#Address
	downstream_local_address?:          core_1.#Address
	tls_properties?:                    #TLSProperties
	start_time?:                        string
	time_to_last_rx_byte?:              string
	time_to_first_upstream_tx_byte?:    string
	time_to_last_upstream_tx_byte?:     string
	time_to_first_upstream_rx_byte?:    string
	time_to_last_upstream_rx_byte?:     string
	time_to_first_downstream_tx_byte?:  string
	time_to_last_downstream_tx_byte?:   string
	upstream_remote_address?:           core_1.#Address
	upstream_local_address?:            core_1.#Address
	upstream_cluster?:                  string
	response_flags?:                    #ResponseFlags
	metadata?:                          core_1.#Metadata
	upstream_transport_failure_reason?: string
	route_name?:                        string
	downstream_direct_remote_address?:  core_1.#Address
	filter_state_objects?: {[string]: {...}}
}

#ResponseFlags: {
	"@type":                            "type.googleapis.com/envoy.data.accesslog.v2.ResponseFlags"
	failed_local_healthcheck?:          bool
	no_healthy_upstream?:               bool
	upstream_request_timeout?:          bool
	local_reset?:                       bool
	upstream_remote_reset?:             bool
	upstream_connection_failure?:       bool
	upstream_connection_termination?:   bool
	upstream_overflow?:                 bool
	no_route_found?:                    bool
	delay_injected?:                    bool
	fault_injected?:                    bool
	rate_limited?:                      bool
	unauthorized_details?:              #ResponseFlags_Unauthorized
	rate_limit_service_error?:          bool
	downstream_connection_termination?: bool
	upstream_retry_limit_exceeded?:     bool
	stream_idle_timeout?:               bool
	invalid_envoy_request_headers?:     bool
	downstream_protocol_error?:         bool
}

#ResponseFlags_Unauthorized: {
	"@type": "type.googleapis.com/envoy.data.accesslog.v2.ResponseFlags.Unauthorized"
	reason?: #ResponseFlags_Unauthorized_Reason
}

#ResponseFlags_Unauthorized_Reason: "REASON_UNSPECIFIED" | "EXTERNAL_SERVICE"

#TLSProperties: {
	"@type":                       "type.googleapis.com/envoy.data.accesslog.v2.TLSProperties"
	tls_version?:                  #TLSProperties_TLSVersion
	tls_cipher_suite?:             uint32
	tls_sni_hostname?:             string
	local_certificate_properties?: #TLSProperties_CertificateProperties
	peer_certificate_properties?:  #TLSProperties_CertificateProperties
	tls_session_id?:               string
}

#TLSProperties_CertificateProperties: {
	"@type": "type.googleapis.com/envoy.data.accesslog.v2.TLSProperties.CertificateProperties"
	subject_alt_name?: [...#TLSProperties_CertificateProperties_SubjectAltName]
	subject?: string
}

#TLSProperties_CertificateProperties_SubjectAltName: {
	"@type": "type.googleapis.com/envoy.data.accesslog.v2.TLSProperties.CertificateProperties.SubjectAltName"
	uri?:    string
	dns?:    string
}

#TLSProperties_TLSVersion: "VERSION_UNSPECIFIED" | "TLSv1" | "TLSv1_1" | "TLSv1_2" | "TLSv1_3"

#HTTPRequestProperties: {
	"@type":                "type.googleapis.com/envoy.data.accesslog.v2.HTTPRequestProperties"
	request_method?:        core_1.#RequestMethod
	scheme?:                string
	authority?:             string
	port?:                  uint32
	path?:                  string
	user_agent?:            string
	referer?:               string
	forwarded_for?:         string
	request_id?:            string
	original_path?:         string
	request_headers_bytes?: uint64
	request_body_bytes?:    uint64
	request_headers?: {[string]: string}
}

#HTTPResponseProperties: {
	"@type":                 "type.googleapis.com/envoy.data.accesslog.v2.HTTPResponseProperties"
	response_code?:          uint32
	response_headers_bytes?: uint64
	response_body_bytes?:    uint64
	response_headers?: {[string]: string}
	response_trailers?: {[string]: string}
	response_code_details?: string
}
