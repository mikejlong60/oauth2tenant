// Code generated from envoy/extensions/geoip_providers/common/v3/common.proto. DO NOT EDIT.
package v3

#CommonGeoipProviderConfig: {
	"@type":             "type.googleapis.com/envoy.extensions.geoip_providers.common.v3.CommonGeoipProviderConfig"
	geo_headers_to_add?: #CommonGeoipProviderConfig_GeolocationHeadersToAdd
	geo_field_keys?:     #CommonGeoipProviderConfig_GeolocationFieldKeys
}

#CommonGeoipProviderConfig_GeolocationHeadersToAdd: {
	"@type":              "type.googleapis.com/envoy.extensions.geoip_providers.common.v3.CommonGeoipProviderConfig.GeolocationHeadersToAdd"
	country?:             string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	city?:                string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	region?:              string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	asn?:                 string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	is_anon?:             string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	anon?:                string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	anon_vpn?:            string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	anon_hosting?:        string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	anon_tor?:            string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	anon_proxy?:          string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	isp?:                 string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	apple_private_relay?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#CommonGeoipProviderConfig_GeolocationFieldKeys: {
	"@type":              "type.googleapis.com/envoy.extensions.geoip_providers.common.v3.CommonGeoipProviderConfig.GeolocationFieldKeys"
	country?:             string
	city?:                string
	region?:              string
	asn?:                 string
	anon?:                string
	anon_vpn?:            string
	anon_hosting?:        string
	anon_tor?:            string
	anon_proxy?:          string
	isp?:                 string
	apple_private_relay?: string
}
