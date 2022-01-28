---
title: "Required List Element"
description: "Check for a required list element without knowing the position."
weight: 6
---

The Required List Element pattern enables
us to verify elements without knowing their position.

This example works for basic types like ints and strings.

{{< codePane2
  file1="code/patterns/required-list-elem/check-basic.html" title1="check-basic.cue" play1="true"
  file2="code/patterns/required-list-elem/check-basic-out.txt" title2="cue eval check-basic.cue" lang2="text"
>}}

This example works for a list of structs.


{{< codePane
  file="code/patterns/required-list-elem/check-struct.html" title="check-struct.cue" play="true"
>}}

If you want to check that structs have a specific pattern, you can replace the `_` with a definition.
Even better would be to apply the definition to the original list.

Some considerations:

- You will need the elements to have a unique key.
	You could use `true` or any (`_`) as the value if you don't care about duplicate keys with different values.
- This pattern will change once [Associative Lists](/cueology/futurology/associative-lists/) are implemented.

