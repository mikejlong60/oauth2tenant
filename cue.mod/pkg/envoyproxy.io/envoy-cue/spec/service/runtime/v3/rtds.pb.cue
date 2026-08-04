// Code generated from envoy/service/runtime/v3/rtds.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

// [#not-implemented-hide:] Not configuration. Workaround c++ protobuf issue with importing
// services: https://github.com/google/protobuf/issues/4221
#RtdsDummy: {
	"@type": "type.googleapis.com/envoy.service.runtime.v3.RtdsDummy"
}

// RTDS resource type. This describes a layer in the runtime virtual filesystem.
#Runtime: {
	"@type": "type.googleapis.com/envoy.service.runtime.v3.Runtime"

	// Runtime resource name. This makes the Runtime a self-describing xDS
	// resource.
	name!: string & strings.MinRunes(1)
	layer?: {...}
}
