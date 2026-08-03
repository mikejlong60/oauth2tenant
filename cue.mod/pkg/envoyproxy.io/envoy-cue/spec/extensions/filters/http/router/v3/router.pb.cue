// Code generated from envoy/extensions/filters/http/router/v3/router.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/accesslog/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/filters/network/http_connection_manager/v3"
)

#Router: {
	"@type":           "type.googleapis.com/envoy.extensions.filters.http.router.v3.Router"
	dynamic_stats?:    bool
	start_child_span?: bool
	upstream_log?: [...v3_1.#AccessLog]
	upstream_log_options?:   #Router_UpstreamAccessLogOptions
	suppress_envoy_headers?: bool
	strict_check_headers?: [...string]
	respect_expected_rq_timeout?:              bool
	suppress_grpc_request_failure_code_stats?: bool
	upstream_http_filters?: [...v3_2.#HttpFilter]
	reject_connect_request_early_data?: bool
}

#Router_UpstreamAccessLogOptions: {
	"@type":                                "type.googleapis.com/envoy.extensions.filters.http.router.v3.Router.UpstreamAccessLogOptions"
	flush_upstream_log_on_upstream_stream?: bool
	upstream_log_flush_interval?:           string // TODO(pgv): duration bounds
}
