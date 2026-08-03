// Code generated from envoy/config/filter/http/ip_tagging/v2/ip_tagging.proto. DO NOT EDIT.
package v2

import (
	"list"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#IPTagging: {
	"@type":       "type.googleapis.com/envoy.config.filter.http.ip_tagging.v2.IPTagging"
	request_type?: #IPTagging_RequestType
	ip_tags!: [...#IPTagging_IPTag] & list.MinItems(1)
}

#IPTagging_IPTag: {
	"@type":      "type.googleapis.com/envoy.config.filter.http.ip_tagging.v2.IPTagging.IPTag"
	ip_tag_name?: string
	ip_list?: [...core_1.#CidrRange]
}

#IPTagging_RequestType: "BOTH" | "INTERNAL" | "EXTERNAL"
