// Code generated from envoy/admin/v2alpha/certs.proto. DO NOT EDIT.
package v2alpha

#Certificates: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.Certificates"
	certificates?: [...#Certificate]
}

#Certificate: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.Certificate"
	ca_cert?: [...#CertificateDetails]
	cert_chain?: [...#CertificateDetails]
}

#CertificateDetails: {
	"@type":        "type.googleapis.com/envoy.admin.v2alpha.CertificateDetails"
	path?:          string
	serial_number?: string
	subject_alt_names?: [...#SubjectAlternateName]
	days_until_expiration?: uint64
	valid_from?:            string
	expiration_time?:       string
}

#SubjectAlternateName: {
	"@type": "type.googleapis.com/envoy.admin.v2alpha.SubjectAlternateName"

	// oneof name: at most one may be set
	*{} |
	{dns!: string} |
	{uri!: string} |
	{ip_address!: string}
}
