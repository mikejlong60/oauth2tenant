// Code generated from envoy/extensions/filters/http/lua/v3/lua.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Lua: {
	"@type":      "type.googleapis.com/envoy.extensions.filters.http.lua.v3.Lua"
	inline_code?: string
	source_codes?: {[string]: v3_1.#DataSource}
	default_source_code?: v3_1.#DataSource
	stat_prefix?:         string
	clear_route_cache?:   bool
}

#LuaPerRoute: {
	"@type":      "type.googleapis.com/envoy.extensions.filters.http.lua.v3.LuaPerRoute"
	disabled!:    bool & true
	name!:        string & strings.MinRunes(1)
	source_code?: v3_1.#DataSource
	filter_context?: {...}
}
