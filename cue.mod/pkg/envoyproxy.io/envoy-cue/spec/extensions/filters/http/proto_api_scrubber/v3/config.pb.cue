// Code generated from envoy/extensions/filters/http/proto_api_scrubber/v3/config.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
)

#ProtoApiScrubberConfig: {
	"@type":         "type.googleapis.com/envoy.extensions.filters.http.proto_api_scrubber.v3.ProtoApiScrubberConfig"
	descriptor_set?: #DescriptorSet
	restrictions?:   #Restrictions
	filtering_mode?: #ProtoApiScrubberConfig_FilteringMode
}

#ProtoApiScrubberConfig_FilteringMode: "OVERRIDE"

#DescriptorSet: {
	"@type":      "type.googleapis.com/envoy.extensions.filters.http.proto_api_scrubber.v3.DescriptorSet"
	data_source?: v3_1.#DataSource
}

#Restrictions: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.proto_api_scrubber.v3.Restrictions"
	method_restrictions?: {[string]: #MethodRestrictions}
	message_restrictions?: {[string]: #MessageRestrictions}
}

#MethodRestrictions: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.proto_api_scrubber.v3.MethodRestrictions"
	request_field_restrictions?: {[string]: #RestrictionConfig}
	response_field_restrictions?: {[string]: #RestrictionConfig}
	method_restriction?: #RestrictionConfig
}

#MessageRestrictions: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.proto_api_scrubber.v3.MessageRestrictions"
	config?: #RestrictionConfig
	field_restrictions?: {[string]: #RestrictionConfig}
}

#RestrictionConfig: {
	"@type":  "type.googleapis.com/envoy.extensions.filters.http.proto_api_scrubber.v3.RestrictionConfig"
	matcher?: v3_2.#Matcher
}
