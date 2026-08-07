package policies

// The following objects can be used as variables when building out
// the URI's for ease of changing providers at a later date.
_clientId:         "edge"
_oauth2_host:      "172.18.0.5"
_oauth2_host_port: 443
_realm:            "professional-services"
_edge_host:        "172.18.0.2:10909"

OAuthProvider: {
    authorization_endpoint: "https://\(_oauth2_host)/realms/professional-services/protocol/openid-connect/auth"
    token_endpoint: {
        uri:     "https://\(_oauth2_host)/realms/professional-services/protocol/openid-connect/token"
        timeout: "5s"
        cluster: "oauth2"
    }
    credentials: {
        client_id: _clientId
        token_secret: {
            name: "oauth-client-secret"
            sds_config: {
                path_config_source: {
                    path: "/etc/proxy/tls/oauth2/token.yaml"
                    watched_directory: {
                        "@type": "type.googleapis.com/envoy.config.core.v3.WatchedDirectory"
                        path:    "/etc/proxy/tls/oauth2"
                    }
                }
            }
        }
        hmac_secret: {
            name: "oauth-hmac-secret"
            sds_config: {
                path_config_source: {
                    path: "/etc/proxy/tls/oauth2/hmac.yaml"
                    watched_directory: {
                        "@type": "type.googleapis.com/envoy.config.core.v3.WatchedDirectory"
                        path:    "/etc/proxy/tls/oauth2"
                    }
                }
            }
        }
    }
    redirect_uri: "https://\(_edge_host)/oauth"
    redirect_path_matcher: {
        path: {
            exact: "/oauth"
        }
    }
    signout_path: {
        path: {
            exact: "/signout"
        }
    }
    forward_bearer_token: true
    auth_type:            "URL_ENCODED_BODY"
    auth_scopes: ["openid"]
}

JWKSProvider: {
    providers: oauth2: {
        issuer: "https://\(_oauth2_host)/realms/professional-services" // remove the globals.globals.custom.oauth2_host_port  if using the standard https port
        audiences: [_clientId]
        remote_jwks: http_uri: {
            uri:     "https://\(_oauth2_host)/realms/professional-services/protocol/openid-connect/certs"
            timeout: "5s"
            cluster: "oauth2"
        }
        forward: true
    }
    rules: [{
        match: path:             "/"
        requires: provider_name: "oauth2"
    }]
}