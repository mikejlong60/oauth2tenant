// Code generated from envoy/extensions/filters/udp/udp_proxy/v3/route.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#Route: {
	"@type": "type.googleapis.com/envoy.extensions.filters.udp.udp_proxy.v3.Route"

	// Indicates the upstream cluster to which the request should be routed.
	cluster!: string & strings.MinRunes(1)
}
