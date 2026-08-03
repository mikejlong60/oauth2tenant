// Code generated from envoy/config/filter/network/mongo_proxy/v2/mongo_proxy.proto. DO NOT EDIT.
package v2

import (
	v2_1 "envoyproxy.io/envoy-cue/spec/config/filter/fault/v2"
)

#MongoProxy: {
	"@type":                "type.googleapis.com/envoy.config.filter.network.mongo_proxy.v2.MongoProxy"
	stat_prefix!:           string & !=""
	access_log?:            string
	delay?:                 v2_1.#FaultDelay
	emit_dynamic_metadata?: bool
}
