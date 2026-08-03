// Code generated from envoy/extensions/outlier_detection_monitors/consecutive_errors/v3/consecutive_errors.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/outlier_detection_monitors/common/v3"
)

#ConsecutiveErrors: {
	"@type":        "type.googleapis.com/envoy.extensions.outlier_detection_monitors.consecutive_errors.v3.ConsecutiveErrors"
	name?:          string
	threshold?:     uint32 & <=100
	enforcing?:     uint32 & <=100
	error_buckets?: v3_1.#ErrorBuckets
}
