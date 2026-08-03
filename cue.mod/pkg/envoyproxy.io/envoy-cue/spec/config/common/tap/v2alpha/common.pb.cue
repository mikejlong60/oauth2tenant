// Code generated from envoy/config/common/tap/v2alpha/common.proto. DO NOT EDIT.
package v2alpha

import (
	v2alpha_1 "envoyproxy.io/envoy-cue/spec/service/tap/v2alpha"
)

#CommonExtensionConfig: {
	"@type":        "type.googleapis.com/envoy.config.common.tap.v2alpha.CommonExtensionConfig"
	admin_config?:  #AdminConfig
	static_config?: v2alpha_1.#TapConfig
}

#AdminConfig: {
	"@type":    "type.googleapis.com/envoy.config.common.tap.v2alpha.AdminConfig"
	config_id!: string & !=""
}
