package day01

import (
	"list"
)

// input: _example
// input: _real
// _nums: list.Sort(input, list.Ascending)

_nums: _realSorted
length: len(_nums)

target: 2020

// Part 1 answers
num2: {
	ans2a: {
		for i, n in _nums {
			for j, m in list.Drop(_nums, i+1) {
				if n + m == target {
					a: n,
					b: m,
					N: a*b
				}
			}
		}
	}

	ans2b: {
		for i, n in _nums {
			for j, m in list.Slice(_nums, i+1, length) {
				if n + m == target {
					a: n,
					b: m,
					N: a*b
				}
			}
		}
	}

	// faster, avoid expensive list operations
	ans2c: {
		for i, n in _nums {
			if n < target-n && list.Contains(_nums, target-n) {
				a: n,
				b: target-n,
				N: a*b
			}
		}
	}

	// fastest, nest if guards to simulate short circuit behavior and avoid a list op
	ans2d: {
		for i, n in _nums {
			if n < target-n {
				if list.Contains(_nums, target-n) {
					a: n,
					b: target-n,
					N: a*b
				}
			}
		}
	}
}

// Part 2 answers
num3: {
	// pretty slow
	ans3a: {
		for i, n in _nums {
			for j, m in list.Drop(_nums, i+1) {
				for k, o in list.Drop(_nums, i+j+2) {
					if m < o && n + m + o == target {
						a: n,
						b: m,
						c: target-(n+m),
						N: a*b*c
					}
				}
			}
		}
	}

	// pretty fast
	ans3b: {
		for i, n in _nums {
			for j, m in list.Drop(_nums, i+1) {
				let o = target-(n+m)
				if m < o && list.Contains(_nums, o) {
					a: n,
					b: m,
					c: o,
					N: a*b*c
				}
			}
		}
	}
	
	// fastest, nest if guards to simulate short circuit behavior and avoid a list op
	ans3c: {
		for i, n in _nums {
			for j, m in list.Drop(_nums, i+1) {
				let o = target-(n+m)
				if m < o {
					if list.Contains(_nums, o) {
						a: n,
						b: m,
						c: o,
						N: a*b*c
					}
				}
			}
		}
	}

	// alternative, slice and drop seem to be close in performance
	ans3d: {
		for i, n in _nums {
			for j, m in list.Slice(_nums, i+1, length) {
				let o = target-(n+m)
				if m < o {
					if list.Contains(_nums, o) {
						a: n,
						b: m,
						c: o,
						N: a*b*c
					}
				}
			}
		}
	}
}

_example: [ 1721, 979, 366, 299, 675, 1456 ]
_realSorted: [350, 545, 547, 618, 687, 928, 989, 1002, 1029, 1032, 1034, 1039, 1046, 1047, 1058, 1064, 1065, 1066, 1069, 1070, 1078, 1079, 1087, 1094, 1102, 1103, 1107, 1109, 1126, 1129, 1131, 1144, 1152, 1155, 1172, 1174, 1176, 1181, 1219, 1222, 1223, 1225, 1230, 1237, 1249, 1257, 1276, 1278, 1281, 1295, 1296, 1297, 1298, 1301, 1302, 1307, 1310, 1316, 1319, 1324, 1328, 1346, 1350, 1359, 1360, 1366, 1367, 1369, 1371, 1377, 1379, 1381, 1384, 1390, 1392, 1394, 1398, 1402, 1409, 1411, 1417, 1419, 1421, 1439, 1450, 1452, 1454, 1455, 1457, 1464, 1470, 1476, 1477, 1479, 1491, 1493, 1497, 1499, 1510, 1515, 1522, 1530, 1533, 1546, 1550, 1555, 1557, 1559, 1560, 1564, 1567, 1571, 1586, 1593, 1603, 1607, 1618, 1630, 1631, 1632, 1633, 1634, 1636, 1644, 1653, 1664, 1677, 1687, 1688, 1689, 1698, 1700, 1706, 1710, 1719, 1720, 1730, 1732, 1734, 1736, 1740, 1757, 1758, 1759, 1766, 1773, 1774, 1781, 1787, 1789, 1803, 1805, 1806, 1807, 1809, 1810, 1823, 1827, 1829, 1830, 1842, 1848, 1851, 1855, 1865, 1868, 1870, 1878, 1884, 1888, 1889, 1898, 1900, 1905, 1908, 1910, 1914, 1924, 1929, 1933, 1936, 1942, 1945, 1949, 1956, 1962, 1964, 1972, 1974, 1977, 1980, 1982, 1988, 1998, 1999, 2003, 2005, 2007, 2008, 2010]
