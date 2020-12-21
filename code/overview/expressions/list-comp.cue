nums: [1,2,3,4,5,6]
sqrd: [ for _, n in nums { n*n } ]
even: [ for _, n in nums if mod(n,2) == 0 { n } ]

listOfStructs: [ for p, n in nums {
	pos: p
	val: n
}]

extractVals: [ for p, S in listOfStructs { S.val } ]
