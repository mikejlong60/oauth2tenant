// Code generated from envoy/extensions/filters/http/oauth2/v3/oauth.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/tls/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

// OAuth cookie configuration attributes.
#CookieConfig: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.oauth2.v3.CookieConfig"

	// The value used for the SameSite cookie attribute.
	same_site?: #CookieConfig_SameSite

	// The path attribute for the cookie.
	//
	// This controls the scope of the cookie and is useful for path-based routing scenarios
	// where different logical boundaries or applications may operate with different OAuth2 clients.
	// The CSRF cookie (nonce cookie) can be configured with a different path than session cookies
	// to support flows where the callback URL is on a different path.
	//
	// If not specified, defaults to ``/``.
	path?: string // TODO(pgv): string.pattern

	// If true, the ``Partitioned`` attribute will be set on the cookie.
	//
	// Modern browsers (Firefox, Chrome with third-party cookie deprecation) warn or block
	// "foreign" cookies unless they carry the ``Partitioned`` attribute alongside ``SameSite=None; Secure``.
	// When Envoy is used in a gateway/IdP flow that sets OAuth/OIDC cookies for a parent domain
	// (e.g., ``Domain=.example.com``) while running on a different host, those cookies are
	// considered third-party and will be rejected without ``Partitioned``.
	//
	// See `CHIPS <https://developers.google.com/privacy-sandbox/3pcd/chips>`_ for more information.
	//
	// Default is false.
	partitioned?: bool
}

#CookieConfig_SameSite: "DISABLED" | "STRICT" | "LAX" | "NONE"

// [#next-free-field: 8]
#CookieConfigs: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.oauth2.v3.CookieConfigs"

	// Configuration for the bearer token cookie.
	bearer_token_cookie_config?: #CookieConfig

	// Configuration for the OAuth HMAC cookie.
	oauth_hmac_cookie_config?: #CookieConfig

	// Configuration for the OAuth expires cookie.
	oauth_expires_cookie_config?: #CookieConfig

	// Configuration for the ID token cookie.
	id_token_cookie_config?: #CookieConfig

	// Configuration for the refresh token cookie.
	refresh_token_cookie_config?: #CookieConfig

	// Configuration for the OAuth nonce cookie.
	oauth_nonce_cookie_config?: #CookieConfig

	// Configuration for the code verifier cookie.
	code_verifier_cookie_config?: #CookieConfig
}

// [#next-free-field: 6]
#OAuth2Credentials: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.oauth2.v3.OAuth2Credentials"

	// The client_id to be used in the authorize calls. This value will be URL encoded when sent to the OAuth server.
	client_id!: string & strings.MinRunes(1)

	// The secret used to retrieve the access token. This value will be URL encoded when sent to the OAuth server.
	token_secret!: v3_1.#SdsSecretConfig

	// The cookie names used in OAuth filters flow.
	cookie_names?: #OAuth2Credentials_CookieNames

	// The domain to set the cookie on. If not set, the cookie will default to the host of the request, not including the subdomains.
	// This is useful when token cookies need to be shared across multiple subdomains.
	cookie_domain?: string // TODO(pgv): string.pattern

	// Configures how the secret token should be created.
	// oneof token_formation: exactly one must be set
	// If present, the secret token will be a HMAC using the provided secret.
	{hmac_secret!: v3_1.#SdsSecretConfig}
}

// [#next-free-field: 8]
#OAuth2Credentials_CookieNames: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.oauth2.v3.OAuth2Credentials.CookieNames"

	// Cookie name to hold OAuth bearer token value. When the authentication server validates the
	// client and returns an authorization token back to the OAuth filter, no matter what format
	// that token is, if :ref:`forward_bearer_token <envoy_v3_api_field_extensions.filters.http.oauth2.v3.OAuth2Config.forward_bearer_token>`
	// is set to true the filter will send over the bearer token as a cookie with this name to the
	// upstream. Defaults to ``BearerToken``.
	bearer_token?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// Cookie name to hold OAuth HMAC value. Defaults to ``OauthHMAC``.
	oauth_hmac?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// Cookie name to hold OAuth expiry value. Defaults to ``OauthExpires``.
	oauth_expires?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// Cookie name to hold the id token. Defaults to ``IdToken``.
	id_token?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// Cookie name to hold the refresh token. Defaults to ``RefreshToken``.
	refresh_token?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// Cookie name to hold the nonce value. Defaults to ``OauthNonce``.
	oauth_nonce?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex

	// Cookie name to hold the PKCE code verifier. Defaults to ``OauthCodeVerifier``.
	code_verifier?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

