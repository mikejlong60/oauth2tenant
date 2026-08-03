// Code generated from envoy/type/v3/percent.proto. DO NOT EDIT.
package v3

#Percent: {
	"@type": "type.googleapis.com/envoy.type.v3.Percent"
	value?:  float64 & >=0 & <=100
}

#FractionalPercent: {
	"@type":      "type.googleapis.com/envoy.type.v3.FractionalPercent"
	numerator?:   uint32
	denominator?: #FractionalPercent_DenominatorType
}

#FractionalPercent_DenominatorType: "HUNDRED" | "TEN_THOUSAND" | "MILLION"
