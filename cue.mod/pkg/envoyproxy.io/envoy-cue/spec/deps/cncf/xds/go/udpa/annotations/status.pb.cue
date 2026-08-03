// Code generated from udpa/annotations/status.proto. DO NOT EDIT.
package annotations

#StatusAnnotation: {
	"@type":                 "type.googleapis.com/udpa.annotations.StatusAnnotation"
	work_in_progress?:       bool
	package_version_status?: #PackageVersionStatus
}

#PackageVersionStatus: "UNKNOWN" | "FROZEN" | "ACTIVE" | "NEXT_MAJOR_VERSION_CANDIDATE"
