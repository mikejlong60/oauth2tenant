// Code generated from envoy/extensions/http/original_ip_detection/xff/v3/xff.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#XffConfig: {
	"@type":               "type.googleapis.com/envoy.extensions.http.original_ip_detection.xff.v3.XffConfig"
	xff_num_trusted_hops?: uint32
	xff_trusted_cidrs?:    #XffTrustedCidrs
	skip_xff_append?:      bool
}

#XffTrustedCidrs: {
	"@type": "type.googleapis.com/envoy.extensions.http.original_ip_detection.xff.v3.XffTrustedCidrs"
	cidrs?: [...v3_1.#CidrRange]
}
