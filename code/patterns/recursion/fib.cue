package fib

import (
  "list"
  "math"
)

_s5: math.Pow(5.0, 0.5)
_Phi: (_s5 + 1.0)/2.0
_phi: _Phi -1.0

_#calc: {
  n: float
  f: math.Round((math.Pow(_Phi, n) - math.Pow(_phi, n))/_s5)
}


_nums: list.Range(1,num,1)

fibs: [ for i, I in _nums { (_#calc & { n: I }).f } ]

num: float | *23.0 @tag(N,type=number)
// fib: (_#calc & {n: num}).f

// not really recursion ;]
