// Code generated from envoy/type/http_status.proto. DO NOT EDIT.
package type

// HTTP status.
#HttpStatus: {
	"@type": "type.googleapis.com/envoy.type.HttpStatus"

	// Supplies HTTP response code.
	code?: #StatusCode
}

// HTTP response codes supported in Envoy.
// For more details: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
#StatusCode:
	// Empty - This code not part of the HTTP status code specification, but it is needed for proto
	// `enum` type.
	"Empty" |
	"Continue" |
	"OK" |
	"Created" |
	"Accepted" |
	"NonAuthoritativeInformation" |
	"NoContent" |
	"ResetContent" |
	"PartialContent" |
	"MultiStatus" |
	"AlreadyReported" |
	"IMUsed" |
	"MultipleChoices" |
	"MovedPermanently" |
	"Found" |
	"SeeOther" |
	"NotModified" |
	"UseProxy" |
	"TemporaryRedirect" |
	"PermanentRedirect" |
	"BadRequest" |
	"Unauthorized" |
	"PaymentRequired" |
	"Forbidden" |
	"NotFound" |
	"MethodNotAllowed" |
	"NotAcceptable" |
	"ProxyAuthenticationRequired" |
	"RequestTimeout" |
	"Conflict" |
	"Gone" |
	"LengthRequired" |
	"PreconditionFailed" |
	"PayloadTooLarge" |
	"URITooLong" |
	"UnsupportedMediaType" |
	"RangeNotSatisfiable" |
	"ExpectationFailed" |
	"MisdirectedRequest" |
	"UnprocessableEntity" |
	"Locked" |
	"FailedDependency" |
	"UpgradeRequired" |
	"PreconditionRequired" |
	"TooManyRequests" |
	"RequestHeaderFieldsTooLarge" |
	"InternalServerError" |
	"NotImplemented" |
	"BadGateway" |
	"ServiceUnavailable" |
	"GatewayTimeout" |
	"HTTPVersionNotSupported" |
	"VariantAlsoNegotiates" |
	"InsufficientStorage" |
	"LoopDetected" |
	"NotExtended" |
	"NetworkAuthenticationRequired"
