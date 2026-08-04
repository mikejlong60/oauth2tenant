// Code generated from cel/expr/checked.proto. DO NOT EDIT.
package expr

// A CEL expression which has been successfully type checked.
#CheckedExpr: {
	"@type": "type.googleapis.com/cel.expr.CheckedExpr"

	// A map from expression ids to resolved references.
	//
	// The following entries are in this table:
	//
	// - An Ident or Select expression is represented here if it resolves to a
	//   declaration. For instance, if `a.b.c` is represented by
	//   `select(select(id(a), b), c)`, and `a.b` resolves to a declaration,
	//   while `c` is a field selection, then the reference is attached to the
	//   nested select expression (but not to the id or or the outer select).
	//   In turn, if `a` resolves to a declaration and `b.c` are field selections,
	//   the reference is attached to the ident expression.
	// - Every Call expression has an entry here, identifying the function being
	//   called.
	// - Every CreateStruct expression for a message has an entry, identifying
	//   the message.
	reference_map?: {[string]: #Reference}

	// A map from expression ids to types.
	//
	// Every expression node which has a type different than DYN has a mapping
	// here. If an expression has type DYN, it is omitted from this map to save
	// space.
	type_map?: {[string]: #Type}

	// The source info derived from input that generated the parsed `expr` and
	// any optimizations made during the type-checking pass.
	source_info?: #SourceInfo

	// The expr version indicates the major / minor version number of the `expr`
	// representation.
	//
	// The most common reason for a version change will be to indicate to the CEL
	// runtimes that transformations have been performed on the expr during static
	// analysis. In some cases, this will save the runtime the work of applying
	// the same or similar transformations prior to evaluation.
	expr_version?: string

	// The checked expression. Semantically equivalent to the parsed `expr`, but
	// may have structural differences.
	expr?: #Expr
}

// Represents a CEL type.
#Type: {
	"@type": "type.googleapis.com/cel.expr.Type"

	// The kind of type.
	// oneof type_kind: at most one may be set
	*{} |
	{

		// Dynamic type.
		dyn!: {}} |
	{

		// Null value.
		null!: _
	} |
	{

		// Primitive types: `true`, `1u`, `-2.0`, `'string'`, `b'bytes'`.
		primitive!: #Type_PrimitiveType
	} |
	{

		// Wrapper of a primitive type, e.g. `google.protobuf.Int64Value`.
		wrapper!: #Type_PrimitiveType
	} |
	{

		// Well-known protobuf type such as `google.protobuf.Timestamp`.
		well_known!: #Type_WellKnownType
	} |
	{

		// Parameterized list with elements of `list_type`, e.g. `list<timestamp>`.
		list_type!: #Type_ListType
	} |
	{

		// Parameterized map with typed keys and values.
		map_type!: #Type_MapType
	} |
	{

		// Function type.
		function!: #Type_FunctionType
	} |
	{

		// Protocol buffer message type.
		//
		// The `message_type` string specifies the qualified message type name. For
		// example, `google.type.PhoneNumber`.
		message_type!: string
	} |
	{

		// Type param type.
		//
		// The `type_param` string specifies the type parameter name, e.g. `list<E>`
		// would be a `list_type` whose element type was a `type_param` type
		// named `E`.
		type_param!: string
	} |
	{

		// Type type.
		//
		// The `type` value specifies the target type. e.g. int is type with a
		// target type of `Primitive.INT64`.
		type!: #Type
	} |
	{

		// Error type.
		//
		// During type-checking if an expression is an error, its type is propagated
		// as the `ERROR` type. This permits the type-checker to discover other
		// errors present in the expression.
		error!: {}} |
	{

		// Abstract, application defined type.
		//
		// An abstract type has no accessible field names, and it can only be
		// inspected via helper / member functions.
		abstract_type!: #Type_AbstractType
	}
}

// List type with typed elements, e.g. `list<example.proto.MyMessage>`.
#Type_ListType: {
	"@type": "type.googleapis.com/cel.expr.Type.ListType"

	// The element type.
	elem_type?: #Type
}

