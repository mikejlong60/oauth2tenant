// Code generated from envoy/extensions/filters/http/api_key_auth/v3/api_key_auth.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#ApiKeyAuth: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.api_key_auth.v3.ApiKeyAuth"
	credentials?: [...#Credential]
	key_sources?: [...#KeySource]
	forwarding?: #Forwarding
}

#ApiKeyAuthPerRoute: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.api_key_auth.v3.ApiKeyAuthPerRoute"
	credentials?: [...#Credential]
	key_sources?: [...#KeySource]
	allowed_clients?: [...string]
	forwarding?: #Forwarding
}

#Credential: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.api_key_auth.v3.Credential"
	key!:    string & strings.MinRunes(1)
	client!: string & strings.MinRunes(1)
}

#KeySource: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.api_key_auth.v3.KeySource"
	header?: string & strings.MaxRunes(1024) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	query?:  string & strings.MaxRunes(1024)
	cookie?: string & strings.MaxRunes(1024) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#Forwarding: {
	"@type":           "type.googleapis.com/envoy.extensions.filters.http.api_key_auth.v3.Forwarding"
	header?:           string & strings.MaxRunes(1024) // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	hide_credentials?: bool
}
