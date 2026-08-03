// Code generated from envoy/extensions/path/match/uri_template/v3/uri_template_match.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#UriTemplateMatchConfig: {
	"@type":        "type.googleapis.com/envoy.extensions.path.match.uri_template.v3.UriTemplateMatchConfig"
	path_template!: string & strings.MinRunes(1) & strings.MaxRunes(256)
}
