// Code generated from envoy/config/filter/http/aws_lambda/v2alpha/aws_lambda.proto. DO NOT EDIT.
package v2alpha

import (
	"strings"
)

#Config: {
	"@type":              "type.googleapis.com/envoy.config.filter.http.aws_lambda.v2alpha.Config"
	arn!:                 string & strings.MinRunes(1)
	payload_passthrough?: bool
	invocation_mode?:     #Config_InvocationMode
}

#Config_InvocationMode: "SYNCHRONOUS" | "ASYNCHRONOUS"

#PerRouteConfig: {
	"@type":        "type.googleapis.com/envoy.config.filter.http.aws_lambda.v2alpha.PerRouteConfig"
	invoke_config?: #Config
}
