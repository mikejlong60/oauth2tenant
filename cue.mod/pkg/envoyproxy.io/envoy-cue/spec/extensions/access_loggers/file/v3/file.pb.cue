// Code generated from envoy/extensions/access_loggers/file/v3/file.proto. DO NOT EDIT.
package v3

import (
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
)

#FileAccessLog: {
	"@type": "type.googleapis.com/envoy.extensions.access_loggers.file.v3.FileAccessLog"
	path!:   string & strings.MinRunes(1)
	format?: string
	json_format?: {...}
	typed_json_format?: {...}
	log_format!: v3_1.#SubstitutionFormatString
}
