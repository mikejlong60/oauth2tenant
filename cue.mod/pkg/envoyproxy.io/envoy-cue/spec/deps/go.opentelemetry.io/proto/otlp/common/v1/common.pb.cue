// Code generated from opentelemetry/proto/common/v1/common.proto. DO NOT EDIT.
package v1

#AnyValue: {
	"@type": "type.googleapis.com/opentelemetry.proto.common.v1.AnyValue"

	// oneof value: at most one may be set
	*{} |
	{string_value!: string} |
	{bool_value!: bool} |
	{int_value!: int64} |
	{double_value!: float64} |
	{array_value!: #ArrayValue} |
	{kvlist_value!: #KeyValueList} |
	{bytes_value!: bytes} |
	{string_value_strindex!: int32}
}

#ArrayValue: {
	"@type": "type.googleapis.com/opentelemetry.proto.common.v1.ArrayValue"
	values?: [...#AnyValue]
}

#KeyValueList: {
	"@type": "type.googleapis.com/opentelemetry.proto.common.v1.KeyValueList"
	values?: [...#KeyValue]
}

#KeyValue: {
	"@type":       "type.googleapis.com/opentelemetry.proto.common.v1.KeyValue"
	key?:          string
	value?:        #AnyValue
	key_strindex?: int32
}

#InstrumentationScope: {
	"@type":  "type.googleapis.com/opentelemetry.proto.common.v1.InstrumentationScope"
	name?:    string
	version?: string
	attributes?: [...#KeyValue]
	dropped_attributes_count?: uint32
}

#EntityRef: {
	"@type":     "type.googleapis.com/opentelemetry.proto.common.v1.EntityRef"
	schema_url?: string
	type?:       string
	id_keys?: [...string]
	description_keys?: [...string]
}
