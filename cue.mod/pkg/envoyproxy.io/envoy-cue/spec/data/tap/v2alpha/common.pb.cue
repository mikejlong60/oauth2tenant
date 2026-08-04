// Code generated from envoy/data/tap/v2alpha/common.proto. DO NOT EDIT.
package v2alpha

#Body: {
	"@type":    "type.googleapis.com/envoy.data.tap.v2alpha.Body"
	truncated?: bool

	// oneof body_type: at most one may be set
	*{} |
	{as_bytes!: bytes} |
	{as_string!: string}
}
