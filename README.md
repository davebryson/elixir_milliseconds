Millseconds
===========

Convert the word version of time to milliseconds and vice-versa.
Makes your code a little more readable.  

Examples
--------

```elixir

import Milliseconds

# Milliseconds to readable time
convert(3600000)
  # => "1h"

# Readable time to milliseconds
convert("2yrs")
  # => 6.31152e10

# Expire something in 5 hrs


```

Inspired by ms.js: https://github.com/rauchg/ms.js

