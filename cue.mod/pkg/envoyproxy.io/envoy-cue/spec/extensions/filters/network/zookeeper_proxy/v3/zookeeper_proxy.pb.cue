// Code generated from envoy/extensions/filters/network/zookeeper_proxy/v3/zookeeper_proxy.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#ZooKeeperProxy: {
	"@type":                           "type.googleapis.com/envoy.extensions.filters.network.zookeeper_proxy.v3.ZooKeeperProxy"
	stat_prefix!:                      string & strings.MinRunes(1)
	access_log?:                       string
	max_packet_bytes?:                 uint32
	enable_latency_threshold_metrics?: bool
	default_latency_threshold?:        string // TODO(pgv): duration bounds
	latency_threshold_overrides?: [...#LatencyThresholdOverride]
	enable_per_opcode_request_bytes_metrics?:  bool
	enable_per_opcode_response_bytes_metrics?: bool
	enable_per_opcode_decoder_error_metrics?:  bool
}

#LatencyThresholdOverride: {
	"@type":    "type.googleapis.com/envoy.extensions.filters.network.zookeeper_proxy.v3.LatencyThresholdOverride"
	opcode?:    #LatencyThresholdOverride_Opcode
	threshold!: string // TODO(pgv): duration bounds
}

#LatencyThresholdOverride_Opcode: "Connect" | "Create" | "Delete" | "Exists" | "GetData" | "SetData" | "GetAcl" | "SetAcl" | "GetChildren" | "Sync" | "Ping" | "GetChildren2" | "Check" | "Multi" | "Create2" | "Reconfig" | "CheckWatches" | "RemoveWatches" | "CreateContainer" | "CreateTtl" | "Close" | "SetAuth" | "SetWatches" | "GetEphemerals" | "GetAllChildrenNumber" | "SetWatches2" | "AddWatch"
