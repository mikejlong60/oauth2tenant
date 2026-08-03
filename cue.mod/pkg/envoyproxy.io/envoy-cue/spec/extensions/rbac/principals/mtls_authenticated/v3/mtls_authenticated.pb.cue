// Code generated from envoy/extensions/rbac/principals/mtls_authenticated/v3/mtls_authenticated.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/tls/v3"
)

#Config: {
	"@type":                           "type.googleapis.com/envoy.extensions.rbac.principals.mtls_authenticated.v3.Config"
	san_matcher?:                      v3_1.#SubjectAltNameMatcher
	any_validated_client_certificate?: bool
}
