// Code generated from envoy/extensions/filters/network/generic_proxy/v3/route.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/type/matcher/v3"
)

#VirtualHost: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.v3.VirtualHost"
	name!:   string & strings.MinRunes(1)
	hosts!: [...string] & list.MinItems(1)
	routes!: v3_1.#Matcher
}

#RouteConfiguration: {
	"@type": "type.googleapis.com/envoy.extensions.filters.network.generic_proxy.v3.RouteConfiguration"
	name!:   string & strings.MinRunes(1)
	routes?: v3_1.#Matcher
	virtual_hosts?: [...#VirtualHost]
}
