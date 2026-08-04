// Code generated from envoy/config/common/matcher/v3/matcher.proto. DO NOT EDIT.
package v3

import (
	"list"
	"strings"
	v3_1 "envoyproxy.io/envoy-cue/spec/config/core/v3"
	v3_2 "envoyproxy.io/envoy-cue/spec/type/matcher/v3"
	v3_3 "envoyproxy.io/envoy-cue/spec/config/route/v3"
)

#Matcher: {
	"@type":      "type.googleapis.com/envoy.config.common.matcher.v3.Matcher"
	on_no_match?: #Matcher_OnMatch

	// oneof matcher_type: exactly one must be set
	{matcher_list!: #Matcher_MatcherList} |
	{matcher_tree!: #Matcher_MatcherTree}
}

#Matcher_OnMatch: {
	"@type":        "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.OnMatch"
	keep_matching?: bool

	// oneof on_match: exactly one must be set
	{matcher!: #Matcher} |
	{action!: v3_1.#TypedExtensionConfig}
}

#Matcher_MatcherList: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherList"
	matchers!: [...#Matcher_MatcherList_FieldMatcher] & list.MinItems(1)
}

#Matcher_MatcherList_Predicate: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherList.Predicate"

	// oneof match_type: exactly one must be set
	{single_predicate!: #Matcher_MatcherList_Predicate_SinglePredicate} |
	{or_matcher!: #Matcher_MatcherList_Predicate_PredicateList} |
	{and_matcher!: #Matcher_MatcherList_Predicate_PredicateList} |
	{not_matcher!: #Matcher_MatcherList_Predicate}
}

#Matcher_MatcherList_Predicate_SinglePredicate: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherList.Predicate.SinglePredicate"
	input!:  v3_1.#TypedExtensionConfig

	// oneof matcher: exactly one must be set
	{value_match!: v3_2.#StringMatcher} |
	{custom_match!: v3_1.#TypedExtensionConfig}
}

#Matcher_MatcherList_Predicate_PredicateList: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherList.Predicate.PredicateList"
	predicate!: [...#Matcher_MatcherList_Predicate] & list.MinItems(2)
}

#Matcher_MatcherList_FieldMatcher: {
	"@type":    "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherList.FieldMatcher"
	predicate!: #Matcher_MatcherList_Predicate
	on_match!:  #Matcher_OnMatch
}

#Matcher_MatcherTree: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherTree"
	input!:  v3_1.#TypedExtensionConfig

	// oneof tree_type: exactly one must be set
	{exact_match_map!: #Matcher_MatcherTree_MatchMap} |
	{prefix_match_map!: #Matcher_MatcherTree_MatchMap} |
	{custom_match!: v3_1.#TypedExtensionConfig}
}

#Matcher_MatcherTree_MatchMap: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.Matcher.MatcherTree.MatchMap"
	map?: {[string]: #Matcher_OnMatch}
}

#MatchPredicate: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.MatchPredicate"

	// oneof rule: exactly one must be set
	{or_match!: #MatchPredicate_MatchSet} |
	{and_match!: #MatchPredicate_MatchSet} |
	{not_match!: #MatchPredicate} |
	{any_match!: bool & true} |
	{http_request_headers_match!: #HttpHeadersMatch} |
	{http_request_trailers_match!: #HttpHeadersMatch} |
	{http_response_headers_match!: #HttpHeadersMatch} |
	{http_response_trailers_match!: #HttpHeadersMatch} |
	{http_request_generic_body_match!: #HttpGenericBodyMatch} |
	{http_response_generic_body_match!: #HttpGenericBodyMatch}
}

#MatchPredicate_MatchSet: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.MatchPredicate.MatchSet"
	rules!: [...#MatchPredicate] & list.MinItems(2)
}

#HttpHeadersMatch: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.HttpHeadersMatch"
	headers?: [...v3_3.#HeaderMatcher]
}

#HttpGenericBodyMatch: {
	"@type":      "type.googleapis.com/envoy.config.common.matcher.v3.HttpGenericBodyMatch"
	bytes_limit?: uint32
	patterns!: [...#HttpGenericBodyMatch_GenericTextMatch] & list.MinItems(1)
}

#HttpGenericBodyMatch_GenericTextMatch: {
	"@type": "type.googleapis.com/envoy.config.common.matcher.v3.HttpGenericBodyMatch.GenericTextMatch"

	// oneof rule: exactly one must be set
	{string_match!: string & strings.MinRunes(1)} |
	{binary_match!: bytes}
}
