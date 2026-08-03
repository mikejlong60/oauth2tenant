// Code generated from envoy/extensions/filters/http/dynamic_modules/v3/dynamic_modules.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/dynamic_modules/v3"
)

#DynamicModuleFilter: {
	"@type":                "type.googleapis.com/envoy.extensions.filters.http.dynamic_modules.v3.DynamicModuleFilter"
	dynamic_module_config?: v3_1.#DynamicModuleConfig
	filter_name?:           string
	filter_config?: {...}
	terminal_filter?: bool
}

#DynamicModuleFilterPerRoute: {
	"@type":                "type.googleapis.com/envoy.extensions.filters.http.dynamic_modules.v3.DynamicModuleFilterPerRoute"
	dynamic_module_config?: v3_1.#DynamicModuleConfig
	per_route_config_name?: string
	filter_config?: {...}
}
