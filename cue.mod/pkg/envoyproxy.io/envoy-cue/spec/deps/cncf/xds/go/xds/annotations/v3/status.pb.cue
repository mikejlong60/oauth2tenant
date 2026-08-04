// Code generated from xds/annotations/v3/status.proto. DO NOT EDIT.
package v3

#FileStatusAnnotation: {
	"@type": "type.googleapis.com/xds.annotations.v3.FileStatusAnnotation"

	// The entity is work-in-progress and subject to breaking changes.
	work_in_progress?: bool
}

#MessageStatusAnnotation: {
	"@type": "type.googleapis.com/xds.annotations.v3.MessageStatusAnnotation"

	// The entity is work-in-progress and subject to breaking changes.
	work_in_progress?: bool
}

#FieldStatusAnnotation: {
	"@type": "type.googleapis.com/xds.annotations.v3.FieldStatusAnnotation"

	// The entity is work-in-progress and subject to breaking changes.
	work_in_progress?: bool
}

#StatusAnnotation: {
	"@type": "type.googleapis.com/xds.annotations.v3.StatusAnnotation"

	// The entity is work-in-progress and subject to breaking changes.
	work_in_progress?: bool

	// The entity belongs to a package with the given version status.
	package_version_status?: #PackageVersionStatus
}

#PackageVersionStatus:
	// Unknown package version status.
	"UNKNOWN" |

	// This version of the package is frozen.
	"FROZEN" |

	// This version of the package is the active development version.
	"ACTIVE" |

	// This version of the package is the candidate for the next major version. It
	// is typically machine generated from the active development version.
	"NEXT_MAJOR_VERSION_CANDIDATE"