// OAuth config
//
// [#next-free-field: 27]
#OAuth2Config: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.oauth2.v3.OAuth2Config"

	// Endpoint on the authorization server to retrieve the access token from.
	token_endpoint?: v3_2.#HttpUri

	// Specifies the retry policy for requests to the OAuth server. If not specified, then no retries will be performed.
	retry_policy?: v3_2.#RetryPolicy

	// The endpoint redirect to for authorization in response to unauthorized requests.
	authorization_endpoint!: string & strings.MinRunes(1)

	// The endpoint at the authorization server to request the user be logged out of the Authorization server.
	// This field is optional and should be set only if openid is in the auth_scopes and the authorization server
	// supports the OpenID Connect RP-Initiated Logout specification.
	// For more information, see https://openid.net/specs/openid-connect-rpinitiated-1_0.html
	//
	// If configured, the OAuth2 filter will redirect users to this endpoint when they access the signout_path.
	end_session_endpoint?: string

	// Credentials used for OAuth.
	credentials!: #OAuth2Credentials

	// The redirect URI passed to the authorization endpoint. Supports header formatting
	// tokens. For more information, including details on header value syntax, see the
	// documentation on :ref:`custom request headers <config_http_conn_man_headers_custom_request_headers>`.
	//
	// This URI should not contain any query parameters.
	redirect_uri!: string & strings.MinRunes(1)

	// Matching criteria used to determine whether a path appears to be the result of a redirect from the authorization server.
	redirect_path_matcher!: v3_3.#PathMatcher

	// The path to sign a user out, clearing their credential cookies.
	signout_path!: v3_3.#PathMatcher

	// Forward the OAuth token as a Bearer to upstream web service.
	forward_bearer_token?: bool

	// If set to true, preserve the existing authorization header.
	// By default the client strips the existing authorization header before forwarding upstream.
	// Can not be set to true if forward_bearer_token is already set to true.
	// Default value is false.
	preserve_authorization_header?: bool

	// Any request that matches any of the provided matchers will be passed through without OAuth validation.
	pass_through_matcher?: [...v3_4.#HeaderMatcher]

	// Optional list of OAuth scopes to be claimed in the authorization request. If not specified,
	// defaults to "user" scope.
	// OAuth RFC https://tools.ietf.org/html/rfc6749#section-3.3
	auth_scopes?: [...string]

	// Optional resource parameter for authorization request
	// RFC: https://tools.ietf.org/html/rfc8707
	resources?: [...string]

	// Defines how ``client_id`` and ``client_secret`` are sent in OAuth client to OAuth server requests.
	// RFC https://datatracker.ietf.org/doc/html/rfc6749#section-2.3.1
	auth_type?: #OAuth2Config_AuthType

	// If set to true, allows automatic access token refresh using the associated refresh token (see
	// `RFC 6749 section 6 <https://datatracker.ietf.org/doc/html/rfc6749#section-6>`_), provided that the OAuth server supports that.
	// Default value is true.
	use_refresh_token?: bool

	// The default lifetime in seconds of the access token, if omitted by the authorization server.
	//
	// If this value is not set, it will default to ``0s``. In this case, the expiry must be set by
	// the authorization server or the OAuth flow will fail.
	default_expires_in?: string

	// Any request that matches any of the provided matchers won't be redirected to OAuth server when tokens are not valid.
	// Automatic access token refresh will be performed for these requests, if enabled.
	// This behavior can be useful for AJAX requests.
	deny_redirect_matcher?: [...v3_4.#HeaderMatcher]

	// The default lifetime in seconds of the refresh token, if the exp (expiration time) claim is omitted in the refresh token or the refresh token is not JWT.
	//
	// If this value is not set, it will default to ``604800s``. In this case, the cookie with the refresh token will be expired
	// in a week.
	// This setting is only considered if ``use_refresh_token`` is set to true, otherwise the authorization server expiration or ``default_expires_in`` is used.
	default_refresh_token_expires_in?: string

	// If set to true, the client will not set a cookie for ID Token even if one is received from the Identity Provider. This may be useful in cases where the ID
	// Token is too large for HTTP cookies (longer than 4096 characters). Enabling this option will only disable setting the cookie response header, the filter
	// will still process incoming ID Tokens as part of the HMAC if they are there. This is to ensure compatibility while switching this setting on. Future
	// sessions would not set the IdToken cookie header.
	disable_id_token_set_cookie?: bool

	// If set to true, the client will not set a cookie for Access Token even if one is received from the Identity Provider.
	// Enabling this option will only disable setting the cookie response header, the filter
	// will still process incoming Access Tokens as part of the HMAC if they are there. This is to ensure compatibility while switching this setting on. Future
	// sessions would not set the Access Token cookie header.
	disable_access_token_set_cookie?: bool

	// If set to true, the client will not set a cookie for Refresh Token even if one is received from the Identity Provider.
	// Enabling this option will only disable setting the cookie response header, the filter
	// will still process incoming Refresh Tokens as part of the HMAC if they are there. This is to ensure compatibility while switching this setting on. Future
	// sessions would not set the Refresh Token cookie header.
	disable_refresh_token_set_cookie?: bool

	// Controls for attributes that can be set on the cookies.
	cookie_configs?: #CookieConfigs

	// Optional additional prefix to use when emitting statistics.
	stat_prefix?: string

	// Optional expiration time for the CSRF protection token cookie.
	// The CSRF token prevents cross-site request forgery attacks during the OAuth2 flow.
	// If not specified, defaults to ``600s`` (10 minutes), which should provide sufficient time
	// for users to complete the OAuth2 authorization flow.
	csrf_token_expires_in?: string

	// Optional expiration time for the code verifier cookie.
	// The code verifier is stored in a secure, HTTP-only cookie during the OAuth2 authorization process.
	// If not specified, defaults to ``600s`` (10 minutes), which should provide sufficient time
	// for users to complete the OAuth2 authorization flow.
	code_verifier_token_expires_in?: string

	// Disable token encryption. When set to true, both the access token and the ID token will be stored in plain text.
	// This option should only be used in secure environments where token encryption is not required.
	// Default is false (tokens are encrypted).
	disable_token_encryption?: bool
}

#OAuth2Config_AuthType:
	// The ``client_id`` and ``client_secret`` will be sent in the URL encoded request body.
	// This type should only be used when Auth server does not support Basic authentication.
	"URL_ENCODED_BODY" |

	// The ``client_id`` and ``client_secret`` will be sent using HTTP Basic authentication scheme.
	"BASIC_AUTH"

// Filter config.
#OAuth2: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.oauth2.v3.OAuth2"

	// Leave this empty to disable OAuth2 for a specific route, using per filter config.
	config?: #OAuth2Config
}
