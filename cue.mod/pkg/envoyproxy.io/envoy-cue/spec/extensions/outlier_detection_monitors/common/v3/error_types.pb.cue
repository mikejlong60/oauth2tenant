// Code generated from envoy/extensions/outlier_detection_monitors/common/v3/error_types.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#HttpErrors: {
	"@type": "type.googleapis.com/envoy.extensions.outlier_detection_monitors.common.v3.HttpErrors"
	range?:  v3_1.#Int32Range
}

#LocalOriginErrors: {
	"@type": "type.googleapis.com/envoy.extensions.outlier_detection_monitors.common.v3.LocalOriginErrors"
}

#DatabaseErrors: {
	"@type": "type.googleapis.com/envoy.extensions.outlier_detection_monitors.common.v3.DatabaseErrors"
}

#ErrorBuckets: {
	"@type": "type.googleapis.com/envoy.extensions.outlier_detection_monitors.common.v3.ErrorBuckets"
	http_errors?: [...#HttpErrors]
	local_origin_errors?: [...#LocalOriginErrors]
	database_errors?: [...#DatabaseErrors]
}
