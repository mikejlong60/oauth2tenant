// Code generated from envoy/service/rate_limit_quota/v3/rlqs.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#RateLimitQuotaUsageReports: {
	"@type": "type.googleapis.com/envoy.service.rate_limit_quota.v3.RateLimitQuotaUsageReports"
	domain!: string & strings.MinRunes(1)
	bucket_quota_usages!: [...#RateLimitQuotaUsageReports_BucketQuotaUsage] & list.MinItems(1)
}

#RateLimitQuotaUsageReports_BucketQuotaUsage: {
	"@type":               "type.googleapis.com/envoy.service.rate_limit_quota.v3.RateLimitQuotaUsageReports.BucketQuotaUsage"
	bucket_id!:            #BucketId
	time_elapsed!:         string // TODO(pgv): duration bounds
	num_requests_allowed?: uint64
	num_requests_denied?:  uint64
}

#RateLimitQuotaResponse: {
	"@type": "type.googleapis.com/envoy.service.rate_limit_quota.v3.RateLimitQuotaResponse"
	bucket_action!: [...#RateLimitQuotaResponse_BucketAction] & list.MinItems(1)
}

#RateLimitQuotaResponse_BucketAction: {
	"@type":    "type.googleapis.com/envoy.service.rate_limit_quota.v3.RateLimitQuotaResponse.BucketAction"
	bucket_id!: #BucketId

	// oneof bucket_action: exactly one must be set
	{quota_assignment_action!: #RateLimitQuotaResponse_BucketAction_QuotaAssignmentAction} |
	{abandon_action!: #RateLimitQuotaResponse_BucketAction_AbandonAction}
}

#RateLimitQuotaResponse_BucketAction_QuotaAssignmentAction: {
	"@type":                  "type.googleapis.com/envoy.service.rate_limit_quota.v3.RateLimitQuotaResponse.BucketAction.QuotaAssignmentAction"
	assignment_time_to_live?: string // TODO(pgv): duration bounds
	rate_limit_strategy?:     v3_1.#RateLimitStrategy
}

#RateLimitQuotaResponse_BucketAction_AbandonAction: {
	"@type": "type.googleapis.com/envoy.service.rate_limit_quota.v3.RateLimitQuotaResponse.BucketAction.AbandonAction"
}

#BucketId: {
	"@type": "type.googleapis.com/envoy.service.rate_limit_quota.v3.BucketId"
	bucket?: {[string]: string}
}
