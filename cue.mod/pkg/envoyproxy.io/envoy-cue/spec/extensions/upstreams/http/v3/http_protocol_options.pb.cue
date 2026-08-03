// Code generated from envoy/extensions/upstreams/http/v3/http_protocol_options.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/filters/network/http_connection_manager/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/route/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/config/common/matcher/v3"
)

#HttpProtocolOptions: {
	"@type":                         "type.googleapis.com/envoy.extensions.upstreams.http.v3.HttpProtocolOptions"
	common_http_protocol_options?:   v3_1.#HttpProtocolOptions
	upstream_http_protocol_options?: v3_1.#UpstreamHttpProtocolOptions
	explicit_http_config?:           #HttpProtocolOptions_ExplicitHttpConfig
	use_downstream_protocol_config?: #HttpProtocolOptions_UseDownstreamHttpConfig
	auto_config?:                    #HttpProtocolOptions_AutoHttpConfig
	http_filters?: [...v3_2.#HttpFilter]
	header_validation_config?: v3_1.#TypedExtensionConfig
	outlier_detection?:        #HttpProtocolOptions_OutlierDetection
	request_mirror_policies?: [...v3_3.#RouteAction_RequestMirrorPolicy]
	hash_policy?: [...v3_3.#RouteAction_HashPolicy]
	retry_policy?: v3_3.#RetryPolicy
}

#HttpProtocolOptions_ExplicitHttpConfig: {
	"@type":                 "type.googleapis.com/envoy.extensions.upstreams.http.v3.HttpProtocolOptions.ExplicitHttpConfig"
	http_protocol_options?:  v3_1.#Http1ProtocolOptions
	http2_protocol_options?: v3_1.#Http2ProtocolOptions
	http3_protocol_options?: v3_1.#Http3ProtocolOptions
}

#HttpProtocolOptions_UseDownstreamHttpConfig: {
	"@type":                 "type.googleapis.com/envoy.extensions.upstreams.http.v3.HttpProtocolOptions.UseDownstreamHttpConfig"
	http_protocol_options?:  v3_1.#Http1ProtocolOptions
	http2_protocol_options?: v3_1.#Http2ProtocolOptions
	http3_protocol_options?: v3_1.#Http3ProtocolOptions
}

#HttpProtocolOptions_AutoHttpConfig: {
	"@type":                            "type.googleapis.com/envoy.extensions.upstreams.http.v3.HttpProtocolOptions.AutoHttpConfig"
	http_protocol_options?:             v3_1.#Http1ProtocolOptions
	http2_protocol_options?:            v3_1.#Http2ProtocolOptions
	http3_protocol_options?:            v3_1.#Http3ProtocolOptions
	alternate_protocols_cache_options?: v3_1.#AlternateProtocolsCacheOptions
}

#HttpProtocolOptions_OutlierDetection: {
	"@type":        "type.googleapis.com/envoy.extensions.upstreams.http.v3.HttpProtocolOptions.OutlierDetection"
	error_matcher!: v3_4.#MatchPredicate
}
