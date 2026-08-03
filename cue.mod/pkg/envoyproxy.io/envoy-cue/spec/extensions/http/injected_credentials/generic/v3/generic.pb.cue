// Code generated from envoy/extensions/http/injected_credentials/generic/v3/generic.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/tls/v3"
)

#Generic: {
	"@type":              "type.googleapis.com/envoy.extensions.http.injected_credentials.generic.v3.Generic"
	credential!:          v3_1.#SdsSecretConfig
	header?:              string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	header_value_prefix?: string
}
