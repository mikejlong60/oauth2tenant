// Code generated from envoy/extensions/access_loggers/fluentd/v3/fluentd.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#FluentdAccessLogConfig: {
	"@type":                "type.googleapis.com/envoy.extensions.access_loggers.fluentd.v3.FluentdAccessLogConfig"
	cluster!:               string & strings.MinRunes(1)
	tag!:                   string & strings.MinRunes(1)
	stat_prefix!:           string & strings.MinRunes(1)
	buffer_flush_interval?: string // TODO(pgv): duration bounds
	buffer_size_bytes?:     uint32
	record!: {...}
	retry_options?: #FluentdAccessLogConfig_RetryOptions
	formatters?: [...v3_1.#TypedExtensionConfig]
}

#FluentdAccessLogConfig_RetryOptions: {
	"@type":               "type.googleapis.com/envoy.extensions.access_loggers.fluentd.v3.FluentdAccessLogConfig.RetryOptions"
	max_connect_attempts?: uint32
	backoff_options?:      v3_1.#BackoffStrategy
}
