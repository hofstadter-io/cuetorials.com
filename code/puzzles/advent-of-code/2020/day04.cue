package day04

import (
	"strconv"
	"strings"
)

// helper list for valid passport fields
req: ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]
// helper disjunction for eye color
ECL: "amb" | "blu" | "brn" | "gry" | "grn" | "hzl" | "oth"

// inputs in separate file, see github
_input: _real
// _input: _example
// _input: _valid
// _input: _invalid

// split passports
_pp1: strings.Split(_input, "\n\n")
// flatten each passport
_pp2: [ for i, p in _pp1 {strings.Replace(p, "\n", " ", -1)}]

// definition to check if valid
#valid: {
	// input passport string
	_in: string
	// passport fields
	_flds: strings.Fields(_in)

	// turn fields into struct so we can test their values
	fs: {
		for i, f in _flds {
			let pair = strings.Split(f, ":")
			"\(pair[0])": pair[1]
		}
	}

	numkeys: len(fs)

	// part1 valid field, we count these later to get the answer
	valid: bool | *false

	// valid if 8 keys (part1)
	if numkeys == 8 {
		valid: true
	}

	// valid if 7 keys and cid missing (part1)
	if numkeys == 7 && fs.cid == _|_ {
		valid: true
	}

	// part2 valid field, we count these later to get the answer
	VALID: bool | *false
	// passed part 1, now check part 2
	if valid {
		// our part2 test
		check2: _#PP & {I: fs}
		VALID:  check2.valid
	}

}

// test for part2
_#PP: {
	// input valie
	I: {
		byr: string
		iyr: string
		eyr: string
		hgt: string
		hcl: string
		ecl: string
		pid: string
		cid: string
	}

	// the check, keys will only be added if valid, their value will always hold true
	out: {

		if (I.byr & =~"^[0-9]{4}$") != _|_ {
			byr: (strconv.Atoi(I.byr) & >=1920 & <=2002) != _|_
		}

		if (I.iyr & =~"^[0-9]{4}$") != _|_ {
			iyr: (strconv.Atoi(I.iyr) & >=2010 & <=2020) != _|_
		}

		if (I.eyr & =~"^[0-9]{4}$") != _|_ {
			eyr: (strconv.Atoi(I.eyr) & >=2020 & <=2030) != _|_
		}

		// check height with 2 clauses
		if (I.hgt & =~"^[0-9]{3}cm$") != _|_ {
			hgt: (strconv.Atoi(strings.TrimSuffix(I.hgt, "cm")) & >=150 & <=193) != _|_
		}
		if (I.hgt & =~"^[0-9]{2}in$") != _|_ {
			hgt: (strconv.Atoi(strings.TrimSuffix(I.hgt, "in")) & >=59 & <=76) != _|_
		}

		if (I.hcl & =~"^#[0-9a-f]{6}$") != _|_ {
			hcl: true
		}

		// test eye color against disjunction
		if (I.ecl & ECL) != _|_ {
			ecl: true
		}

		if (I.pid & =~"^[0-9]{9}$") != _|_ {
			pid: true
		}
	}

	// part2 final valid check, we should have 7 fields
	valid: bool | *false
	if len(out) == 7 {
		valid: true
	}
}

// loop over the passports, calculat both parts
_pp3: [
	for i, p in _pp2 {
		#valid & {_in: p}
	},
]

// our final answers
part1: len([ for i, p in _pp3 if p.valid {p}])
part2: len([ for i, p in _pp3 if p.VALID {p}])
