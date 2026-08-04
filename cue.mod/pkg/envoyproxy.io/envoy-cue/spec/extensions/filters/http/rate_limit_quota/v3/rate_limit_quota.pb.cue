// Code generated from envoy/extensions/filters/http/rate_limit_quota/v3/rate_limit_quota.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	status_4 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/rpc/status"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#RateLimitQuotaFilterConfig: {
	"@type":          "type.googleapis.com/envoy.extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaFilterConfig"
	rlqs_server!:     v3_1.#GrpcService
	domain!:          string & strings.MinRunes(1)
	bucket_matchers!: v3_2.#Matcher
	filter_enabled?:  v3_1.#RuntimeFractionalPercent
	filter_enforced?: v3_1.#RuntimeFractionalPercent
	request_headers_to_add_when_not_enforced?: [...v3_1.#HeaderValueOption] & list.MaxItems(10)
}

#RateLimitQuotaOverride: {
	"@type":          "type.googleapis.com/envoy.extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaOverride"
	domain?:          string
	bucket_matchers?: v3_2.#Matcher
}

#RateLimitQuotaBucketSettings: {
	"@type":                      "type.googleapis.com/envoy.extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaBucketSettings"
	bucket_id_builder?:           #RateLimitQuotaBucketSettings_BucketIdBuilder
	reporting_interval!:          string // TODO(pgv): duration bounds
	deny_response_settings?:      #RateLimitQuotaBucketSettings_DenyResponseSettings
	no_assignment_behavior?:      #RateLimitQuotaBucketSettings_NoAssignmentBehavior
	expired_assignment_behavior?: #RateLimitQuotaBucketSettings_ExpiredAssignmentBehavior
}

#RateLimitQuotaBucketSettings_NoAssignmentBehavior: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaBucketSettings.NoAssignmentBehavior"

	// oneof no_assignment_behavior: exactly one must be set
	{fallback_rate_limit!: v3_3.#RateLimitStrategy}
}

#RateLimitQuotaBucketSettings_ExpiredAssignmentBehavior: {
	"@type":                              "type.googleapis.com/envoy.extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaBucketSettings.ExpiredAssignmentBehavior"
	expired_assignment_behavior_timeout?: string // TODO(pgv): duration bounds

	// oneof expired_assignment_behavior: exactly one must be set
	{fallback_rate_limit!: v3_3.#RateLimitStrategy} |
	{reuse_last_assignment!: #RateLimitQuotaBucketSettings_ExpiredAssignmentBehavior_ReuseLastAssignment}
}

#RateLimitQuotaBucketSettings_ExpiredAssignmentBehavior_ReuseLastAssignment: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaBucketSettings.ExpiredAssignmentBehavior.ReuseLastAssignment"
}

#RateLimitQuotaBucketSettings_DenyResponseSettings: {
	"@type":      "type.googleapis.com/envoy.extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaBucketSettings.DenyResponseSettings"
	http_status?: v3_3.#HttpStatus
	http_body?:   bytes
	grpc_status?: status_4.#Status
	response_headers_to_add?: [...v3_1.#HeaderValueOption] & list.MaxItems(10)
}

#RateLimitQuotaBucketSettings_BucketIdBuilder: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaBucketSettings.BucketIdBuilder"
	bucket_id_builder?: {[string]: #RateLimitQuotaBucketSettings_BucketIdBuilder_ValueBuilder}
}

#RateLimitQuotaBucketSettings_BucketIdBuilder_ValueBuilder: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.rate_limit_quota.v3.RateLimitQuotaBucketSettings.BucketIdBuilder.ValueBuilder"

	// oneof value_specifier: exactly one must be set
	{string_value!: string} |
	{custom_value!: v3_1.#TypedExtensionConfig}
}
