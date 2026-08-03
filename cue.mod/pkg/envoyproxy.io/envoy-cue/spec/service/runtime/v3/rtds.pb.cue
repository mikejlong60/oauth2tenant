// Code generated from envoy/service/runtime/v3/rtds.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#RtdsDummy: {
	"@type": "type.googleapis.com/envoy.service.runtime.v3.RtdsDummy"
}

#Runtime: {
	"@type": "type.googleapis.com/envoy.service.runtime.v3.Runtime"
	name!:   string & strings.MinRunes(1)
	layer?: {...}
}
