// Code generated from envoy/extensions/filters/http/ip_tagging/v3/ip_tagging.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#IPTagging: {
	"@type":       "type.googleapis.com/envoy.extensions.filters.http.ip_tagging.v3.IPTagging"
	request_type?: #IPTagging_RequestType
	ip_tags!: [...#IPTagging_IPTag] & list.MinItems(1)
	ip_tag_header?: #IPTagging_IpTagHeader
}

#IPTagging_IPTag: {
	"@type":      "type.googleapis.com/envoy.extensions.filters.http.ip_tagging.v3.IPTagging.IPTag"
	ip_tag_name?: string
	ip_list?: [...v3_1.#CidrRange]
}

#IPTagging_IpTagHeader: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.ip_tagging.v3.IPTagging.IpTagHeader"
	header!: string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	action?: #IPTagging_IpTagHeader_HeaderAction
}

#IPTagging_IpTagHeader_HeaderAction: "SANITIZE" | "APPEND_IF_EXISTS_OR_ADD"

#IPTagging_RequestType: "BOTH" | "INTERNAL" | "EXTERNAL"
