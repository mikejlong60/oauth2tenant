// Code generated from envoy/admin/v3/tap.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/tap/v3"
)

#TapRequest: {
	"@type":     "type.googleapis.com/envoy.admin.v3.TapRequest"
	config_id!:  string & strings.MinRunes(1)
	tap_config!: v3_1.#TapConfig
}
