// Code generated from envoy/type/matcher/value.proto. DO NOT EDIT.
package matcher

#ValueMatcher: {
	"@type":        "type.googleapis.com/envoy.type.matcher.ValueMatcher"
	null_match?:    #ValueMatcher_NullMatch
	double_match?:  #DoubleMatcher
	string_match?:  #StringMatcher
	bool_match?:    bool
	present_match?: bool
	list_match?:    #ListMatcher
}

#ValueMatcher_NullMatch: {
	"@type": "type.googleapis.com/envoy.type.matcher.ValueMatcher.NullMatch"
}

#ListMatcher: {
	"@type": "type.googleapis.com/envoy.type.matcher.ListMatcher"
	one_of?: #ValueMatcher
}
