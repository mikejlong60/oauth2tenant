package v2

// Greymatter Audits Filter Configuration
#GreymatterAuditsConfig: {
	// Required: topic for audit events
	topic:   string
	version: "v2"

	// Payload emission configuration
	payloadEmission?: {
		emitFullPayload?: bool
		base64Encode?:    bool
		maxBufferSize?:   string
	}

	// Rolling file configuration for file-based emitters (optional)
	rollingFileConfig?: {
		fileName?:       string
		maxFileSize?:    int
		maxFileBackups?: int
		maxAgeInDays?:   int
		compressFile?:   bool
	}

	// msTimestampEnabled enables milliseconds timestamp to allow better resolution for audit logs.
	// Default is true.
	msTimestampEnabled?: bool

	// OpenSearch emitter configuration (optional)
	opensearch?: {
		index: string
		servers: [...string]
		username: string
		password: string
	}
}
