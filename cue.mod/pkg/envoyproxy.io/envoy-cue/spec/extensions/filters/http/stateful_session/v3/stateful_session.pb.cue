// Code generated from envoy/extensions/filters/http/stateful_session/v3/stateful_session.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#StatefulSession: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.stateful_session.v3.StatefulSession"

	// Specifies the implementation of session state. This session state is used to store and retrieve the address of the
	// upstream host assigned to the session.
	//
	// [#extension-category: envoy.http.stateful_session]
	session_state?: v3_1.#TypedExtensionConfig

	// Determines whether the HTTP request must be strictly routed to the requested destination. When set to ``true``,
	// if the requested destination is unavailable, Envoy will return a 503 status code. The default value is ``false``,
	// which allows Envoy to fall back to its load balancing mechanism. In this case, if the requested destination is not
	// found, the request will be routed according to the load balancing algorithm.
	strict?: bool

	// Optional stat prefix. If specified, the filter will emit statistics in the
	// ``http.<stat_prefix>.stateful_session.<stat_prefix>.`` namespace. If not specified, no statistics will be emitted.
	//
	// .. note::
	//
	//   Per-route configuration overrides do not support statistics and will not emit stats even if this field is set
	//   in the per-route config.
	stat_prefix?: string
}

#StatefulSessionPerRoute: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.stateful_session.v3.StatefulSessionPerRoute"

	// oneof override: exactly one must be set
	// Disable the stateful session filter for this particular vhost or route. If disabled is
	// specified in multiple per-filter-configs, the most specific one will be used.
	{disabled!: bool & true} |
	{

		// Per-route stateful session configuration that can be served by RDS or static route table.
		stateful_session!: #StatefulSession
	}
}
