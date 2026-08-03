// Code generated from xds/type/matcher/v3/matcher.proto. DO NOT EDIT.
package v3

import (
	"list"
	v3_1 "envoyproxy.io/envoy-cue/spec/deps/cncf/xds/go/xds/core/v3"
)

#Matcher: {
	"@type":       "type.googleapis.com/xds.type.matcher.v3.Matcher"
	matcher_list?: #Matcher_MatcherList
	matcher_tree?: #Matcher_MatcherTree
	on_no_match?:  #Matcher_OnMatch
}

#Matcher_OnMatch: {
	"@type":        "type.googleapis.com/xds.type.matcher.v3.Matcher.OnMatch"
	matcher?:       #Matcher
	action?:        v3_1.#TypedExtensionConfig
	keep_matching?: bool
}

#Matcher_MatcherList: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherList"
	matchers!: [...#Matcher_MatcherList_FieldMatcher] & list.MinItems(1)
}

#Matcher_MatcherList_Predicate: {
	"@type":           "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherList.Predicate"
	single_predicate?: #Matcher_MatcherList_Predicate_SinglePredicate
	or_matcher?:       #Matcher_MatcherList_Predicate_PredicateList
	and_matcher?:      #Matcher_MatcherList_Predicate_PredicateList
	not_matcher?:      #Matcher_MatcherList_Predicate
}

#Matcher_MatcherList_Predicate_SinglePredicate: {
	"@type":       "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherList.Predicate.SinglePredicate"
	input!:        v3_1.#TypedExtensionConfig
	value_match?:  #StringMatcher
	custom_match?: v3_1.#TypedExtensionConfig
}

#Matcher_MatcherList_Predicate_PredicateList: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherList.Predicate.PredicateList"
	predicate!: [...#Matcher_MatcherList_Predicate] & list.MinItems(2)
}

#Matcher_MatcherList_FieldMatcher: {
	"@type":    "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherList.FieldMatcher"
	predicate!: #Matcher_MatcherList_Predicate
	on_match!:  #Matcher_OnMatch
}

#Matcher_MatcherTree: {
	"@type":           "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherTree"
	input!:            v3_1.#TypedExtensionConfig
	exact_match_map?:  #Matcher_MatcherTree_MatchMap
	prefix_match_map?: #Matcher_MatcherTree_MatchMap
	custom_match?:     v3_1.#TypedExtensionConfig
}

#Matcher_MatcherTree_MatchMap: {
	"@type": "type.googleapis.com/xds.type.matcher.v3.Matcher.MatcherTree.MatchMap"
	map?: {[string]: #Matcher_OnMatch}
}
