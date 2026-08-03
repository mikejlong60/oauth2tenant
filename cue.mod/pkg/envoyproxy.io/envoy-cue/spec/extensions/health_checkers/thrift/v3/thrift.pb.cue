// Code generated from envoy/extensions/health_checkers/thrift/v3/thrift.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/filters/network/thrift_proxy/v3"
)

#Thrift: {
	"@type":      "type.googleapis.com/envoy.extensions.health_checkers.thrift.v3.Thrift"
	method_name!: string & strings.MinRunes(1)
	transport?:   v3_1.#TransportType
	protocol?:    v3_1.#ProtocolType
}
