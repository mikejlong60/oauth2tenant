// Code generated from envoy/admin/v3/tap.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/tap/v3"
)

// The /tap admin request body that is used to configure an active tap session.
#TapRequest: {
	"@type": "type.googleapis.com/envoy.admin.v3.TapRequest"

	// The opaque configuration ID used to match the configuration to a loaded extension.
	// A tap extension configures a similar opaque ID that is used to match.
	config_id!: string & strings.MinRunes(1)

	// The tap configuration to load.
	tap_config!: v3_1.#TapConfig
}
