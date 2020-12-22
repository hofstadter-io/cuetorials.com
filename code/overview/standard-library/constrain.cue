package stdlib

import (
	"net"
	"time"
)

// string with ip format
ip: net.IPv4
ip: "10.1.2.3"

// string with time format
ts: time.Format(time.ANSIC)
ts: "Mon Jan 2 15:04:05 2006"
