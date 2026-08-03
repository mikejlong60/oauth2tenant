// Code generated from envoy/extensions/filters/common/dependency/v3/dependency.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#Dependency: {
	"@type": "type.googleapis.com/envoy.extensions.filters.common.dependency.v3.Dependency"
	type?:   #Dependency_DependencyType
	name!:   string & strings.MinRunes(1)
}

#Dependency_DependencyType: "HEADER" | "FILTER_STATE_KEY" | "DYNAMIC_METADATA"

#FilterDependencies: {
	"@type": "type.googleapis.com/envoy.extensions.filters.common.dependency.v3.FilterDependencies"
	decode_required?: [...#Dependency]
	decode_provided?: [...#Dependency]
	encode_required?: [...#Dependency]
	encode_provided?: [...#Dependency]
}

#MatchingRequirements: {
	"@type":                "type.googleapis.com/envoy.extensions.filters.common.dependency.v3.MatchingRequirements"
	data_input_allow_list?: #MatchingRequirements_DataInputAllowList
}

#MatchingRequirements_DataInputAllowList: {
	"@type": "type.googleapis.com/envoy.extensions.filters.common.dependency.v3.MatchingRequirements.DataInputAllowList"
	type_url?: [...string]
}
