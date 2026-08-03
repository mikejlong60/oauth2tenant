// Code generated from envoy/service/redis_auth/v3/redis_external_auth.proto. DO NOT EDIT.
package v3

import (
	status_1 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/rpc/status"
)

#RedisProxyExternalAuthRequest: {
	"@type":   "type.googleapis.com/envoy.service.redis_auth.v3.RedisProxyExternalAuthRequest"
	username?: string
	password?: string
}

#RedisProxyExternalAuthResponse: {
	"@type":     "type.googleapis.com/envoy.service.redis_auth.v3.RedisProxyExternalAuthResponse"
	status?:     status_1.#Status
	expiration?: string
	message?:    string
}
