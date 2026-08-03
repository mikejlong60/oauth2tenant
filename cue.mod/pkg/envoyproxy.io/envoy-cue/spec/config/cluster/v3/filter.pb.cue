// Code generated from envoy/config/cluster/v3/filter.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Filter: {
	"@type": "type.googleapis.com/envoy.config.cluster.v3.Filter"
	name!:   string & strings.MinRunes(1)
	typed_config?: {...}
	config_discovery?: v3_1.#ExtensionConfigSource
}
