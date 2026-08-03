// Code generated from envoy/extensions/watchdog/profile_action/v3/profile_action.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#ProfileActionConfig: {
	"@type":           "type.googleapis.com/envoy.extensions.watchdog.profile_action.v3.ProfileActionConfig"
	profile_duration?: string
	profile_path!:     string & strings.MinRunes(1)
	max_profiles?:     uint64
}
