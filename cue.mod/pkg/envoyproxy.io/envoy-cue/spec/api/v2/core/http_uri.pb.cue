// Code generated from envoy/api/v2/core/http_uri.proto. DO NOT EDIT.
package core

#HttpUri: {
	"@type":  "type.googleapis.com/envoy.api.v2.core.HttpUri"
	uri!:     string & !=""
	timeout!: string // TODO(pgv): duration bounds

	// oneof http_upstream_type: exactly one must be set
	{cluster!: string & !=""}
}
