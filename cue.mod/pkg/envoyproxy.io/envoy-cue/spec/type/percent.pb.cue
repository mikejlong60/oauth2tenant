// Code generated from envoy/type/percent.proto. DO NOT EDIT.
package type

#Percent: {
	"@type": "type.googleapis.com/envoy.type.Percent"
	value?:  float64 & >=0 & <=100
}

#FractionalPercent: {
	"@type":      "type.googleapis.com/envoy.type.FractionalPercent"
	numerator?:   uint32
	denominator?: #FractionalPercent_DenominatorType
}

#FractionalPercent_DenominatorType: "HUNDRED" | "TEN_THOUSAND" | "MILLION"
