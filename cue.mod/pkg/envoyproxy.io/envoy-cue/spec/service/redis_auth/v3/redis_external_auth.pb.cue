// Code generated from envoy/service/redis_auth/v3/redis_external_auth.proto. DO NOT EDIT.
package v3

import (
	status_1 "envoyproxy.io/envoy-cue/spec/deps/google.golang.org/genproto/googleapis/rpc/status"
)

#RedisProxyExternalAuthRequest: {
	"@type": "type.googleapis.com/envoy.service.redis_auth.v3.RedisProxyExternalAuthRequest"

	// Username, if applicable. Otherwise, empty.
	username?: string

	// Password sent with the AUTH command.
	password?: string
}

#RedisProxyExternalAuthResponse: {
	"@type": "type.googleapis.com/envoy.service.redis_auth.v3.RedisProxyExternalAuthResponse"

	// Status of the authentication check.
	status?: status_1.#Status

	// Optional expiration time for the authentication.
	// If set, the authentication will be valid until this time.
	// If not set, the authentication will be valid indefinitely.
	expiration?: string

	// Optional message to be sent back to the client.
	message?: string
}
