// Code generated from xds/type/matcher/v3/matcher.proto. DO NOT EDIT.
package v3

import (
	"list"
	v3_1 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/core/v3"
)

// A matcher, which may traverse a matching tree in order to result in a match action.
// During matching, the tree will be traversed until a match is found, or if no match
// is found the action specified by the most specific on_no_match will be evaluated.
// As an on_no_match might result in another matching tree being evaluated, this process
// might repeat several times until the final OnMatch (or no match) is decided.
#Matcher: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.Matcher"

	// Optional OnMatch to use if no matcher above matched (e.g., if there are no matchers specified
	// above, or if none of the matches specified above succeeded).
	// If no matcher above matched and this field is not populated, the match will be considered unsuccessful.
	on_no_match?: #Matcher_OnMatch

	// oneof matcher_type: at most one may be set
	*{} |
	{

		// A linear list of matchers to evaluate.
		matcher_list!: #Matcher_MatcherList
	} |
	{

		// A match tree to evaluate.
		matcher_tree!: #Matcher_MatcherTree
	}
}

// What to do if a match is successful.
#Matcher_OnMatch: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.Matcher.OnMatch"

	// If true and the Matcher matches, the action will be taken but the caller
	// will behave as if the Matcher did not match. A subsequent matcher or
	// on_no_match action will be used instead.
	// This field is not supported in all contexts in which the matcher API is
	// used. If this field is set in a context in which it's not supported,
	// the resource will be rejected.
	keep_matching?: bool

	// oneof on_match: exactly one must be set
	// Nested matcher to evaluate.
	// If the nested matcher does not match and does not specify
	// on_no_match, then this matcher is considered not to have
	// matched, even if a predicate at this level or above returned
	// true.
	{matcher!: #Matcher} |
	{

		// Protocol-specific action to take.
		action!: v3_1.#TypedExtensionConfig
	}
}

// A linear list of field matchers.
// The field matchers are evaluated in order, and the first match
// wins.
#Matcher_MatcherList: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherList"

	// A list of matchers. First match wins.
	matchers!: [...#Matcher_MatcherList_FieldMatcher] & list.MinItems(1)
}

// Predicate to determine if a match is successful.
#Matcher_MatcherList_Predicate: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherList.Predicate"

	// oneof match_type: exactly one must be set
	// A single predicate to evaluate.
	{single_predicate!: #Matcher_MatcherList_Predicate_SinglePredicate} |
	{

		// A list of predicates to be OR-ed together.
		or_matcher!: #Matcher_MatcherList_Predicate_PredicateList
	} |
	{

		// A list of predicates to be AND-ed together.
		and_matcher!: #Matcher_MatcherList_Predicate_PredicateList
	} |
	{

		// The invert of a predicate
		not_matcher!: #Matcher_MatcherList_Predicate
	}
}

// Predicate for a single input field.
#Matcher_MatcherList_Predicate_SinglePredicate: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherList.Predicate.SinglePredicate"

	// Protocol-specific specification of input field to match on.
	// [#extension-category: envoy.matching.common_inputs]
	input!: v3_1.#TypedExtensionConfig

	// oneof matcher: exactly one must be set
	// Built-in string matcher.
	{value_match!: #StringMatcher} |
	{

		// Extension for custom matching logic.
		// [#extension-category: envoy.matching.input_matchers]
		custom_match!: v3_1.#TypedExtensionConfig
	}
}

// A list of two or more matchers. Used to allow using a list within a oneof.
#Matcher_MatcherList_Predicate_PredicateList: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherList.Predicate.PredicateList"
	predicate!: [...#Matcher_MatcherList_Predicate] & list.MinItems(2)
}

// An individual matcher.
#Matcher_MatcherList_FieldMatcher: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherList.FieldMatcher"

	// Determines if the match succeeds.
	predicate!: #Matcher_MatcherList_Predicate

	// What to do if the match succeeds.
	on_match!: #Matcher_OnMatch
}

#Matcher_MatcherTree: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherTree"

	// Protocol-specific specification of input field to match on.
	input!: v3_1.#TypedExtensionConfig

	// Exact or prefix match maps in which to look up the input value.
	// If the lookup succeeds, the match is considered successful, and
	// the corresponding OnMatch is used.
	// oneof tree_type: exactly one must be set
	{exact_match_map!: #Matcher_MatcherTree_MatchMap} |
	{

		// Longest matching prefix wins.
		prefix_match_map!: #Matcher_MatcherTree_MatchMap
	} |
	{

		// Extension for custom matching logic.
		custom_match!: v3_1.#TypedExtensionConfig
	}
}

// A map of configured matchers. Used to allow using a map within a oneof.
#Matcher_MatcherTree_MatchMap: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherTree.MatchMap"
	map?: {[string]: #Matcher_OnMatch}
}
