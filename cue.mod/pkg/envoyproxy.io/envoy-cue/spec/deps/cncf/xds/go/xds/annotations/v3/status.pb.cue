// Code generated from xds/annotations/v3/status.proto. DO NOT EDIT.
package v3

#FileStatusAnnotation: {
	"@type":           "type.googleapis.com/xds.annotations.v3.FileStatusAnnotation"
	work_in_progress?: bool
}

#MessageStatusAnnotation: {
	"@type":           "type.googleapis.com/xds.annotations.v3.MessageStatusAnnotation"
	work_in_progress?: bool
}

#FieldStatusAnnotation: {
	"@type":           "type.googleapis.com/xds.annotations.v3.FieldStatusAnnotation"
	work_in_progress?: bool
}

#StatusAnnotation: {
	"@type":                 "type.googleapis.com/xds.annotations.v3.StatusAnnotation"
	work_in_progress?:       bool
	package_version_status?: #PackageVersionStatus
}

#PackageVersionStatus: "UNKNOWN" | "FROZEN" | "ACTIVE" | "NEXT_MAJOR_VERSION_CANDIDATE"
