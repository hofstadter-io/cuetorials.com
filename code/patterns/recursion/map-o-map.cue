package mapOmap

#Ref: {
	"Ref": string
}

#FindInMapArg: string | #FindInMap | #Ref | *_
#FindInMap: {
	"Fn::FindInMap": 3 * [#FindInMapArg]
}

FiM1: #FindInMap & {
	"Fn::FindInMap": [
		"RegionMap",
		{ "Ref": "AWS::Region" },
		"HVM64",
	]
}

//FiM2: #Map & {
	//"Fn::FindInMap": [
		//"RegionMap",
		//{ "Ref": "AWS::Region" },
		//{ "Fn::FindInMap": [
				//"RegionMap",
				//{ "Ref": "AWS::Region" },
				//"HVM64",
			//]
		//}
	//]
//}


#MapArg: string | #Map | #Ref | *_
#Map: {
	_map: #MapArg
	_key1: #MapArg
	_key2: #MapArg
	"Fn::FindInMap": [
		_map,
		_key1,
		_key2,
	]
}
M1: #Map & {
	_map: "RegionMap"
	_key1: { "Ref": "AWS:Region" }
	_key2: "HVM64"
}
M2: #Map & {
	_map: "RegionMap"
	_key1: { "Ref": "AWS:Region" }
	_key2: M1
}

#Map2Arg: string | #Map2 | #Ref | *_
#Map2: {
	_in: 3*[#Map2Arg]
	"Fn::FindInMap": [ _in[0], _in[1], _in[2] ]
}
Map2_1: #Map2 & {
	_in: [ "RegionMap", { "Ref": "AWS:Region" }, "HVM64" ]
}
//Map2_2: #Map2 & {
	//_in: [ "RegionMap", { "Ref": "AWS:Region" }, Map2_1 ]
//}
