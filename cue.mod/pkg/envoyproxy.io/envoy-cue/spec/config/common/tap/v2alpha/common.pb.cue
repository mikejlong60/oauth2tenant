// Code generated from envoy/config/common/tap/v2alpha/common.proto. DO NOT EDIT.
package v2alpha

import (
	v2alpha_1 "envoyproxy.io/envoy-cue/spec/service/tap/v2alpha"
)

// Common configuration for all tap extensions.
#CommonExtensionConfig: {
	"@type": "type.googleapis.com/envoy.config.common.tap.v2alpha.CommonExtensionConfig"

	// oneof config_type: exactly one must be set
	// If specified, the tap filter will be configured via an admin handler.
	{admin_config!: #AdminConfig} |
	{

		// If specified, the tap filter will be configured via a static configuration that cannot be
		// changed.
		static_config!: v2alpha_1.#TapConfig
	}
}

// Configuration for the admin handler. See :ref:`here <config_http_filters_tap_admin_handler>` for
// more information.
#AdminConfig: {
	"@type": "type.googleapis.com/envoy.config.common.tap.v2alpha.AdminConfig"

	// Opaque configuration ID. When requests are made to the admin handler, the passed opaque ID is
	// matched to the configured filter opaque ID to determine which filter to configure.
	config_id!: string & !=""
}
