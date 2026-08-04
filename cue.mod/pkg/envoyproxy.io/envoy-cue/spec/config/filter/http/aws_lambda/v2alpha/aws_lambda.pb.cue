// Code generated from envoy/config/filter/http/aws_lambda/v2alpha/aws_lambda.proto. DO NOT EDIT.
package v2alpha

import (
	"strings"
)

// AWS Lambda filter config
#Config: {
	"@type": "type.googleapis.com/envoy.config.filter.http.aws_lambda.v2alpha.Config"

	// The ARN of the AWS Lambda to invoke when the filter is engaged
	// Must be in the following format:
	// arn:<partition>:lambda:<region>:<account-number>:function:<function-name>
	arn!: string & strings.MinRunes(1)

	// Whether to transform the request (headers and body) to a JSON payload or pass it as is.
	payload_passthrough?: bool

	// Determines the way to invoke the Lambda function.
	invocation_mode?: #Config_InvocationMode
}

#Config_InvocationMode:
	// This is the more common mode of invocation, in which Lambda responds after it has completed the function. In
	// this mode the output of the Lambda function becomes the response of the HTTP request.
	"SYNCHRONOUS" |

	// In this mode Lambda responds immediately but continues to process the function asynchronously. This mode can be
	// used to signal events for example. In this mode, Lambda responds with an acknowledgment that it received the
	// call which is translated to an HTTP 200 OK by the filter.
	"ASYNCHRONOUS"

// Per-route configuration for AWS Lambda. This can be useful when invoking a different Lambda function or a different
// version of the same Lambda depending on the route.
#PerRouteConfig: {
	"@type":        "type.googleapis.com/envoy.config.filter.http.aws_lambda.v2alpha.PerRouteConfig"
	invoke_config?: #Config
}
