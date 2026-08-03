// Code generated from envoy/extensions/filters/listener/dynamic_modules/v3/dynamic_modules.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/dynamic_modules/v3"
)

#DynamicModuleListenerFilter: {
	"@type":                "type.googleapis.com/envoy.extensions.filters.listener.dynamic_modules.v3.DynamicModuleListenerFilter"
	dynamic_module_config?: v3_1.#DynamicModuleConfig
	filter_name?:           string
	filter_config?: {...}
}
