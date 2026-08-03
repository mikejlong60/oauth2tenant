// Code generated from envoy/api/v2/scoped_route.proto. DO NOT EDIT.
package v2

import (
	"list"
)

#ScopedRouteConfiguration: {
	"@type":                   "type.googleapis.com/envoy.api.v2.ScopedRouteConfiguration"
	name!:                     string & !=""
	route_configuration_name!: string & !=""
	key!:                      #ScopedRouteConfiguration_Key
}

#ScopedRouteConfiguration_Key: {
	"@type": "type.googleapis.com/envoy.api.v2.ScopedRouteConfiguration.Key"
	fragments!: [...#ScopedRouteConfiguration_Key_Fragment] & list.MinItems(1)
}

#ScopedRouteConfiguration_Key_Fragment: {
	"@type":     "type.googleapis.com/envoy.api.v2.ScopedRouteConfiguration.Key.Fragment"
	string_key?: string
}
