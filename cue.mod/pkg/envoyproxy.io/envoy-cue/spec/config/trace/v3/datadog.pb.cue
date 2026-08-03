// Code generated from envoy/config/trace/v3/datadog.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#DatadogRemoteConfig: {
	"@type":           "type.googleapis.com/envoy.config.trace.v3.DatadogRemoteConfig"
	polling_interval?: string
}

#DatadogConfig: {
	"@type":             "type.googleapis.com/envoy.config.trace.v3.DatadogConfig"
	collector_cluster!:  string & strings.MinRunes(1)
	service_name!:       string & strings.MinRunes(1)
	collector_hostname?: string
	remote_config?:      #DatadogRemoteConfig
}