// Map type with parameterized key and value types, e.g. `map<string, int>`.
#Type_MapType: {
	"@type": "type.googleapis.com/cel.expr.Type.MapType"

	// The type of the key.
	key_type?: #Type

	// The type of the value.
	value_type?: #Type
}

// Function type with result and arg types.
#Type_FunctionType: {
	"@type": "type.googleapis.com/cel.expr.Type.FunctionType"

	// Result type of the function.
	result_type?: #Type

	// Argument types of the function.
	arg_types?: [...#Type]
}

// Application defined abstract type.
#Type_AbstractType: {
	"@type": "type.googleapis.com/cel.expr.Type.AbstractType"

	// The fully qualified name of this abstract type.
	name?: string

	// Parameter types for this abstract type.
	parameter_types?: [...#Type]
}

// CEL primitive types.
#Type_PrimitiveType:
	// Unspecified type.
	"PRIMITIVE_TYPE_UNSPECIFIED" |

	// Boolean type.
	"BOOL" |

	// Int64 type.
	//
	// 32-bit integer values are widened to int64.
	"INT64" |

	// Uint64 type.
	//
	// 32-bit unsigned integer values are widened to uint64.
	"UINT64" |

	// Double type.
	//
	// 32-bit float values are widened to double values.
	"DOUBLE" |

	// String type.
	"STRING" |

	// Bytes type.
	"BYTES"

// Well-known protobuf types treated with first-class support in CEL.
#Type_WellKnownType:
	// Unspecified type.
	"WELL_KNOWN_TYPE_UNSPECIFIED" |

	// Well-known protobuf.Any type.
	//
	// Any types are a polymorphic message type. During type-checking they are
	// treated like `DYN` types, but at runtime they are resolved to a specific
	// message type specified at evaluation time.
	"ANY" |

	// Well-known protobuf.Timestamp type, internally referenced as `timestamp`.
	"TIMESTAMP" |

	// Well-known protobuf.Duration type, internally referenced as `duration`.
	"DURATION"

// Represents a declaration of a named value or function.
//
// A declaration is part of the contract between the expression, the agent
// evaluating that expression, and the caller requesting evaluation.
#Decl: {
	"@type": "type.googleapis.com/cel.expr.Decl"

	// The fully qualified name of the declaration.
	//
	// Declarations are organized in containers and this represents the full path
	// to the declaration in its container, as in `cel.expr.Decl`.
	//
	// Declarations used as
	// [FunctionDecl.Overload][cel.expr.Decl.FunctionDecl.Overload]
	// parameters may or may not have a name depending on whether the overload is
	// function declaration or a function definition containing a result
	// [Expr][cel.expr.Expr].
	name?: string

	// Required. The declaration kind.
	// oneof decl_kind: at most one may be set
	*{} |
	{

		// Identifier declaration.
		ident!: #Decl_IdentDecl
	} |
	{

		// Function declaration.
		function!: #Decl_FunctionDecl
	}
}

// Identifier declaration which specifies its type and optional `Expr` value.
//
// An identifier without a value is a declaration that must be provided at
// evaluation time. An identifier with a value should resolve to a constant,
// but may be used in conjunction with other identifiers bound at evaluation
// time.
#Decl_IdentDecl: {
	"@type": "type.googleapis.com/cel.expr.Decl.IdentDecl"

	// Required. The type of the identifier.
	type?: #Type

	// The constant value of the identifier. If not specified, the identifier
	// must be supplied at evaluation time.
	value?: #Constant

	// Documentation string for the identifier.
	//
	// Provide a brief description of what the variable represents and whether
	// there are any constraints on the formatting or supported value range.
	//
	// Examples:
	//
	//    'request.auth.principal' - string which uniquely identifies an
	//    authenticated principal. For JSON Web Tokens (JWTs), the principal
	//    is the combination of the issuer ('iss') and subject ('sub') token
	//    fields concatenated by a forward slash: iss + `/` + sub.
	//
	//    'min_cpus' - integer value indicates the minimum number of CPUs
	//    required for a compute cluster. The 'min_cpus' value must be
	//    greater than zero and less than 'max_cpus' or 64 whichever is less.
	doc?: string
}

