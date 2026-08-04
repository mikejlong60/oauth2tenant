// Code generated from envoy/type/v3/http_status.proto. DO NOT EDIT.
package v3

// HTTP status.
#HttpStatus: {
	"@type": "type.googleapis.com/envoy.type.v3.HttpStatus"

	// Supplies HTTP response code.
	code?: #StatusCode
}

// HTTP response codes supported in Envoy.
// For more details: https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
#StatusCode:
	// Empty - This code not part of the HTTP status code specification, but it is needed for proto
	// `enum` type.
	"Empty" |

	// Continue - ``100`` status code.
	"Continue" |

	// OK - ``200`` status code.
	"OK" |

	// Created - ``201`` status code.
	"Created" |

	// Accepted - ``202`` status code.
	"Accepted" |

	// NonAuthoritativeInformation - ``203`` status code.
	"NonAuthoritativeInformation" |

	// NoContent - ``204`` status code.
	"NoContent" |

	// ResetContent - ``205`` status code.
	"ResetContent" |

	// PartialContent - ``206`` status code.
	"PartialContent" |

	// MultiStatus - ``207`` status code.
	"MultiStatus" |

	// AlreadyReported - ``208`` status code.
	"AlreadyReported" |

	// IMUsed - ``226`` status code.
	"IMUsed" |

	// MultipleChoices - ``300`` status code.
	"MultipleChoices" |

	// MovedPermanently - ``301`` status code.
	"MovedPermanently" |

	// Found - ``302`` status code.
	"Found" |

	// SeeOther - ``303`` status code.
	"SeeOther" |

	// NotModified - ``304`` status code.
	"NotModified" |

	// UseProxy - ``305`` status code.
	"UseProxy" |

	// TemporaryRedirect - ``307`` status code.
	"TemporaryRedirect" |

	// PermanentRedirect - ``308`` status code.
	"PermanentRedirect" |

	// BadRequest - ``400`` status code.
	"BadRequest" |

	// Unauthorized - ``401`` status code.
	"Unauthorized" |

	// PaymentRequired - ``402`` status code.
	"PaymentRequired" |

	// Forbidden - ``403`` status code.
	"Forbidden" |

	// NotFound - ``404`` status code.
	"NotFound" |

	// MethodNotAllowed - ``405`` status code.
	"MethodNotAllowed" |

	// NotAcceptable - ``406`` status code.
	"NotAcceptable" |

	// ProxyAuthenticationRequired - ``407`` status code.
	"ProxyAuthenticationRequired" |

	// RequestTimeout - ``408`` status code.
	"RequestTimeout" |

	// Conflict - ``409`` status code.
	"Conflict" |

	// Gone - ``410`` status code.
	"Gone" |

	// LengthRequired - ``411`` status code.
	"LengthRequired" |

	// PreconditionFailed - ``412`` status code.
	"PreconditionFailed" |

	// PayloadTooLarge - ``413`` status code.
	"PayloadTooLarge" |

	// URITooLong - ``414`` status code.
	"URITooLong" |

	// UnsupportedMediaType - ``415`` status code.
	"UnsupportedMediaType" |

	// RangeNotSatisfiable - ``416`` status code.
	"RangeNotSatisfiable" |

	// ExpectationFailed - ``417`` status code.
	"ExpectationFailed" |

	// MisdirectedRequest - ``421`` status code.
	"MisdirectedRequest" |

	// UnprocessableEntity - ``422`` status code.
	"UnprocessableEntity" |

	// Locked - ``423`` status code.
	"Locked" |

	// FailedDependency - ``424`` status code.
	"FailedDependency" |

	// UpgradeRequired - ``426`` status code.
	"UpgradeRequired" |

	// PreconditionRequired - ``428`` status code.
	"PreconditionRequired" |

	// TooManyRequests - ``429`` status code.
	"TooManyRequests" |

	// RequestHeaderFieldsTooLarge - ``431`` status code.
	"RequestHeaderFieldsTooLarge" |

	// InternalServerError - ``500`` status code.
	"InternalServerError" |

	// NotImplemented - ``501`` status code.
	"NotImplemented" |

	// BadGateway - ``502`` status code.
	"BadGateway" |

	// ServiceUnavailable - ``503`` status code.
	"ServiceUnavailable" |

	// GatewayTimeout - ``504`` status code.
	"GatewayTimeout" |

	// HTTPVersionNotSupported - ``505`` status code.
	"HTTPVersionNotSupported" |

	// VariantAlsoNegotiates - ``506`` status code.
	"VariantAlsoNegotiates" |

	// InsufficientStorage - ``507`` status code.
	"InsufficientStorage" |

	// LoopDetected - ``508`` status code.
	"LoopDetected" |

	// NotExtended - ``510`` status code.
	"NotExtended" |

	// NetworkAuthenticationRequired - ``511`` status code.
	"NetworkAuthenticationRequired"
