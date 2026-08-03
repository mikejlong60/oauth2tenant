// Code generated from envoy/extensions/tracers/fluentd/v3/fluentd.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#FluentdConfig: {
	"@type":                "type.googleapis.com/envoy.extensions.tracers.fluentd.v3.FluentdConfig"
	cluster!:               string & strings.MinRunes(1)
	tag!:                   string & strings.MinRunes(1)
	stat_prefix!:           string & strings.MinRunes(1)
	buffer_flush_interval?: string // TODO(pgv): duration bounds
	buffer_size_bytes?:     uint32
	retry_policy?:          v3_1.#RetryPolicy
}
