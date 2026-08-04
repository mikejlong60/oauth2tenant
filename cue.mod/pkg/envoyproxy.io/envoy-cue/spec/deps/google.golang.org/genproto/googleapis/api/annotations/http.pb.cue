// Code generated from google/api/http.proto. DO NOT EDIT.
package annotations

#Http: {
	"@type": "type.googleapis.com/google.api.Http"
	rules?: [...#HttpRule]
	fully_decode_reserved_expansion?: bool
}

#HttpRule: {
	"@type":        "type.googleapis.com/google.api.HttpRule"
	selector?:      string
	body?:          string
	response_body?: string
	additional_bindings?: [...#HttpRule]

	// oneof pattern: at most one may be set
	*{} |
	{get!: string} |
	{put!: string} |
	{post!: string} |
	{delete!: string} |
	{patch!: string} |
	{custom!: #CustomHttpPattern}
}

#CustomHttpPattern: {
	"@type": "type.googleapis.com/google.api.CustomHttpPattern"
	kind?:   string
	path?:   string
}
