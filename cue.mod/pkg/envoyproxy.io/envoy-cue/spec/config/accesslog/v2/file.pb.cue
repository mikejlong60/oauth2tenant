// Code generated from envoy/config/accesslog/v2/file.proto. DO NOT EDIT.
package v2

#FileAccessLog: {
	"@type": "type.googleapis.com/envoy.config.accesslog.v2.FileAccessLog"
	path!:   string & !=""

	// oneof access_log_format: at most one may be set
	*{} |
	{format!: string} |
	{json_format!: {...}} |
	{typed_json_format!: {...}}
}
