nums: [1, 2, 3, 4, 5, 6, 7, 8]
sqrs: [4, 16, 36, 64]
elems: [{
    name:   "a"
    public: true
}, {
    name:   "b"
    public: true
}, {
    name:   "c"
    public: false
}, {
    name: "d"
}]
Elems: {
    hasPublicField: {
        "0": {
            name:   "a"
            public: true
        }
        "1": {
            name:   "b"
            public: true
        }
        "2": {
            name:   "c"
            public: false
        }
    }
    stringifyPublic: {
        "0": {
            name:   "a"
            PUB:    "true"
            public: true
        }
        "1": {
            name:   "b"
            PUB:    "true"
            public: true
        }
        "2": {
            name:   "c"
            PUB:    "false"
            public: false
        }
    }
}