// Function declaration specifies one or more overloads which indicate the
// function's parameter types and return type.
//
// Functions have no observable side-effects (there may be side-effects like
// logging which are not observable from CEL).
#Decl_FunctionDecl: {
	"@type": "type.googleapis.com/cel.expr.Decl.FunctionDecl"

	// Required. List of function overloads, must contain at least one overload.
	overloads?: [...#Decl_FunctionDecl_Overload]

	// Documentation string for the function that indicates the general purpose
	// of the function and its behavior.
	//
	// Documentation strings for the function should be general purpose with
	// specific examples provided in the overload doc string.
	//
	// Examples:
	//
	//     The 'in' operator tests whether an item exists in a collection.
	//
	//     The 'substring' function returns a substring of a target string.
	doc?: string
}

// An overload indicates a function's parameter types and return type, and
// may optionally include a function body described in terms of
// [Expr][cel.expr.Expr] values.
//
// Functions overloads are declared in either a function or method
// call-style. For methods, the `params[0]` is the expected type of the
// target receiver.
//
// Overloads must have non-overlapping argument types after erasure of all
// parameterized type variables (similar as type erasure in Java).
#Decl_FunctionDecl_Overload: {
	"@type": "type.googleapis.com/cel.expr.Decl.FunctionDecl.Overload"

	// Required. Globally unique overload name of the function which reflects
	// the function name and argument types.
	//
	// This will be used by a [Reference][cel.expr.Reference] to
	// indicate the `overload_id` that was resolved for the function `name`.
	overload_id?: string

	// List of function parameter [Type][cel.expr.Type] values.
	//
	// Param types are disjoint after generic type parameters have been
	// replaced with the type `DYN`. Since the `DYN` type is compatible with
	// any other type, this means that if `A` is a type parameter, the
	// function types `int<A>` and `int<int>` are not disjoint. Likewise,
	// `map<string, string>` is not disjoint from `map<K, V>`.
	//
	// When the `result_type` of a function is a generic type param, the
	// type param name also appears as the `type` of on at least one params.
	params?: [...#Type]

	// The type param names associated with the function declaration.
	//
	// For example, `function ex<K,V>(K key, map<K, V> map) : V` would yield
	// the type params of `K, V`.
	type_params?: [...string]

	// Required. The result type of the function. For example, the operator
	// `string.isEmpty()` would have `result_type` of `kind: BOOL`.
	result_type?: #Type

	// Whether the function is to be used in a method call-style `x.f(...)`
	// of a function call-style `f(x, ...)`.
	//
	// For methods, the first parameter declaration, `params[0]` is the
	// expected type of the target receiver.
	is_instance_function?: bool

	// Documentation string for the overload.
	//
	// Provide examples of the overload behavior, preferring to use literal
	// values as input with a comment on the return value.
	//
	// Examples:
	//
	//    // Determine whether a value of type <V> exists within a list<V>.
	//    2 in [1, 2, 3] // returns true
	//
	//    // Determine whether a key of type <K> exists within a map<K,V>.
	//    'hello' in {'hi': 'you', 'hello': 'there'}  // returns true
	//    'help' in {'hi': 'you', 'hello': 'there'}  // returns false
	//
	//    // Take the substring of a string starting at a specific character
	//    // offset (inclusive).
	//    "tacocat".substring(1) // returns "acocat"
	//    "tacocat".substring(20) // error
	//
	//    // Take the substring of a string starting at a specific character
	//    // offset (inclusive) and ending at the given offset (exclusive).
	//    "tacocat".substring(1, 6) // returns "acoca"
	doc?: string
}

// Describes a resolved reference to a declaration.
#Reference: {
	"@type": "type.googleapis.com/cel.expr.Reference"

	// The fully qualified name of the declaration.
	name?: string

	// For references to functions, this is a list of `Overload.overload_id`
	// values which match according to typing rules.
	//
	// If the list has more than one element, overload resolution among the
	// presented candidates must happen at runtime because of dynamic types. The
	// type checker attempts to narrow down this list as much as possible.
	//
	// Empty if this is not a reference to a
	// [Decl.FunctionDecl][cel.expr.Decl.FunctionDecl].
	overload_id?: [...string]

	// For references to constants, this may contain the value of the
	// constant if known at compile time.
	value?: #Constant
}
