// Code generated from envoy/config/cluster/v3/filter.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Filter: {
	"@type": "type.googleapis.com/envoy.config.cluster.v3.Filter"

	// The name of the filter configuration.
	name!: string & strings.MinRunes(1)

	// Filter specific configuration which depends on the filter being
	// instantiated. See the supported filters for further documentation.
	// Note that Envoy's :ref:`downstream network
	// filters <config_network_filters>` are not valid upstream network filters.
	// Only one of typed_config or config_discovery can be used.
	typed_config?: {...}

	// Configuration source specifier for an extension configuration discovery
	// service. In case of a failure and without the default configuration, the
	// listener closes the connections.
	// Only one of typed_config or config_discovery can be used.
	config_discovery?: v3_1.#ExtensionConfigSource
}
