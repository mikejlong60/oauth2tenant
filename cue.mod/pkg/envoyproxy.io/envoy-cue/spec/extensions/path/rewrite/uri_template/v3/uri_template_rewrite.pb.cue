// Code generated from envoy/extensions/path/rewrite/uri_template/v3/uri_template_rewrite.proto. DO NOT EDIT.
package v3

import (
	"strings"
)

#UriTemplateRewriteConfig: {
	"@type":                "type.googleapis.com/envoy.extensions.path.rewrite.uri_template.v3.UriTemplateRewriteConfig"
	path_template_rewrite!: string & strings.MinRunes(1) & strings.MaxRunes(256)
}
