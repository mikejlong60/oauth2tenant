// Code generated from envoy/type/v3/percent.proto. DO NOT EDIT.
package v3

// Identifies a percentage, in the range [0.0, 100.0].
#Percent: {
	"@type": "type.googleapis.com/envoy.type.v3.Percent"
	value?:  float64 & >=0 & <=100
}

// A fractional percentage is used in cases in which for performance reasons performing floating
// point to integer conversions during randomness calculations is undesirable. The message includes
// both a numerator and denominator that together determine the final fractional value.
//
// * **Example**: 1/100 = 1%.
// * **Example**: 3/10000 = 0.03%.
#FractionalPercent: {
	"@type": "type.googleapis.com/envoy.type.v3.FractionalPercent"

	// Specifies the numerator. Defaults to 0.
	numerator?: uint32

	// Specifies the denominator. If the denominator specified is less than the numerator, the final
	// fractional percentage is capped at 1 (100%).
	denominator?: #FractionalPercent_DenominatorType
}

// Fraction percentages support several fixed denominator values.
#FractionalPercent_DenominatorType:
	// 100.
	//
	// **Example**: 1/100 = 1%.
	"HUNDRED" |

	// 10,000.
	//
	// **Example**: 1/10000 = 0.01%.
	"TEN_THOUSAND" |

	// 1,000,000.
	//
	// **Example**: 1/1000000 = 0.0001%.
	"MILLION"
