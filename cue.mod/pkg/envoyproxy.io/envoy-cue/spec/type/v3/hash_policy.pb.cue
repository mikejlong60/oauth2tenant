// Code generated from envoy/type/v3/hash_policy.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#HashPolicy: {
	"@type":       "type.googleapis.com/envoy.type.v3.HashPolicy"
	source_ip?:    #HashPolicy_SourceIp
	filter_state?: #HashPolicy_FilterState
}

#HashPolicy_SourceIp: {
	"@type": "type.googleapis.com/envoy.type.v3.HashPolicy.SourceIp"
}

#HashPolicy_FilterState: {
	"@type": "type.googleapis.com/envoy.type.v3.HashPolicy.FilterState"
	key!:    string & strings.MinRunes(1)
}
