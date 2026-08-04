// Code generated from envoy/extensions/filters/http/ip_tagging/v3/ip_tagging.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

// [#next-free-field: 6]
#IPTagging: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.ip_tagging.v3.IPTagging"

	// The type of request the filter should apply to.
	request_type?: #IPTagging_RequestType

	// [#comment:TODO(ccaraman): Extend functionality to load IP tags from file system.
	// Tracked by issue https://github.com/envoyproxy/envoy/issues/2695]
	// The set of IP tags for the filter.
	ip_tags!: [...#IPTagging_IPTag] & list.MinItems(1)

	// Specify to which header the tags will be written.
	//
	// If left unspecified, the tags will be appended to the ``x-envoy-ip-tags`` header.
	ip_tag_header?: #IPTagging_IpTagHeader
}

// Supplies the IP tag name and the IP address subnets.
#IPTagging_IPTag: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.ip_tagging.v3.IPTagging.IPTag"

	// Specifies the IP tag name to apply.
	ip_tag_name?: string

	// A list of IP address subnets that will be tagged with
	// ip_tag_name. Both IPv4 and IPv6 are supported.
	ip_list?: [...v3_1.#CidrRange]
}

// Specify to which header the tags will be written.
#IPTagging_IpTagHeader: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.ip_tagging.v3.IPTagging.IpTagHeader"

	// Header to use for ip-tagging.
	//
	// This header will be sanitized based on the config in
	// :ref:`action <envoy_v3_api_field_extensions.filters.http.ip_tagging.v3.IPTagging.IpTagHeader.action>`
	// rather than the defaults for x-envoy prefixed headers.
	header!: string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// Control if the :ref:`header <envoy_v3_api_field_extensions.filters.http.ip_tagging.v3.IPTagging.IpTagHeader.header>`
	// will be sanitized, or be appended to.
	//
	// Default: *SANITIZE*.
	action?: #IPTagging_IpTagHeader_HeaderAction
}

// Describes how to apply the tags to the headers.
#IPTagging_IpTagHeader_HeaderAction:
	// (DEFAULT) The header specified in :ref:`ip_tag_header <envoy_v3_api_field_extensions.filters.http.ip_tagging.v3.IPTagging.ip_tag_header>`
	// will be dropped, before the tags are applied. The incoming header will be "sanitized" regardless of whether the request is internal or external.
	//
	// Note that the header will be visible unsanitized to any filters that are invoked before the ip-tag-header filter, unless it has an *x-envoy* prefix.
	"SANITIZE" |

	// Tags will be appended to the header specified in
	// :ref:`ip_tag_header <envoy_v3_api_field_extensions.filters.http.ip_tagging.v3.IPTagging.ip_tag_header>`.
	//
	// Please note that this could cause the header to retain values set by the http client regardless of whether the request is internal or external.
	"APPEND_IF_EXISTS_OR_ADD"

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
