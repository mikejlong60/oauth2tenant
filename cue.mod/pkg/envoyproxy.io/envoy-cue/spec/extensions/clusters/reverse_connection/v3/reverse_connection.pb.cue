// Code generated from envoy/extensions/clusters/reverse_connection/v3/reverse_connection.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#ReverseConnectionClusterConfig: {
	"@type":           "type.googleapis.com/envoy.extensions.clusters.reverse_connection.v3.ReverseConnectionClusterConfig"
	cleanup_interval?: string // TODO(pgv): duration bounds
	host_id_format!:   string & strings.MinRunes(1)
}
