// Code generated from envoy/api/v2/core/base.proto. DO NOT EDIT.
package core

import (
	type_1 "envoyproxy.io/envoy-cue/spec/type"
)

#Locality: {
	"@type":   "type.googleapis.com/envoy.api.v2.core.Locality"
	region?:   string
	zone?:     string
	sub_zone?: string
}

#BuildVersion: {
	"@type":  "type.googleapis.com/envoy.api.v2.core.BuildVersion"
	version?: type_1.#SemanticVersion
	metadata?: {...}
}

#Extension: {
	"@type":          "type.googleapis.com/envoy.api.v2.core.Extension"
	name?:            string
	category?:        string
	type_descriptor?: string
	version?:         #BuildVersion
	disabled?:        bool
}

#Node: {
	"@type":  "type.googleapis.com/envoy.api.v2.core.Node"
	id?:      string
	cluster?: string
	metadata?: {...}
	locality?:        #Locality
	build_version?:   string
	user_agent_name?: string
	extensions?: [...#Extension]
	client_features?: [...string]
	listening_addresses?: [...#Address]

	// oneof user_agent_version_type: at most one may be set
	*{} |
	{user_agent_version!: string} |
	{user_agent_build_version!: #BuildVersion}
}

#Metadata: {
	"@type": "type.googleapis.com/envoy.api.v2.core.Metadata"
	filter_metadata?: {[string]: {...}}
}

#RuntimeUInt32: {
	"@type":        "type.googleapis.com/envoy.api.v2.core.RuntimeUInt32"
	default_value?: uint32
	runtime_key!:   string & !=""
}

#RuntimeDouble: {
	"@type":        "type.googleapis.com/envoy.api.v2.core.RuntimeDouble"
	default_value?: float64
	runtime_key!:   string & !=""
}

#RuntimeFeatureFlag: {
	"@type":        "type.googleapis.com/envoy.api.v2.core.RuntimeFeatureFlag"
	default_value!: bool
	runtime_key!:   string & !=""
}

#HeaderValue: {
	"@type": "type.googleapis.com/envoy.api.v2.core.HeaderValue"
	key!:    string & !="" // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	value?:  string        // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#HeaderValueOption: {
	"@type": "type.googleapis.com/envoy.api.v2.core.HeaderValueOption"
	header!: #HeaderValue
	append?: bool
}

#HeaderMap: {
	"@type": "type.googleapis.com/envoy.api.v2.core.HeaderMap"
	headers?: [...#HeaderValue]
}

#DataSource: {
	"@type": "type.googleapis.com/envoy.api.v2.core.DataSource"

	// oneof specifier: exactly one must be set
	{filename!: string & !=""} |
	{inline_bytes!: bytes} |
	{inline_string!: string & !=""}
}

#RetryPolicy: {
	"@type":         "type.googleapis.com/envoy.api.v2.core.RetryPolicy"
	retry_back_off?: #BackoffStrategy
	num_retries?:    uint32
}

#RemoteDataSource: {
	"@type":       "type.googleapis.com/envoy.api.v2.core.RemoteDataSource"
	http_uri!:     #HttpUri
	sha256!:       string & !=""
	retry_policy?: #RetryPolicy
}

#AsyncDataSource: {
	"@type": "type.googleapis.com/envoy.api.v2.core.AsyncDataSource"

	// oneof specifier: exactly one must be set
	{local!: #DataSource} |
	{remote!: #RemoteDataSource}
}

#TransportSocket: {
	"@type": "type.googleapis.com/envoy.api.v2.core.TransportSocket"
	name!:   string & !=""

	// oneof config_type: at most one may be set
	*{} |
	{config!: {...}} |
	{typed_config!: {...}}
}

#RuntimeFractionalPercent: {
	"@type":        "type.googleapis.com/envoy.api.v2.core.RuntimeFractionalPercent"
	default_value!: type_1.#FractionalPercent
	runtime_key?:   string
}

#ControlPlane: {
	"@type":     "type.googleapis.com/envoy.api.v2.core.ControlPlane"
	identifier?: string
}

#RoutingPriority: "DEFAULT" | "HIGH"

#RequestMethod: "METHOD_UNSPECIFIED" | "GET" | "HEAD" | "POST" | "PUT" | "DELETE" | "CONNECT" | "OPTIONS" | "TRACE" | "PATCH"

#TrafficDirection: "UNSPECIFIED" | "INBOUND" | "OUTBOUND"
