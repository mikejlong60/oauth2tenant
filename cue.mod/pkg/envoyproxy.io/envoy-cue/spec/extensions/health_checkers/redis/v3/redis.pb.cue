// Code generated from envoy/extensions/health_checkers/redis/v3/redis.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/filters/network/redis_proxy/v3"
)

#Redis: {
	"@type":  "type.googleapis.com/envoy.extensions.health_checkers.redis.v3.Redis"
	key?:     string
	aws_iam?: v3_1.#AwsIam
}
