// Code generated from envoy/extensions/filters/http/on_demand/v3/on_demand.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#OnDemandCds: {
	"@type":            "type.googleapis.com/envoy.extensions.filters.http.on_demand.v3.OnDemandCds"
	source?:            v3_1.#ConfigSource
	resources_locator?: string
	timeout?:           string
}

#OnDemand: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.on_demand.v3.OnDemand"
	odcds?:  #OnDemandCds
}

#PerRouteConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.on_demand.v3.PerRouteConfig"
	odcds?:  #OnDemandCds
}
