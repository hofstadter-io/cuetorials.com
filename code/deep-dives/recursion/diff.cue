package r

#DiffF: {
	#next: _
	#func: {
		#X: _
		#Y: _
		diff: {
			{
				for i,x in #X {
					let y = #Y[i]
					if y == _|_ {
						"-": "\(i)": x			
					}
					if y != _|_ {
						if (x & {...}) != _|_ {
							"\(i)": (#next & { #X: x, #Y: y }).diff
						}
						if (x & {...}) == _|_ {
							if (x & y) == _|_ {
								"-": "\(i)": x
								"+": "\(i)": y
							}
						}
					}
				}
			} 
			"+": {
				for i,y in #Y {
					if #X[i] == _|_ {
						"\(i)": y
					}
				}
			}
		}
	}
}

#diff: #RecurseN & { #funcFactory: #DiffF }

ex: {
	x: {
		a: "a"
		b: "b"
		d: "d"
		e: {
			a: "a"
			b: "b"
			d: "d"
		}
	}
	y: {
		b: "b"
		c: "c"
		d: "D"
		e:  {
			b: "b"
			c: "c"
			d: 1
		}
	}
	diff: (#diff & { #X: x, #Y: y }).diff
}

