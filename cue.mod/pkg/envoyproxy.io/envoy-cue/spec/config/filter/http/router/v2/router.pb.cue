// Code generated from envoy/config/filter/http/router/v2/router.proto. DO NOT EDIT.
package v2

import (
	v2_1 "envoyproxy.io/envoy-cue/spec/config/filter/accesslog/v2"
)

#Router: {
	"@type":           "type.googleapis.com/envoy.config.filter.http.router.v2.Router"
	dynamic_stats?:    bool
	start_child_span?: bool
	upstream_log?: [...v2_1.#AccessLog]
	suppress_envoy_headers?: bool
	strict_check_headers?: [...string]
	respect_expected_rq_timeout?: bool
}
