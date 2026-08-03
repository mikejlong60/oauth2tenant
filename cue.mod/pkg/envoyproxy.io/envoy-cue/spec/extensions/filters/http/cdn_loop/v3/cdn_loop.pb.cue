// Code generated from envoy/extensions/filters/http/cdn_loop/v3/cdn_loop.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#CdnLoopConfig: {
	"@type":                  "type.googleapis.com/envoy.extensions.filters.http.cdn_loop.v3.CdnLoopConfig"
	cdn_id!:                  string & strings.MinRunes(1)
	max_allowed_occurrences?: uint32
}
