// Code generated from envoy/extensions/filters/network/mongo_proxy/v3/mongo_proxy.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/filters/common/fault/v3"
)

#MongoProxy: {
	"@type":                "type.googleapis.com/envoy.extensions.filters.network.mongo_proxy.v3.MongoProxy"
	stat_prefix!:           string & strings.MinRunes(1)
	access_log?:            string
	delay?:                 v3_1.#FaultDelay
	emit_dynamic_metadata?: bool
	commands?: [...string]
}
