// Code generated from envoy/config/core/v3/http_service.proto. DO NOT EDIT.
package v3

import (
	"list"
)

#HttpService: {
	"@type":   "type.googleapis.com/envoy.config.core.v3.HttpService"
	http_uri?: #HttpUri
	request_headers_to_add?: [...#HeaderValueOption] & list.MaxItems(1000)
}
