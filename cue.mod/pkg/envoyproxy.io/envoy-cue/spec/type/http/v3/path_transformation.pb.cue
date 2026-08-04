// Code generated from envoy/type/http/v3/path_transformation.proto. DO NOT EDIT.
package v3

#PathTransformation: {
	"@type": "type.googleapis.com/envoy.type.http.v3.PathTransformation"
	operations?: [...#PathTransformation_Operation]
}

#PathTransformation_Operation: {
	"@type": "type.googleapis.com/envoy.type.http.v3.PathTransformation.Operation"

	// oneof operation_specifier: exactly one must be set
	{normalize_path_rfc_3986!: #PathTransformation_Operation_NormalizePathRFC3986} |
	{merge_slashes!: #PathTransformation_Operation_MergeSlashes}
}

#PathTransformation_Operation_NormalizePathRFC3986: {
	"@type": "type.googleapis.com/envoy.type.http.v3.PathTransformation.Operation.NormalizePathRFC3986"
}

#PathTransformation_Operation_MergeSlashes: {
	"@type": "type.googleapis.com/envoy.type.http.v3.PathTransformation.Operation.MergeSlashes"
}
