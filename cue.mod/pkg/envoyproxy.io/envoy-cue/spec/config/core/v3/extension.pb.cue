// Code generated from envoy/config/core/v3/extension.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

// Message type for extension configuration.
// [#next-major-version: revisit all existing typed_config that doesn't use this wrapper.].
#TypedExtensionConfig: {
	"@type": "type.googleapis.com/envoy.config.core.v3.TypedExtensionConfig"

	// The name of an extension. This is not used to select the extension, instead
	// it serves the role of an opaque identifier.
	name!: string & strings.MinRunes(1)

	// The typed config for the extension. The type URL will be used to identify
	// the extension. In the case that the type URL is ``xds.type.v3.TypedStruct``
	// (or, for historical reasons, ``udpa.type.v1.TypedStruct``), the inner type
	// URL of ``TypedStruct`` will be utilized. See the
	// :ref:`extension configuration overview
	// <config_overview_extension_configuration>` for further details.
	typed_config?: {...}
}
