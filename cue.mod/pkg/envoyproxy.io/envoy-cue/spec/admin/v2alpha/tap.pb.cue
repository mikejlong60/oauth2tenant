// Code generated from envoy/admin/v2alpha/tap.proto. DO NOT EDIT.
package v2alpha

import (
	v2alpha_1 "envoyproxy.io/envoy-cue/spec/service/tap/v2alpha"
)

#TapRequest: {
	"@type":     "type.googleapis.com/envoy.admin.v2alpha.TapRequest"
	config_id!:  string & !=""
	tap_config!: v2alpha_1.#TapConfig
}
