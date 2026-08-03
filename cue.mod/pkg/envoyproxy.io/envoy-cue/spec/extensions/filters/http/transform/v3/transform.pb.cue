// Code generated from envoy/extensions/filters/http/transform/v3/transform.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/common/mutation_rules/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#TransformConfig: {
	"@type":                  "type.googleapis.com/envoy.extensions.filters.http.transform.v3.TransformConfig"
	request_transformation?:  #Transformation
	response_transformation?: #Transformation
	clear_cluster_cache?:     bool
	clear_route_cache?:       bool
}

#Transformation: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.transform.v3.Transformation"
	headers_mutations?: [...v3_1.#HeaderMutation]
	body_transformation?: #BodyTransformation
}

#BodyTransformation: {
	"@type":      "type.googleapis.com/envoy.extensions.filters.http.transform.v3.BodyTransformation"
	body_format!: v3_2.#SubstitutionFormatString
	action?:      #BodyTransformation_TransformAction
}

#BodyTransformation_TransformAction: "MERGE" | "REPLACE"
