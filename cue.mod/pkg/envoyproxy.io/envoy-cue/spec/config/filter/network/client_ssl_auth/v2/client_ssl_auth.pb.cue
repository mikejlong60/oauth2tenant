// Code generated from envoy/config/filter/network/client_ssl_auth/v2/client_ssl_auth.proto. DO NOT EDIT.
package v2

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#ClientSSLAuth: {
	"@type":           "type.googleapis.com/envoy.config.filter.network.client_ssl_auth.v2.ClientSSLAuth"
	auth_api_cluster!: string & !=""
	stat_prefix!:      string & !=""
	refresh_delay?:    string
	ip_white_list?: [...core_1.#CidrRange]
}
