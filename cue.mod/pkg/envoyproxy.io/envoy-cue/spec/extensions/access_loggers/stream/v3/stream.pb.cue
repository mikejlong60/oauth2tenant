// Code generated from envoy/extensions/access_loggers/stream/v3/stream.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#StdoutAccessLog: {
	"@type":     "type.googleapis.com/envoy.extensions.access_loggers.stream.v3.StdoutAccessLog"
	log_format!: v3_1.#SubstitutionFormatString
}

#StderrAccessLog: {
	"@type":     "type.googleapis.com/envoy.extensions.access_loggers.stream.v3.StderrAccessLog"
	log_format!: v3_1.#SubstitutionFormatString
}
