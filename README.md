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

# Calculate future time

# Milliseconds 24 hours from now
expires_tomorrow = future_time("24hrs")
expires_later = future_time("6hrs")

# Current time in milliseconds
now = current_time_millis

```

Inspired by ms.js: https://github.com/rauchg/ms.js

