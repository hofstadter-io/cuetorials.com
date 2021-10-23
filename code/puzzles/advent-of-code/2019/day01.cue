package day01

import (
	"list"
	"math"
)

MAX: 11
RR:  list.Range(1, MAX, 1)

#calc: {
	mass: int
	d:    mass / 3
	r:    math.Floor(d)
	f:    r - 2
}

#calc2: {
	s0:  int
	s1:  (#calc & {mass: s0}).f
	s2:  (#calc & {mass: s1}).f
	s3:  (#calc & {mass: s2}).f
	s4:  (#calc & {mass: s3}).f
	s5:  (#calc & {mass: s4}).f
	s6:  (#calc & {mass: s5}).f
	s7:  (#calc & {mass: s6}).f
	s8:  (#calc & {mass: s7}).f
	s9:  (#calc & {mass: s8}).f
	s10: (#calc & {mass: s9}).f

	ss: [s1, s2, s3, s4, s5, s6, s7, s8, s9, s10]
	sp: [ for i, s in ss if s > 0 {s}]
	f: list.Sum(sp)
}

#calc3: {
	mass: int

	ss: {
		"0": mass
		for i, I in RR {
			"\(I)": (#calc & {"mass": ss["\(I-1)"]}).f
		}
	}

	sp: [ for i, s in ss if s > 0 {s}]
	f: list.Sum(sp) - mass
}

_inputs: _real
max:     list.Max(_inputs)
ans1: [ for i, I in _inputs {(#calc & {mass: I}).f}]
Ans1: list.Sum(ans1)

ans2: [ for i, I in _inputs {(#calc2 & {s0: I}).f}]
Ans2: list.Sum(ans2)

ans3: [ for i, I in _inputs {(#calc3 & {mass: I}).f}]
Ans3: list.Sum(ans3)

_example: [12, 14, 1969, 100756]

_real: [
	120333,
	142772,
	85755,
	90217,
	74894,
	86021,
	66768,
	147353,
	67426,
	145635,
	100070,
	88290,
	110673,
	109887,
	91389,
	121365,
	52760,
	58613,
	130918,
	57842,
	80622,
	50466,
	80213,
	85816,
	149832,
	133813,
	60211,
	69491,
	129415,
	141471,
	77916,
	98907,
	63440,
	109545,
	80183,
	143073,
	77783,
	88546,
	149648,
	128010,
	55530,
	54878,
	103885,
	57312,
	81011,
	148450,
	137947,
	67252,
	106264,
	149860,
	71677,
	101209,
	128477,
	112159,
	56027,
	53313,
	118916,
	98057,
	131668,
	61605,
	107488,
	65517,
	63594,
	84072,
	79214,
	141606,
	137375,
	112525,
	64572,
	126216,
	57013,
	130003,
	122450,
	50642,
	136844,
	96272,
	97861,
	59071,
	106870,
	116595,
	144966,
	88723,
	124038,
	63629,
	105304,
	52928,
	92917,
	147571,
	120553,
	113823,
	85524,
	71152,
	95199,
	102000,
	118874,
	133317,
	146849,
	60450,
	103307,
	117162,
]
