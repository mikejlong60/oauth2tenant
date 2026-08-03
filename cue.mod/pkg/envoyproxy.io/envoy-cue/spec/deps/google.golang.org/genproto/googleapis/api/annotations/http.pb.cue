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
	get?:           string
	put?:           string
	post?:          string
	delete?:        string
	patch?:         string
	custom?:        #CustomHttpPattern
	body?:          string
	response_body?: string
	additional_bindings?: [...#HttpRule]
}

#CustomHttpPattern: {
	"@type": "type.googleapis.com/google.api.CustomHttpPattern"
	kind?:   string
	path?:   string
}
