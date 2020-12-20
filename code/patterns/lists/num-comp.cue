package numcomp

import "strings"

input: """
abbabaababbabbbababababa
abbabaababbabbbababababa
abbabaababbabbbababababa
"""

chars: [for _, L in strings.Split(input, "\n") { [for _, C in strings.Split(L, "") {C} ] }]
nums: [for _, L in strings.Split(input, "\n") { [for _, C in strings.Split(L, "") {
	({
		if C == "a" { val: 0 }
		if C == "b" { val: 1 }
	}).val
}]}]
