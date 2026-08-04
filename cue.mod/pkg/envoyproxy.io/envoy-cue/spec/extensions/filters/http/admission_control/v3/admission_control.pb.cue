// Code generated from envoy/extensions/filters/http/admission_control/v3/admission_control.proto. DO NOT EDIT.
package v3

import (
	"list"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/v3"
)

#AdmissionControl: {
	"@type":                    "type.googleapis.com/envoy.extensions.filters.http.admission_control.v3.AdmissionControl"
	enabled?:                   v3_1.#RuntimeFeatureFlag
	sampling_window?:           string
	aggression?:                v3_1.#RuntimeDouble
	sr_threshold?:              v3_1.#RuntimePercent
	rps_threshold?:             v3_1.#RuntimeUInt32
	max_rejection_probability?: v3_1.#RuntimePercent

	// oneof evaluation_criteria: exactly one must be set
	{success_criteria!: #AdmissionControl_SuccessCriteria}
}

#AdmissionControl_SuccessCriteria: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.http.admission_control.v3.AdmissionControl.SuccessCriteria"
	http_criteria?: #AdmissionControl_SuccessCriteria_HttpCriteria
	grpc_criteria?: #AdmissionControl_SuccessCriteria_GrpcCriteria
}

#AdmissionControl_SuccessCriteria_HttpCriteria: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.admission_control.v3.AdmissionControl.SuccessCriteria.HttpCriteria"
	http_success_status!: [...v3_2.#Int32Range] & list.MinItems(1)
}

#AdmissionControl_SuccessCriteria_GrpcCriteria: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.admission_control.v3.AdmissionControl.SuccessCriteria.GrpcCriteria"
	grpc_success_status!: [...uint32] & list.MinItems(1)
}
