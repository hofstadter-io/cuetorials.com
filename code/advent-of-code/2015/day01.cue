package day01

import (
	"list"
	"strings"
)

iter: int | *len(_input) @tag(iter,type=int)

_input: _real1
_runes: list.Slice(strings.Runes(_input),0,iter)

up: strings.Count(_input, "(")
dn: strings.Count(_input, ")")

num: len(_input)

floor: up - dn

calc: {
	"0": {
		pos: 0
		cnt: 0
	}

	// for i, _ in list.Range(1, iter, 1) {
		// let r = _runes[i]
	for i, r in _runes {
		let l = calc["\(i)"]
		"\(i+1)": {
			if l.done != _|_ {
				done: l.done
			}
			if l.done == _|_ {
				pos: i+1
				cnt: int
				if r == 40 {
					cnt: l.cnt+1
				}
				if r == 41 {
					cnt: l.cnt-1
				}

				if cnt < 0 {
					done: pos
				}
			}

		}

	}
}
