// Code generated from envoy/config/filter/network/ext_authz/v2/ext_authz.proto. DO NOT EDIT.
package v2

import (
	core_1 "envoyproxy.io/envoy-cue/spec/api/v2/core"
)

#ExtAuthz: {
	"@type":                   "type.googleapis.com/envoy.config.filter.network.ext_authz.v2.ExtAuthz"
	stat_prefix!:              string & !=""
	grpc_service?:             core_1.#GrpcService
	failure_mode_allow?:       bool
	include_peer_certificate?: bool
}
