// Code generated from envoy/admin/v3/server_info.proto. DO NOT EDIT.
package v3

import (
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#ServerInfo: {
	"@type":               "type.googleapis.com/envoy.admin.v3.ServerInfo"
	version?:              string
	state?:                #ServerInfo_State
	uptime_current_epoch?: string
	uptime_all_epochs?:    string
	hot_restart_version?:  string
	command_line_options?: #CommandLineOptions
	node?:                 v3_1.#Node
}

#ServerInfo_State: "LIVE" | "DRAINING" | "PRE_INITIALIZING" | "INITIALIZING"

#CommandLineOptions: {
	"@type":                        "type.googleapis.com/envoy.admin.v3.CommandLineOptions"
	base_id?:                       uint64
	use_dynamic_base_id?:           bool
	skip_hot_restart_on_no_parent?: bool
	skip_hot_restart_parent_stats?: bool
	base_id_path?:                  string
	concurrency?:                   uint32
	config_path?:                   string
	config_yaml?:                   string
	allow_unknown_static_fields?:   bool
	reject_unknown_dynamic_fields?: bool
	ignore_unknown_dynamic_fields?: bool
	skip_deprecated_logs?:          bool
	admin_address_path?:            string
	local_address_ip_version?:      #CommandLineOptions_IpVersion
	log_level?:                     string
	component_log_level?:           string
	log_format?:                    string
	log_format_escaped?:            bool
	log_path?:                      string
	service_cluster?:               string
	service_node?:                  string
	service_zone?:                  string
	file_flush_interval?:           string
	file_flush_min_size?:           uint32
	drain_time?:                    string
	drain_strategy?:                #CommandLineOptions_DrainStrategy
	parent_shutdown_time?:          string
	mode?:                          #CommandLineOptions_Mode
	disable_hot_restart?:           bool
	enable_mutex_tracing?:          bool
	restart_epoch?:                 uint32
	cpuset_threads?:                bool
	disabled_extensions?: [...string]
	enable_fine_grain_logging?: bool
	socket_path?:               string
	socket_mode?:               uint32
	enable_core_dump?:          bool
	stats_tag?: [...string]
}

#CommandLineOptions_IpVersion: "v4" | "v6"

#CommandLineOptions_Mode: "Serve" | "Validate" | "InitOnly"

#CommandLineOptions_DrainStrategy: "Gradual" | "Immediate"
