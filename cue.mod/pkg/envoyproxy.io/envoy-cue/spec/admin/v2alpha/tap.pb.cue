// Code generated from envoy/admin/v2alpha/tap.proto. DO NOT EDIT.
package v2alpha

import (
	v2alpha_1 "envoyproxy.io/envoy-cue/spec/service/tap/v2alpha"
)

// The /tap admin request body that is used to configure an active tap session.
#TapRequest: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.TapRequest"

	// The opaque configuration ID used to match the configuration to a loaded extension.
	// A tap extension configures a similar opaque ID that is used to match.
	config_id!: string & !=""

	// The tap configuration to load.
	tap_config!: v2alpha_1.#TapConfig
}
