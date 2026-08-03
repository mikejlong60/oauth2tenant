// Code generated from envoy/type/v3/ratelimit_strategy.proto. DO NOT EDIT.
package v3

#RateLimitStrategy: {
	"@type":                 "type.googleapis.com/envoy.type.v3.RateLimitStrategy"
	blanket_rule?:           #RateLimitStrategy_BlanketRule
	requests_per_time_unit?: #RateLimitStrategy_RequestsPerTimeUnit
	token_bucket?:           #TokenBucket
}

#RateLimitStrategy_RequestsPerTimeUnit: {
	"@type":                 "type.googleapis.com/envoy.type.v3.RateLimitStrategy.RequestsPerTimeUnit"
	requests_per_time_unit?: uint64
	time_unit?:              #RateLimitUnit
}

#RateLimitStrategy_BlanketRule: "ALLOW_ALL" | "DENY_ALL"
