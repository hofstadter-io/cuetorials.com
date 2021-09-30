import "strconv"

#portI: uint16 & >1024

#portS: S={
    string & =~ "^[0-9]{4,5}$"
		_i: strconv.Atoi(S)
    #valid: uint16 & >1024 & _i
}

#port: #portI | #portS

pi: #port
pi: 8080

ps: #portS
ps: "1313"
