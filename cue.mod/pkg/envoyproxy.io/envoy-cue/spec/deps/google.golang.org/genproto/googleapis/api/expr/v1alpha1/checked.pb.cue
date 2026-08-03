// Code generated from google/api/expr/v1alpha1/checked.proto. DO NOT EDIT.
package v1alpha1

#CheckedExpr: {
	"@type": "type.googleapis.com/google.api.expr.v1alpha1.CheckedExpr"
	reference_map?: {[string]: #Reference}
	type_map?: {[string]: #Type}
	source_info?:  #SourceInfo
	expr_version?: string
	expr?:         #Expr
}

#Type: {
	"@type": "type.googleapis.com/google.api.expr.v1alpha1.Type"
	dyn?: {}
	null?:         _
	primitive?:    #Type_PrimitiveType
	wrapper?:      #Type_PrimitiveType
	well_known?:   #Type_WellKnownType
	list_type?:    #Type_ListType
	map_type?:     #Type_MapType
	function?:     #Type_FunctionType
	message_type?: string
	type_param?:   string
	type?:         #Type
	error?: {}
	abstract_type?: #Type_AbstractType
}

#Type_ListType: {
	"@type":    "type.googleapis.com/google.api.expr.v1alpha1.Type.ListType"
	elem_type?: #Type
}

#Type_MapType: {
	"@type":     "type.googleapis.com/google.api.expr.v1alpha1.Type.MapType"
	key_type?:   #Type
	value_type?: #Type
}

#Type_FunctionType: {
	"@type":      "type.googleapis.com/google.api.expr.v1alpha1.Type.FunctionType"
	result_type?: #Type
	arg_types?: [...#Type]
}

#Type_AbstractType: {
	"@type": "type.googleapis.com/google.api.expr.v1alpha1.Type.AbstractType"
	name?:   string
	parameter_types?: [...#Type]
}

#Type_PrimitiveType: "PRIMITIVE_TYPE_UNSPECIFIED" | "BOOL" | "INT64" | "UINT64" | "DOUBLE" | "STRING" | "BYTES"

#Type_WellKnownType: "WELL_KNOWN_TYPE_UNSPECIFIED" | "ANY" | "TIMESTAMP" | "DURATION"

#Decl: {
	"@type":   "type.googleapis.com/google.api.expr.v1alpha1.Decl"
	name?:     string
	ident?:    #Decl_IdentDecl
	function?: #Decl_FunctionDecl
}

#Decl_IdentDecl: {
	"@type": "type.googleapis.com/google.api.expr.v1alpha1.Decl.IdentDecl"
	type?:   #Type
	value?:  #Constant
	doc?:    string
}

#Decl_FunctionDecl: {
	"@type": "type.googleapis.com/google.api.expr.v1alpha1.Decl.FunctionDecl"
	overloads?: [...#Decl_FunctionDecl_Overload]
	doc?: string
}

#Decl_FunctionDecl_Overload: {
	"@type":      "type.googleapis.com/google.api.expr.v1alpha1.Decl.FunctionDecl.Overload"
	overload_id?: string
	params?: [...#Type]
	type_params?: [...string]
	result_type?:          #Type
	is_instance_function?: bool
	doc?:                  string
}

#Reference: {
	"@type": "type.googleapis.com/google.api.expr.v1alpha1.Reference"
	name?:   string
	overload_id?: [...string]
	value?: #Constant
}
