// Code generated from envoy/extensions/filters/common/set_filter_state/v3/value.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#FilterStateValue: {
	"@type":               "type.googleapis.com/envoy.extensions.filters.common.set_filter_state.v3.FilterStateValue"
	factory_key?:          string
	read_only?:            bool
	shared_with_upstream?: #FilterStateValue_SharedWithUpstream
	skip_if_empty?:        bool

	// oneof key: exactly one must be set
	{object_key!: string & strings.MinRunes(1)}

	// oneof value: exactly one must be set
	{format_string!: v3_1.#SubstitutionFormatString}
}

#FilterStateValue_SharedWithUpstream: "NONE" | "ONCE" | "TRANSITIVE"
