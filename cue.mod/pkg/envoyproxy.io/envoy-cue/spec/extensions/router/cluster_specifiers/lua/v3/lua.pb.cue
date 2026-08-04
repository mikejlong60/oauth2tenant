// Code generated from envoy/extensions/router/cluster_specifiers/lua/v3/lua.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#LuaConfig: {
	"@type": "type.googleapis.com/envoy.extensions.router.cluster_specifiers.lua.v3.LuaConfig"

	// The lua code that Envoy will execute to select cluster.
	source_code!: v3_1.#DataSource

	// Default cluster. It will be used when the lua code execute failure.
	default_cluster?: string
}
