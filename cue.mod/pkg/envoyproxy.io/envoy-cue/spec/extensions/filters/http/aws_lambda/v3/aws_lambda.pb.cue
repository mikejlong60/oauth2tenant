// Code generated from envoy/extensions/filters/http/aws_lambda/v3/aws_lambda.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#Config: {
	"@type":              "type.googleapis.com/envoy.extensions.filters.http.aws_lambda.v3.Config"
	arn!:                 string & strings.MinRunes(1)
	payload_passthrough?: bool
	invocation_mode?:     #Config_InvocationMode
	host_rewrite?:        string
	credentials_profile?: string
	credentials?:         #Credentials
}

#Config_InvocationMode: "SYNCHRONOUS" | "ASYNCHRONOUS"

#Credentials: {
	"@type":            "type.googleapis.com/envoy.extensions.filters.http.aws_lambda.v3.Credentials"
	access_key_id!:     string & strings.MinRunes(1)
	secret_access_key!: string & strings.MinRunes(1)
	session_token?:     string
}

#PerRouteConfig: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.http.aws_lambda.v3.PerRouteConfig"
	invoke_config?: #Config
}
