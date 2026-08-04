// Code generated from envoy/config/core/v3/http_service.proto. DO NOT EDIT.
package v3

import (
	"list"
)

// HTTP service configuration.
#HttpService: {
	"@type": "type.googleapis.com/envoy.config.core.v3.HttpService"

	// The service's HTTP URI. For example:
	//
	// .. code-block:: yaml
	//
	//    http_uri:
	//      uri: https://www.myserviceapi.com/v1/data
	//      cluster: www.myserviceapi.com|443
	http_uri?: #HttpUri

	// Specifies a list of HTTP headers that should be added to each request
	// handled by this virtual host.
	request_headers_to_add?: [...#HeaderValueOption] & list.MaxItems(1000)
}
