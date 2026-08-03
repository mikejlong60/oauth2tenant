// Code generated from envoy/extensions/access_loggers/dynamic_modules/v3/dynamic_modules.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/dynamic_modules/v3"
)

#DynamicModuleAccessLog: {
	"@type":                "type.googleapis.com/envoy.extensions.access_loggers.dynamic_modules.v3.DynamicModuleAccessLog"
	dynamic_module_config!: v3_1.#DynamicModuleConfig
	logger_name?:           string
	logger_config?: {...}
}
