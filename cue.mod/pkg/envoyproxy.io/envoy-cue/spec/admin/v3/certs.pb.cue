// Code generated from envoy/admin/v3/certs.proto. DO NOT EDIT.
package v3

#Certificates: {
	"@type": "type.googleapis.com/envoy.admin.v3.Certificates"
	certificates?: [...#Certificate]
}

#Certificate: {
	"@type": "type.googleapis.com/envoy.admin.v3.Certificate"
	ca_cert?: [...#CertificateDetails]
	cert_chain?: [...#CertificateDetails]
}

#CertificateDetails: {
	"@type":        "type.googleapis.com/envoy.admin.v3.CertificateDetails"
	path?:          string
	serial_number?: string
	subject_alt_names?: [...#SubjectAlternateName]
	days_until_expiration?: uint64
	valid_from?:            string
	expiration_time?:       string
	ocsp_details?:          #CertificateDetails_OcspDetails
}

#CertificateDetails_OcspDetails: {
	"@type":     "type.googleapis.com/envoy.admin.v3.CertificateDetails.OcspDetails"
	valid_from?: string
	expiration?: string
}

#SubjectAlternateName: {
	"@type": "type.googleapis.com/envoy.admin.v3.SubjectAlternateName"

	// oneof name: at most one may be set
	*{} |
	{dns!: string} |
	{uri!: string} |
	{ip_address!: string}
}
