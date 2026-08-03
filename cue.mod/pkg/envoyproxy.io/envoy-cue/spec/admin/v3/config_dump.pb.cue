// Code generated from envoy/admin/v3/config_dump.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/bootstrap/v3"
)

#ConfigDump: {
	"@type": "type.googleapis.com/envoy.admin.v3.ConfigDump"
	configs?: [...{...}]
}

#BootstrapConfigDump: {
	"@type":       "type.googleapis.com/envoy.admin.v3.BootstrapConfigDump"
	bootstrap?:    v3_1.#Bootstrap
	last_updated?: string
}

#SecretsConfigDump: {
	"@type": "type.googleapis.com/envoy.admin.v3.SecretsConfigDump"
	static_secrets?: [...#SecretsConfigDump_StaticSecret]
	dynamic_active_secrets?: [...#SecretsConfigDump_DynamicSecret]
	dynamic_warming_secrets?: [...#SecretsConfigDump_DynamicSecret]
}

#SecretsConfigDump_DynamicSecret: {
	"@type":       "type.googleapis.com/envoy.admin.v3.SecretsConfigDump.DynamicSecret"
	name?:         string
	version_info?: string
	last_updated?: string
	secret?: {...}
	error_state?:   #UpdateFailureState
	client_status?: #ClientResourceStatus
}

#SecretsConfigDump_StaticSecret: {
	"@type":       "type.googleapis.com/envoy.admin.v3.SecretsConfigDump.StaticSecret"
	name?:         string
	last_updated?: string
	secret?: {...}
}
