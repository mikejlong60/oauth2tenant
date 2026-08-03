// Code generated from envoy/admin/v3/init_dump.proto. DO NOT EDIT.
package v3

#UnreadyTargetsDumps: {
	"@type": "type.googleapis.com/envoy.admin.v3.UnreadyTargetsDumps"
	unready_targets_dumps?: [...#UnreadyTargetsDumps_UnreadyTargetsDump]
}

#UnreadyTargetsDumps_UnreadyTargetsDump: {
	"@type": "type.googleapis.com/envoy.admin.v3.UnreadyTargetsDumps.UnreadyTargetsDump"
	name?:   string
	target_names?: [...string]
}
