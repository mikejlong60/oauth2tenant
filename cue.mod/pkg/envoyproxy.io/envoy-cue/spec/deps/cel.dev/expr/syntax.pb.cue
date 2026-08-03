// Code generated from cel/expr/syntax.proto. DO NOT EDIT.
package expr

#ParsedExpr: {
	"@type":      "type.googleapis.com/cel.expr.ParsedExpr"
	expr?:        #Expr
	source_info?: #SourceInfo
}

#Expr: {
	"@type":             "type.googleapis.com/cel.expr.Expr"
	id?:                 int64
	const_expr?:         #Constant
	ident_expr?:         #Expr_Ident
	select_expr?:        #Expr_Select
	call_expr?:          #Expr_Call
	list_expr?:          #Expr_CreateList
	struct_expr?:        #Expr_CreateStruct
	comprehension_expr?: #Expr_Comprehension
}

#Expr_Ident: {
	"@type": "type.googleapis.com/cel.expr.Expr.Ident"
	name?:   string
}

#Expr_Select: {
	"@type":    "type.googleapis.com/cel.expr.Expr.Select"
	operand?:   #Expr
	field?:     string
	test_only?: bool
}

#Expr_Call: {
	"@type":   "type.googleapis.com/cel.expr.Expr.Call"
	target?:   #Expr
	function?: string
	args?: [...#Expr]
}

#Expr_CreateList: {
	"@type": "type.googleapis.com/cel.expr.Expr.CreateList"
	elements?: [...#Expr]
	optional_indices?: [...int32]
}

#Expr_CreateStruct: {
	"@type":       "type.googleapis.com/cel.expr.Expr.CreateStruct"
	message_name?: string
	entries?: [...#Expr_CreateStruct_Entry]
}

#Expr_CreateStruct_Entry: {
	"@type":         "type.googleapis.com/cel.expr.Expr.CreateStruct.Entry"
	id?:             int64
	field_key?:      string
	map_key?:        #Expr
	value?:          #Expr
	optional_entry?: bool
}

#Expr_Comprehension: {
	"@type":         "type.googleapis.com/cel.expr.Expr.Comprehension"
	iter_var?:       string
	iter_var2?:      string
	iter_range?:     #Expr
	accu_var?:       string
	accu_init?:      #Expr
	loop_condition?: #Expr
	loop_step?:      #Expr
	result?:         #Expr
}

#Constant: {
	"@type":          "type.googleapis.com/cel.expr.Constant"
	null_value?:      _
	bool_value?:      bool
	int64_value?:     int64
	uint64_value?:    uint64
	double_value?:    float64
	string_value?:    string
	bytes_value?:     bytes
	duration_value?:  string
	timestamp_value?: string
}

#SourceInfo: {
	"@type":         "type.googleapis.com/cel.expr.SourceInfo"
	syntax_version?: string
	location?:       string
	line_offsets?: [...int32]
	positions?: {[string]: int32}
	macro_calls?: {[string]: #Expr}
	extensions?: [...#SourceInfo_Extension]
}

#SourceInfo_Extension: {
	"@type": "type.googleapis.com/cel.expr.SourceInfo.Extension"
	id?:     string
	affected_components?: [...#SourceInfo_Extension_Component]
	version?: #SourceInfo_Extension_Version
}

#SourceInfo_Extension_Version: {
	"@type": "type.googleapis.com/cel.expr.SourceInfo.Extension.Version"
	major?:  int64
	minor?:  int64
}

#SourceInfo_Extension_Component: "COMPONENT_UNSPECIFIED" | "COMPONENT_PARSER" | "COMPONENT_TYPE_CHECKER" | "COMPONENT_RUNTIME"
