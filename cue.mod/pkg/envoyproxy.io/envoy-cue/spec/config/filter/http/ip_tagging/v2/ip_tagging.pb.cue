// Code generated from envoy/config/filter/http/ip_tagging/v2/ip_tagging.proto. DO NOT EDIT.
package v2

import (
	"list"
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#IPTagging: {
	"@type": "type.googleapis.com/envoy.config.filter.http.ip_tagging.v2.IPTagging"

	// The type of request the filter should apply to.
	request_type?: #IPTagging_RequestType

	// [#comment:TODO(ccaraman): Extend functionality to load IP tags from file system.
	// Tracked by issue https://github.com/envoyproxy/envoy/issues/2695]
	// The set of IP tags for the filter.
	ip_tags!: [...#IPTagging_IPTag] & list.MinItems(1)
}

// Supplies the IP tag name and the IP address subnets.
#IPTagging_IPTag: {
	"@type": "type.googleapis.com/envoy.config.filter.http.ip_tagging.v2.IPTagging.IPTag"

	// Specifies the IP tag name to apply.
	ip_tag_name?: string

	// A list of IP address subnets that will be tagged with
	// ip_tag_name. Both IPv4 and IPv6 are supported.
	ip_list?: [...core_1.#CidrRange]
}

// The type of requests the filter should apply to. The supported types
// are internal, external or both. The
// :ref:`x-forwarded-for<config_http_conn_man_headers_x-forwarded-for_internal_origin>` header is
// used to determine if a request is internal and will result in
// :ref:`x-envoy-internal<config_http_conn_man_headers_x-envoy-internal>`
// being set. The filter defaults to both, and it will apply to all request types.
#IPTagging_RequestType:
	// Both external and internal requests will be tagged. This is the default value.
	"BOTH" |

	// Only internal requests will be tagged.
	"INTERNAL" |

	// Only external requests will be tagged.
	"EXTERNAL"
