// Code generated from envoy/extensions/bootstrap/dynamic_modules/v3/dynamic_modules.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/dynamic_modules/v3"
)

#DynamicModuleBootstrapExtension: {
	"@type":                "type.googleapis.com/envoy.extensions.bootstrap.dynamic_modules.v3.DynamicModuleBootstrapExtension"
	dynamic_module_config?: v3_1.#DynamicModuleConfig
	extension_name?:        string
	extension_config?: {...}
}
