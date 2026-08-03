// Code generated from envoy/config/core/v3/http_uri.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#HttpUri: {
	"@type":  "type.googleapis.com/envoy.config.core.v3.HttpUri"
	uri!:     string & strings.MinRunes(1)
	cluster!: string & strings.MinRunes(1)
	timeout!: string // TODO(pgv): duration bounds
}
