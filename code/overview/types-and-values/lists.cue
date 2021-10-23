empty: []
any: [...]
ints: [...int]
nested: [...[...string]]

opened: ints & [1, 2, ...]
closed: ints & [1, 2, 3]

// list of for constrained ints
ip: 4 * [uint8]
// sets the first element
tendot: ip & [10, ...uint8]
// uses constraint as second element
one72: ip & [172, >=16 & <=32, ...]

mixed: any & [...] & ["a", 1, {foo: "bar"}]
join:  [1, 2] + [3, 4]
Join:  opened & join
