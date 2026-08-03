// Code generated from envoy/extensions/wasm/v3/wasm.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ReloadConfig: {
	"@type":  "type.googleapis.com/envoy.extensions.wasm.v3.ReloadConfig"
	backoff?: v3_1.#BackoffStrategy
}

#CapabilityRestrictionConfig: {
	"@type": "type.googleapis.com/envoy.extensions.wasm.v3.CapabilityRestrictionConfig"
	allowed_capabilities?: {[string]: #SanitizationConfig}
}

#SanitizationConfig: {
	"@type": "type.googleapis.com/envoy.extensions.wasm.v3.SanitizationConfig"
}

#VmConfig: {
	"@type":  "type.googleapis.com/envoy.extensions.wasm.v3.VmConfig"
	vm_id?:   string
	runtime?: string
	code?:    v3_1.#AsyncDataSource
	configuration?: {...}
	allow_precompiled?:       bool
	nack_on_code_cache_miss?: bool
	environment_variables?:   #EnvironmentVariables
}

#EnvironmentVariables: {
	"@type": "type.googleapis.com/envoy.extensions.wasm.v3.EnvironmentVariables"
	host_env_keys?: [...string]
	key_values?: {[string]: string}
}

#PluginConfig: {
	"@type":    "type.googleapis.com/envoy.extensions.wasm.v3.PluginConfig"
	name?:      string
	root_id?:   string
	vm_config?: #VmConfig
	configuration?: {...}
	fail_open?:                       bool
	failure_policy?:                  #FailurePolicy
	reload_config?:                   #ReloadConfig
	capability_restriction_config?:   #CapabilityRestrictionConfig
	allow_on_headers_stop_iteration?: bool
}

#WasmService: {
	"@type":    "type.googleapis.com/envoy.extensions.wasm.v3.WasmService"
	config?:    #PluginConfig
	singleton?: bool
}

#FailurePolicy: "UNSPECIFIED" | "FAIL_RELOAD" | "FAIL_CLOSED" | "FAIL_OPEN"
