// Code generated from envoy/extensions/dynamic_modules/v3/dynamic_modules.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#DynamicModuleConfig: {
	"@type":        "type.googleapis.com/envoy.extensions.dynamic_modules.v3.DynamicModuleConfig"
	name!:          string & strings.MinRunes(1)
	do_not_close?:  bool
	load_globally?: bool
}
