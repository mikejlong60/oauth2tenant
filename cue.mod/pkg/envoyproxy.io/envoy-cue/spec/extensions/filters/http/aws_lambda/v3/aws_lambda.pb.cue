// Code generated from envoy/extensions/filters/http/aws_lambda/v3/aws_lambda.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

// AWS Lambda filter config
// [#next-free-field: 7]
#Config: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.aws_lambda.v3.Config"

	// The ARN of the AWS Lambda to invoke when the filter is engaged
	// Must be in the following format:
	// arn:<partition>:lambda:<region>:<account-number>:function:<function-name>
	arn!: string & strings.MinRunes(1)

	// Whether to transform the request (headers and body) to a JSON payload or pass it as is.
	payload_passthrough?: bool

	// Determines the way to invoke the Lambda function.
	invocation_mode?: #Config_InvocationMode

	// Indicates that before signing headers, the host header will be swapped with
	// this value. If not set or empty, the original host header value
	// will be used and no rewrite will happen.
	//
	// .. note::
	//     This rewrite affects both signing and host header forwarding. However, this
	//     option shouldn't be used with
	//     :ref:`HCM host rewrite <envoy_v3_api_field_config.route.v3.RouteAction.host_rewrite_literal>` given that the
	//     value set here would be used for signing whereas the value set in the HCM would be used
	//     for host header forwarding which is not the desired outcome.
	//
	//     Changing the value of the host header can result in a different route to be selected
	//     if an HTTP filter after AWS lambda re-evaluates the route (clears route cache).
	host_rewrite?: string

	// Specifies the credentials profile to be used from the AWS credentials file.
	// This parameter is optional. If set, it will override the value set in the AWS_PROFILE env variable and
	// the provider chain is limited to the AWS credentials file Provider.
	// If credentials configuration is provided, this configuration will be ignored.
	// If this field is provided, then the default providers chain specified in the documentation will be ignored.
	// (See :ref:`default credentials providers <config_http_filters_aws_lambda_credentials>`).
	credentials_profile?: string

	// Specifies the credentials to be used. This parameter is optional and if it is set,
	// it will override other providers and will take precedence over credentials_profile.
	// The provider chain is limited to the configuration credentials provider.
	// If this field is provided, then the default providers chain specified in the documentation will be ignored.
	// (See :ref:`default credentials providers <config_http_filters_aws_lambda_credentials>`).
	//
	// .. warning::
	//   Distributing the AWS credentials via this configuration should not be done in production.
	credentials?: #Credentials
}

#Config_InvocationMode:
	// This is the more common mode of invocation, in which Lambda responds after it has completed the function. In
	// this mode the output of the Lambda function becomes the response of the HTTP request.
	"SYNCHRONOUS" |

	// In this mode Lambda responds immediately but continues to process the function asynchronously. This mode can be
	// used to signal events for example. In this mode, Lambda responds with an acknowledgment that it received the
	// call which is translated to an HTTP 200 OK by the filter.
	"ASYNCHRONOUS"

// AWS Lambda Credentials config.
#Credentials: {
	"@type": "type.googleapis.com/envoy.extensions.filters.http.aws_lambda.v3.Credentials"

	// AWS access key id.
	access_key_id!: string & strings.MinRunes(1)

	// AWS secret access key.
	secret_access_key!: string & strings.MinRunes(1)

	// AWS session token.
	// This parameter is optional. If it is set to empty string it will not be consider in the request.
	// It is required if temporary security credentials retrieved directly from AWS STS operations are used.
	session_token?: string
}

// Per-route configuration for AWS Lambda. This can be useful when invoking a different Lambda function or a different
// version of the same Lambda depending on the route.
#PerRouteConfig: {
	"@type":        "type.googleapis.com/envoy.extensions.filters.http.aws_lambda.v3.PerRouteConfig"
	invoke_config?: #Config
}
