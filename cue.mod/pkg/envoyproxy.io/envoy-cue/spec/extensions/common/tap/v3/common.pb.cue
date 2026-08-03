// Code generated from envoy/extensions/common/tap/v3/common.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/tap/v3"
)

#CommonExtensionConfig: {
	"@type":        "type.googleapis.com/envoy.extensions.common.tap.v3.CommonExtensionConfig"
	admin_config?:  #AdminConfig
	static_config?: v3_1.#TapConfig
}

#AdminConfig: {
	"@type":    "type.googleapis.com/envoy.extensions.common.tap.v3.AdminConfig"
	config_id!: string & strings.MinRunes(1)
}
