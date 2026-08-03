// Code generated from envoy/extensions/http/injected_credentials/oauth2/v3/oauth2.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/tls/v3"
)

#OAuth2: {
	"@type":         "type.googleapis.com/envoy.extensions.http.injected_credentials.oauth2.v3.OAuth2"
	token_endpoint!: v3_1.#HttpUri
	scopes?: [...string]
	client_credentials?:         #OAuth2_ClientCredentials
	token_fetch_retry_interval?: string // TODO(pgv): duration bounds
	endpoint_params?: [...#OAuth2_EndpointParameter]
}

#OAuth2_ClientCredentials: {
	"@type":        "type.googleapis.com/envoy.extensions.http.injected_credentials.oauth2.v3.OAuth2.ClientCredentials"
	client_id!:     string & strings.MinRunes(1)
	client_secret!: v3_2.#SdsSecretConfig
	auth_type?:     #OAuth2_AuthType
}

#OAuth2_EndpointParameter: {
	"@type": "type.googleapis.com/envoy.extensions.http.injected_credentials.oauth2.v3.OAuth2.EndpointParameter"
	name!:   string & strings.MinRunes(1)
	value?:  string
}

#OAuth2_AuthType: "BASIC_AUTH" | "URL_ENCODED_BODY"
