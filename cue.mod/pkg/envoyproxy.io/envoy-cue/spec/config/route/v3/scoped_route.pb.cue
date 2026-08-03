// Code generated from envoy/config/route/v3/scoped_route.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
)

#ScopedRouteConfiguration: {
	"@type":                   "type.googleapis.com/envoy.config.route.v3.ScopedRouteConfiguration"
	on_demand?:                bool
	name!:                     string & strings.MinRunes(1)
	route_configuration_name?: string
	route_configuration?:      #RouteConfiguration
	key!:                      #ScopedRouteConfiguration_Key
}

#ScopedRouteConfiguration_Key: {
	"@type": "type.googleapis.com/envoy.config.route.v3.ScopedRouteConfiguration.Key"
	fragments!: [...#ScopedRouteConfiguration_Key_Fragment] & list.MinItems(1)
}

#ScopedRouteConfiguration_Key_Fragment: {
	"@type":     "type.googleapis.com/envoy.config.route.v3.ScopedRouteConfiguration.Key.Fragment"
	string_key?: string
}
