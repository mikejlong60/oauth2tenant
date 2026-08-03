// Code generated from envoy/extensions/geoip_providers/maxmind/v3/maxmind.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/geoip_providers/common/v3"
)

#MaxMindConfig: {
	"@type":                 "type.googleapis.com/envoy.extensions.geoip_providers.maxmind.v3.MaxMindConfig"
	city_db_path?:           string // TODO(pgv): string.pattern
	asn_db_path?:            string // TODO(pgv): string.pattern
	anon_db_path?:           string // TODO(pgv): string.pattern
	isp_db_path?:            string // TODO(pgv): string.pattern
	country_db_path?:        string // TODO(pgv): string.pattern
	common_provider_config!: v3_1.#CommonGeoipProviderConfig
}
