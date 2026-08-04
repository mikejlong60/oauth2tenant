// Code generated from envoy/extensions/string_matcher/lua/v3/lua.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Lua: {
	"@type": "type.googleapis.com/envoy.extensions.string_matcher.lua.v3.Lua"

	// The Lua code that Envoy will execute
	source_code!: v3_1.#DataSource
}
