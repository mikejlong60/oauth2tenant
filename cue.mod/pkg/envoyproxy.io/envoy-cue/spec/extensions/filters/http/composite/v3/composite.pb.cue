// Code generated from envoy/extensions/filters/http/composite/v3/composite.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Composite: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.composite.v3.Composite"
	named_filter_chains?: {[string]: #FilterChainConfiguration}
}

#FilterChainConfiguration: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.composite.v3.FilterChainConfiguration"
	typed_config?: [...v3_1.#TypedExtensionConfig]
}

#DynamicConfig: {
	"@type":           "type.googleapis.com/envoy.extensions.filters.http.composite.v3.DynamicConfig"
	name!:             string & strings.MinRunes(1)
	config_discovery?: v3_1.#ExtensionConfigSource
}

#ExecuteFilterAction: {
	"@type":            "type.googleapis.com/envoy.extensions.filters.http.composite.v3.ExecuteFilterAction"
	typed_config?:      v3_1.#TypedExtensionConfig
	dynamic_config?:    #DynamicConfig
	filter_chain?:      #FilterChainConfiguration
	filter_chain_name?: string
	sample_percent?:    v3_1.#RuntimeFractionalPercent
}
