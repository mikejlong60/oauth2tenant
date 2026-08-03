// Code generated from envoy/config/core/v3/base.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/type/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/core/v3"
)

#Locality: {
	"@type":   "type.googleapis.com/envoy.config.core.v3.Locality"
	region?:   string
	zone?:     string
	sub_zone?: string
}

#BuildVersion: {
	"@type":  "type.googleapis.com/envoy.config.core.v3.BuildVersion"
	version?: v3_1.#SemanticVersion
	metadata?: {...}
}

#Extension: {
	"@type":          "type.googleapis.com/envoy.config.core.v3.Extension"
	name?:            string
	category?:        string
	type_descriptor?: string
	version?:         #BuildVersion
	disabled?:        bool
	type_urls?: [...string]
}

#Node: {
	"@type":  "type.googleapis.com/envoy.config.core.v3.Node"
	id?:      string
	cluster?: string
	metadata?: {...}
	dynamic_parameters?: {[string]: v3_2.#ContextParams}
	locality?:                 #Locality
	user_agent_name?:          string
	user_agent_version?:       string
	user_agent_build_version?: #BuildVersion
	extensions?: [...#Extension]
	client_features?: [...string]
	listening_addresses?: [...#Address]
}

#Metadata: {
	"@type": "type.googleapis.com/envoy.config.core.v3.Metadata"
	filter_metadata?: {[string]: {...}}
	typed_filter_metadata?: {[string]: {...}}
}

#RuntimeUInt32: {
	"@type":        "type.googleapis.com/envoy.config.core.v3.RuntimeUInt32"
	default_value?: uint32
	runtime_key?:   string
}

#RuntimePercent: {
	"@type":        "type.googleapis.com/envoy.config.core.v3.RuntimePercent"
	default_value?: v3_1.#Percent
	runtime_key?:   string
}

#RuntimeDouble: {
	"@type":        "type.googleapis.com/envoy.config.core.v3.RuntimeDouble"
	default_value?: float64
	runtime_key?:   string
}

#RuntimeFeatureFlag: {
	"@type":        "type.googleapis.com/envoy.config.core.v3.RuntimeFeatureFlag"
	default_value!: bool
	runtime_key?:   string
}

#KeyValue: {
	"@type": "type.googleapis.com/envoy.config.core.v3.KeyValue"
	key!:    string & strings.MinRunes(1)
	value?:  bytes
}

#KeyValuePair: {
	"@type": "type.googleapis.com/envoy.config.core.v3.KeyValuePair"
	key!:    string & strings.MinRunes(1)
	value?:  _
}

#KeyValueAppend: {
	"@type": "type.googleapis.com/envoy.config.core.v3.KeyValueAppend"
	record?: #KeyValuePair
	entry?:  #KeyValue
	action?: #KeyValueAppend_KeyValueAppendAction
}

#KeyValueAppend_KeyValueAppendAction: "APPEND_IF_EXISTS_OR_ADD" | "ADD_IF_ABSENT" | "OVERWRITE_IF_EXISTS_OR_ADD" | "OVERWRITE_IF_EXISTS"

#KeyValueMutation: {
	"@type": "type.googleapis.com/envoy.config.core.v3.KeyValueMutation"
	append?: #KeyValueAppend
	remove?: string
}

#QueryParameter: {
	"@type": "type.googleapis.com/envoy.config.core.v3.QueryParameter"
	key!:    string & strings.MinRunes(1)
	value?:  string
}

#HeaderValue: {
	"@type":    "type.googleapis.com/envoy.config.core.v3.HeaderValue"
	key!:       string & strings.MinRunes(1) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	value?:     string                       // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	raw_value?: bytes
}

#HeaderValueOption: {
	"@type":           "type.googleapis.com/envoy.config.core.v3.HeaderValueOption"
	header!:           #HeaderValue
	append?:           bool
	append_action?:    #HeaderValueOption_HeaderAppendAction
	keep_empty_value?: bool
}

#HeaderValueOption_HeaderAppendAction: "APPEND_IF_EXISTS_OR_ADD" | "ADD_IF_ABSENT" | "OVERWRITE_IF_EXISTS_OR_ADD" | "OVERWRITE_IF_EXISTS"

#HeaderMap: {
	"@type": "type.googleapis.com/envoy.config.core.v3.HeaderMap"
	headers?: [...#HeaderValue]
}

#WatchedDirectory: {
	"@type": "type.googleapis.com/envoy.config.core.v3.WatchedDirectory"
	path!:   string & strings.MinRunes(1)
}

#DataSource: {
	"@type":               "type.googleapis.com/envoy.config.core.v3.DataSource"
	filename!:             string & strings.MinRunes(1)
	inline_bytes?:         bytes
	inline_string?:        string
	environment_variable!: string & strings.MinRunes(1)
	watched_directory?:    #WatchedDirectory
}

#RetryPolicy: {
	"@type":         "type.googleapis.com/envoy.config.core.v3.RetryPolicy"
	retry_back_off?: #BackoffStrategy
	num_retries?:    uint32
	retry_on?:       string
	retry_priority?: #RetryPolicy_RetryPriority
	retry_host_predicate?: [...#RetryPolicy_RetryHostPredicate]
	host_selection_retry_max_attempts?: int64
}

#RetryPolicy_RetryPriority: {
	"@type": "type.googleapis.com/envoy.config.core.v3.RetryPolicy.RetryPriority"
	name!:   string & strings.MinRunes(1)
	typed_config?: {...}
}

#RetryPolicy_RetryHostPredicate: {
	"@type": "type.googleapis.com/envoy.config.core.v3.RetryPolicy.RetryHostPredicate"
	name!:   string & strings.MinRunes(1)
	typed_config?: {...}
}

#RemoteDataSource: {
	"@type":       "type.googleapis.com/envoy.config.core.v3.RemoteDataSource"
	http_uri!:     #HttpUri
	sha256!:       string & strings.MinRunes(1)
	retry_policy?: #RetryPolicy
}

#AsyncDataSource: {
	"@type": "type.googleapis.com/envoy.config.core.v3.AsyncDataSource"
	local?:  #DataSource
	remote?: #RemoteDataSource
}

#TransportSocket: {
	"@type": "type.googleapis.com/envoy.config.core.v3.TransportSocket"
	name!:   string & strings.MinRunes(1)
	typed_config?: {...}
}

#RuntimeFractionalPercent: {
	"@type":        "type.googleapis.com/envoy.config.core.v3.RuntimeFractionalPercent"
	default_value!: v3_1.#FractionalPercent
	runtime_key?:   string
}

#ControlPlane: {
	"@type":     "type.googleapis.com/envoy.config.core.v3.ControlPlane"
	identifier?: string
}

#RoutingPriority: "DEFAULT" | "HIGH"

#RequestMethod: "METHOD_UNSPECIFIED" | "GET" | "HEAD" | "POST" | "PUT" | "DELETE" | "CONNECT" | "OPTIONS" | "TRACE" | "PATCH"

#TrafficDirection: "UNSPECIFIED" | "INBOUND" | "OUTBOUND"
