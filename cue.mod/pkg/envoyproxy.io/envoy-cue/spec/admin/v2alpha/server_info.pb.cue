// Code generated from envoy/admin/v2alpha/server_info.proto. DO NOT EDIT.
package v2alpha

#ServerInfo: {
	"@type":               "type.googleapis.com/envoy.admin.v2alpha.ServerInfo"
	version?:              string
	state?:                #ServerInfo_State
	uptime_current_epoch?: string
	uptime_all_epochs?:    string
	hot_restart_version?:  string
	command_line_options?: #CommandLineOptions
}

#ServerInfo_State: "LIVE" | "DRAINING" | "PRE_INITIALIZING" | "INITIALIZING"

#CommandLineOptions: {
	"@type":                        "type.googleapis.com/envoy.admin.v2alpha.CommandLineOptions"
	base_id?:                       uint64
	concurrency?:                   uint32
	config_path?:                   string
	config_yaml?:                   string
	allow_unknown_static_fields?:   bool
	reject_unknown_dynamic_fields?: bool
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
	drain_time?:                    string
	parent_shutdown_time?:          string
	mode?:                          #CommandLineOptions_Mode
	max_stats?:                     uint64
	max_obj_name_len?:              uint64
	disable_hot_restart?:           bool
	enable_mutex_tracing?:          bool
	restart_epoch?:                 uint32
	cpuset_threads?:                bool
	disabled_extensions?: [...string]
}

#CommandLineOptions_IpVersion: "v4" | "v6"

#CommandLineOptions_Mode: "Serve" | "Validate" | "InitOnly"
