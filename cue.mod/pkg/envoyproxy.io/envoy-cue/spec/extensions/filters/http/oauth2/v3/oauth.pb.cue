// Code generated from envoy/extensions/filters/http/oauth2/v3/oauth.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/extensions/transport_sockets/tls/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_4 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

#CookieConfig: {
	"@type":      "type.googleapis.com/envoy.extensions.filters.http.oauth2.v3.CookieConfig"
	same_site?:   #CookieConfig_SameSite
	path?:        string // TODO(pgv): string.pattern
	partitioned?: bool
}

#CookieConfig_SameSite: "DISABLED" | "STRICT" | "LAX" | "NONE"

#CookieConfigs: {
	"@type":                      "type.googleapis.com/envoy.extensions.filters.http.oauth2.v3.CookieConfigs"
	bearer_token_cookie_config?:  #CookieConfig
	oauth_hmac_cookie_config?:    #CookieConfig
	oauth_expires_cookie_config?: #CookieConfig
	id_token_cookie_config?:      #CookieConfig
	refresh_token_cookie_config?: #CookieConfig
	oauth_nonce_cookie_config?:   #CookieConfig
	code_verifier_cookie_config?: #CookieConfig
}

#OAuth2Credentials: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.http.oauth2.v3.OAuth2Credentials"
	client_id!:     string & strings.MinRunes(1)
	token_secret!:  v3_1.#SdsSecretConfig
	hmac_secret!:   v3_1.#SdsSecretConfig
	cookie_names?:  #OAuth2Credentials_CookieNames
	cookie_domain?: string // TODO(pgv): string.pattern
}

#OAuth2Credentials_CookieNames: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.http.oauth2.v3.OAuth2Credentials.CookieNames"
	bearer_token?:  string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	oauth_hmac?:    string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	oauth_expires?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	id_token?:      string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	refresh_token?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	oauth_nonce?:   string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
	code_verifier?: string // TODO(pgv): string well-known *validate.StringRules_WellKnownRegex
}

#OAuth2Config: {
	"@type":                        "type.googleapis.com/envoy.extensions.filters.http.oauth2.v3.OAuth2Config"
	token_endpoint?:                v3_2.#HttpUri
	retry_policy?:                  v3_2.#RetryPolicy
	authorization_endpoint!:        string & strings.MinRunes(1)
	end_session_endpoint?:          string
	credentials!:                   #OAuth2Credentials
	redirect_uri!:                  string & strings.MinRunes(1)
	redirect_path_matcher!:         v3_3.#PathMatcher
	signout_path!:                  v3_3.#PathMatcher
	forward_bearer_token?:          bool
	preserve_authorization_header?: bool
	pass_through_matcher?: [...v3_4.#HeaderMatcher]
	auth_scopes?: [...string]
	resources?: [...string]
	auth_type?:          #OAuth2Config_AuthType
	use_refresh_token?:  bool
	default_expires_in?: string
	deny_redirect_matcher?: [...v3_4.#HeaderMatcher]
	default_refresh_token_expires_in?: string
	disable_id_token_set_cookie?:      bool
	disable_access_token_set_cookie?:  bool
	disable_refresh_token_set_cookie?: bool
	cookie_configs?:                   #CookieConfigs
	stat_prefix?:                      string
	csrf_token_expires_in?:            string
	code_verifier_token_expires_in?:   string
	disable_token_encryption?:         bool
}

#OAuth2Config_AuthType: "URL_ENCODED_BODY" | "BASIC_AUTH"

#OAuth2: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.oauth2.v3.OAuth2"
	config?: #OAuth2Config
}
