// Code generated from envoy/extensions/matching/input_matchers/ip/v3/ip.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Ip: {
	"@type": "type.googleapis.com/envoy.extensions.matching.input_matchers.ip.v3.Ip"
	cidr_ranges!: [...v3_1.#CidrRange] & list.MinItems(1)
	stat_prefix!: string & strings.MinRunes(1)
}
