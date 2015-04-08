defmodule MillsecondsTest do
  use ExUnit.Case
  import Milliseconds

  test "hour conversion" do
    assert "1h" == convert(3600000)
    assert (3600000 * 2) == convert("2hrs")
    assert (3600000 * 2) == convert("2hours")
  end

  test "day conversion" do
    assert 86400000 == convert("1d")
    assert "1d" == convert(86400000)
    assert (86400000 * 3) == convert("3days")
  end

  test "year conversion" do
    assert 6.31152e10 == convert("2yrs")
    assert "2yrs" == convert(6.31152e10)
    assert "1y" == convert("1years") |> convert
  end

  test "mins conversion" do 
    assert "5mins" == convert("5mins") |> convert
    assert "1m" == convert("1minute") |> convert
  end

  test "sec conversion" do
    assert "10secs" == convert("10secs") |> convert
    assert "1s" == convert(1000)
  end

  test "milliseconds conversion" do
    assert 1000 == convert("1000")
    assert 1000 == convert("1000milliseconds")
    assert "10ms" == convert(10)
  end
end
