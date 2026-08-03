// Code generated from envoy/extensions/filters/network/reverse_tunnel/v3/reverse_tunnel.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#Validation: {
	"@type":                     "type.googleapis.com/envoy.extensions.filters.network.reverse_tunnel.v3.Validation"
	node_id_format?:             string & strings.MaxRunes(1024)
	cluster_id_format?:          string & strings.MaxRunes(1024)
	emit_dynamic_metadata?:      bool
	dynamic_metadata_namespace?: string & strings.MaxRunes(255)
}

#ReverseTunnel: {
	"@type":                 "type.googleapis.com/envoy.extensions.filters.network.reverse_tunnel.v3.ReverseTunnel"
	ping_interval?:          string // TODO(pgv): duration bounds
	auto_close_connections?: bool
	request_path!:           string & strings.MinRunes(1) & strings.MaxRunes(255)
	request_method?:         v3_1.#RequestMethod
	validation?:             #Validation
	required_cluster_name?:  string & strings.MaxRunes(255)
}
