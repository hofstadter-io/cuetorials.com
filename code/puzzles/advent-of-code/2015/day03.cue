package day03

import (
	"list"
	"strings"
)

iter: int | *len(_input) @tag(iter,type=int)
total: len(_input)

_input: _real
_runes: list.Slice(strings.Runes(_input),0,iter)

_calc1: {
	"0": {
		x: 0
		y: 0
	}

	for i, r in _runes {
		let l = _calc1["\(i)"]
		"\(i+1)": {
			x: int
			y: int

			// < left
			if r == 60 {
				x: l.x-1
				y: l.y
			}
			// ^ up
			if r == 94 {
				x: l.x
				y: l.y+1
			}
			// > right
			if r == 62 {
				x: l.x+1
				y: l.y
			}
			// v down
			if r == 118 {
				x: l.x
				y: l.y-1
			}

			pos: "\(x),\(y)"
		}

	}
}

_positions: [for _, x in _calc1 if x.pos != _|_ { x.pos }]
lp: len(_positions)
//_stops: {
	//for i, x in _calc1 if x.pos != _|_ { 
		//"\(x.pos)": {
			//pos: x.pos
			//visits: {
				//"\(i)": true
			//}
		//}
	//}
//}

/// doubles: list.Sum([ for _, S in _stops if len(S.visits) > 1 { 1 } ])
