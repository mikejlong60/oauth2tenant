// Code generated from envoy/extensions/http/injected_credentials/oauth2/v3/oauth2.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/tls/v3"
)

// OAuth2 extension can be used to retrieve an OAuth2 access token from an authorization server and inject it into the
// proxied requests.
// Currently, only the Client Credentials Grant flow is supported.
// The access token will be injected into the request headers using the ``Authorization`` header as a bearer token.
// [#next-free-field: 6]
#OAuth2: {
	"@type": "type.googleapis.com/envoy.extensions.http.injected_credentials.oauth2.v3.OAuth2"

	// Endpoint on the authorization server to retrieve the access token from.
	// Refer to [RFC 6749: The OAuth 2.0 Authorization Framework](https://www.rfc-editor.org/rfc/rfc6749#section-3.2) for details.
	token_endpoint!: v3_1.#HttpUri

	// Optional list of OAuth scopes to be claimed in the authorization request.
	// Refer to [RFC 6749: The OAuth 2.0 Authorization Framework](https://www.rfc-editor.org/rfc/rfc6749#section-4.4.2) for details.
	scopes?: [...string]

	// The interval between two successive retries to fetch token from Identity Provider. Default is 2 secs.
	// The interval must be at least 1 second.
	token_fetch_retry_interval?: string // TODO(pgv): duration bounds

	// Optional list of additional parameters to send to the token endpoint.
	// These parameters will be URL-encoded and included in the token request body.
	endpoint_params?: [...#OAuth2_EndpointParameter]

	// oneof flow_type: exactly one must be set
	// Client Credentials Grant.
	// Refer to [RFC 6749: The OAuth 2.0 Authorization Framework](https://www.rfc-editor.org/rfc/rfc6749#section-4.4) for details.
	{client_credentials!: #OAuth2_ClientCredentials}
}

// Credentials to authenticate client to the authorization server.
// Refer to [RFC 6749: The OAuth 2.0 Authorization Framework](https://www.rfc-editor.org/rfc/rfc6749#section-2.3) for details.
#OAuth2_ClientCredentials: {
	"@type": "type.googleapis.com/envoy.extensions.http.injected_credentials.oauth2.v3.OAuth2.ClientCredentials"

	// Client ID.
	// Refer to [RFC 6749: The OAuth 2.0 Authorization Framework](https://www.rfc-editor.org/rfc/rfc6749#section-2.3.1) for details.
	client_id!: string & strings.MinRunes(1)

	// Client secret.
	// Refer to [RFC 6749: The OAuth 2.0 Authorization Framework](https://www.rfc-editor.org/rfc/rfc6749#section-2.3.1) for details.
	client_secret!: v3_2.#SdsSecretConfig

	// The method to use when sending credentials to the authorization server.
	// Refer to [RFC 6749: The OAuth 2.0 Authorization Framework](https://www.rfc-editor.org/rfc/rfc6749#section-2.3.1) for details.
	auth_type?: #OAuth2_AuthType
}

// Optional additional parameters to include in the token endpoint request body.
// These parameters will be URL-encoded and added to the request body along with the standard OAuth2 parameters.
// Refer to your authorization server's documentation for supported parameters.
#OAuth2_EndpointParameter: {
	"@type": "type.googleapis.com/envoy.extensions.http.injected_credentials.oauth2.v3.OAuth2.EndpointParameter"

	// Parameter name.
	name!: string & strings.MinRunes(1)

	// Parameter value.
	value?: string
}

#OAuth2_AuthType:
	// The ``client_id`` and ``client_secret`` will be sent using HTTP Basic authentication scheme.
	"BASIC_AUTH" |

	// The ``client_id`` and ``client_secret`` will be sent in the URL encoded request body.
	// This type should only be used when Auth server does not support Basic authentication.
	"URL_ENCODED_BODY"
