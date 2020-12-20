package day02

import (
	"list"
	"strconv"
	"strings"
)

_input: _real

// split input into logical groups
_lines: strings.Split(_input, "\n")


_dims: [for _, L in _lines {
	let fs = strings.Split(L, "x")
	l: strconv.Atoi(fs[0])
	w: strconv.Atoi(fs[1])
	h: strconv.Atoi(fs[2])
	v: l*w*h

	s1: l*w
	s2: l*h
	s3: w*h
	min: int
	rib: int

	if s1 <= s3 && s1 <= s2 {
		min: s1
		rib: 2*(l+w)
	}
	if s2 <= s1 && s2 <= s3 {
		min: s2
		rib: 2*(l+h)
	}
	if s3 <= s1 && s3 <= s2 {
		min: s3
		rib: 2*(w+h)
	}
	wrap: 2*s1 + 2*s2 + 2*s3 + min
	ribbon: v + rib
}]

_wrap: [for _, d in _dims { d.wrap }]
wrap: list.Sum(_wrap)
_ribbon: [for _, d in _dims { d.ribbon }]
ribbon: list.Sum(_ribbon)
