// Code generated from envoy/extensions/filters/http/geoip/v3/geoip.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Geoip: {
	"@type":               "type.googleapis.com/envoy.extensions.filters.http.geoip.v3.Geoip"
	xff_config?:           #Geoip_XffConfig
	custom_header_config?: #Geoip_CustomHeaderConfig
	provider!:             v3_1.#TypedExtensionConfig
}

#Geoip_XffConfig: {
	"@type":               "type.googleapis.com/envoy.extensions.filters.http.geoip.v3.Geoip.XffConfig"
	xff_num_trusted_hops?: uint32
}

#Geoip_CustomHeaderConfig: {
	"@type":      "type.googleapis.com/envoy.extensions.filters.http.geoip.v3.Geoip.CustomHeaderConfig"
	header_name!: string & strings.MinRunes(1)
}
