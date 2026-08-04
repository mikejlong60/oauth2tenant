// Code generated from envoy/config/common/matcher/v3/matcher.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

// A matcher, which may traverse a matching tree in order to result in a match action.
// During matching, the tree will be traversed until a match is found, or if no match
// is found the action specified by the most specific on_no_match will be evaluated.
// As an on_no_match might result in another matching tree being evaluated, this process
// might repeat several times until the final OnMatch (or no match) is decided.
//
// .. note::
//   Please use the syntactically equivalent :ref:`matching API <envoy_v3_api_msg_.xds.type.matcher.v3.Matcher>`
#Matcher: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher"

	// Optional ``OnMatch`` to use if the matcher failed.
	// If specified, the ``OnMatch`` is used, and the matcher is considered
	// to have matched.
	// If not specified, the matcher is considered not to have matched.
	on_no_match?: #Matcher_OnMatch

	// oneof matcher_type: exactly one must be set
	// A linear list of matchers to evaluate.
	{matcher_list!: #Matcher_MatcherList} |
	{

		// A match tree to evaluate.
		matcher_tree!: #Matcher_MatcherTree
	}
}

// What to do if a match is successful.
#Matcher_OnMatch: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.OnMatch"

	// If true, the action will be taken but the caller will behave as if no
	// match was found. This applies both to actions directly encoded in the
	// action field and to actions returned from a nested matcher tree in the
	// matcher field. A subsequent matcher on_no_match action will be used
	// instead.
	//
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
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherList"

	// A list of matchers. First match wins.
	matchers!: [...#Matcher_MatcherList_FieldMatcher] & list.MinItems(1)
}

// Predicate to determine if a match is successful.
#Matcher_MatcherList_Predicate: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherList.Predicate"

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

		// The inverse of a predicate
		not_matcher!: #Matcher_MatcherList_Predicate
	}
}

// Predicate for a single input field.
#Matcher_MatcherList_Predicate_SinglePredicate: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherList.Predicate.SinglePredicate"

	// Protocol-specific specification of input field to match on.
	// [#extension-category: envoy.matching.common_inputs]
	input!: v3_1.#TypedExtensionConfig

	// oneof matcher: exactly one must be set
	// Built-in string matcher.
	{value_match!: v3_2.#StringMatcher} |
	{

		// Extension for custom matching logic.
		// [#extension-category: envoy.matching.input_matchers]
		custom_match!: v3_1.#TypedExtensionConfig
	}
}

// A list of two or more matchers. Used to allow using a list within a oneof.
#Matcher_MatcherList_Predicate_PredicateList: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherList.Predicate.PredicateList"
	predicate!: [...#Matcher_MatcherList_Predicate] & list.MinItems(2)
}

// An individual matcher.
#Matcher_MatcherList_FieldMatcher: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherList.FieldMatcher"

	// Determines if the match succeeds.
	predicate!: #Matcher_MatcherList_Predicate

	// What to do if the match succeeds.
	on_match!: #Matcher_OnMatch
}

#Matcher_MatcherTree: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherTree"

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
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherTree.MatchMap"
	map?: {[string]: #Matcher_OnMatch}
}

// Match configuration. This is a recursive structure which allows complex nested match
// configurations to be built using various logical operators.
// [#next-free-field: 11]
#MatchPredicate: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.MatchPredicate"

	// oneof rule: exactly one must be set
	// A set that describes a logical OR. If any member of the set matches, the match configuration
	// matches.
	{or_match!: #MatchPredicate_MatchSet} |
	{

		// A set that describes a logical AND. If all members of the set match, the match configuration
		// matches.
		and_match!: #MatchPredicate_MatchSet
	} |
	{

		// A negation match. The match configuration will match if the negated match condition matches.
		not_match!: #MatchPredicate
	} |
	{

		// The match configuration will always match.
		any_match!: bool & true
	} |
	{

		// HTTP request headers match configuration.
		http_request_headers_match!: #HttpHeadersMatch
	} |
	{

		// HTTP request trailers match configuration.
		http_request_trailers_match!: #HttpHeadersMatch
	} |
	{

		// HTTP response headers match configuration.
		http_response_headers_match!: #HttpHeadersMatch
	} |
	{

		// HTTP response trailers match configuration.
		http_response_trailers_match!: #HttpHeadersMatch
	} |
	{

		// HTTP request generic body match configuration.
		http_request_generic_body_match!: #HttpGenericBodyMatch
	} |
	{

		// HTTP response generic body match configuration.
		http_response_generic_body_match!: #HttpGenericBodyMatch
	}
}

// A set of match configurations used for logical operations.
#MatchPredicate_MatchSet: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.MatchPredicate.MatchSet"

	// The list of rules that make up the set.
	rules!: [...#MatchPredicate] & list.MinItems(2)
}

// HTTP headers match configuration.
#HttpHeadersMatch: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.HttpHeadersMatch"

	// HTTP headers to match.
	headers?: [...v3_3.#HeaderMatcher]
}

// HTTP generic body match configuration.
// List of text strings and hex strings to be located in HTTP body.
// All specified strings must be found in the HTTP body for positive match.
// The search may be limited to specified number of bytes from the body start.
//
// .. attention::
//
//   Searching for patterns in HTTP body is potentially CPU-intensive. For each specified pattern, HTTP body is scanned byte by byte to find a match.
//   If multiple patterns are specified, the process is repeated for each pattern. If location of a pattern is known, ``bytes_limit`` should be specified
//   to scan only part of the HTTP body.
#HttpGenericBodyMatch: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.HttpGenericBodyMatch"

	// Limits search to specified number of bytes - default zero (no limit - match entire captured buffer).
	bytes_limit?: uint32

	// List of patterns to match.
	patterns!: [...#HttpGenericBodyMatch_GenericTextMatch] & list.MinItems(1)
}

#HttpGenericBodyMatch_GenericTextMatch: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.HttpGenericBodyMatch.GenericTextMatch"

	// oneof rule: exactly one must be set
	// Text string to be located in HTTP body.
	{string_match!: string & strings.MinRunes(1)} |
	{

		// Sequence of bytes to be located in HTTP body.
		binary_match!: bytes
	}
}
