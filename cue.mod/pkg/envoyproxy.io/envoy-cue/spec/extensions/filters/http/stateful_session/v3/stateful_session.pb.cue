// Code generated from envoy/extensions/filters/http/stateful_session/v3/stateful_session.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#StatefulSession: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.http.stateful_session.v3.StatefulSession"
	session_state?: v3_1.#TypedExtensionConfig
	strict?:        bool
	stat_prefix?:   string
}

#StatefulSessionPerRoute: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.stateful_session.v3.StatefulSessionPerRoute"

	// oneof override: exactly one must be set
	{disabled!: bool & true} |
	{stateful_session!: #StatefulSession}
}
