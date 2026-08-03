// Code generated from envoy/extensions/filters/http/basic_auth/v3/basic_auth.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#BasicAuth: {
	"@type":                  "type.googleapis.com/envoy.extensions.filters.http.basic_auth.v3.BasicAuth"
	users?:                   v3_1.#DataSource
	forward_username_header?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	authentication_header?:   string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#BasicAuthPerRoute: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.basic_auth.v3.BasicAuthPerRoute"
	users!:  v3_1.#DataSource
}
