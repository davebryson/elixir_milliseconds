Millseconds
===========

Convert user-friendly names to milliseconds and vice-versa. Nice little helper when 
you're calculating expiration times etc...: timestamp + convert("2days")

Examples
--------

```elixir

import Milliseconds

convert(3600000)
  # => "1h"

convert(6.31152e10)
  # => "2yrs"

convert("2yrs")
  # => 6.31152e10

convert("10ms")
  # => 10

```

