defmodule Milliseconds do
    @moduledoc """
        Simple library to work with milliseconds.

        Example:

            Millseconds.convert("2d") 
                # => 1211222

            Millseconds.convert(1211222)
                # => "2d"
    """
    @s 1000
    @m @s * 60
    @h @m * 60
    @d @h * 24
    @y @d * 365.25
    @pattern ~r/^((?:\d+)?\.?\d+) *(milliseconds?|msecs?|ms|seconds?|secs?|s|minutes?|mins?|m|hours?|hrs?|h|days?|d|years?|yrs?|y)?$/

    @doc """
        Convert time in words to milliseconds.
        
        Ex: Milliseconds.convert("1h")
            #=> 4000000
    """
    def convert(value) when is_binary(value) do
        case Regex.run(@pattern, value) do
            [a, value, name] -> 
                [a, String.to_integer(value), name] |> matchit
            [a, value ] ->
                [a, String.to_integer(value)] |> matchit
            _ -> 
                nil
        end
    end


    @doc """
        Convert milliseconds to words
        
        Ex: Milliseconds.convert(4000000) 
            #=> "1h"
    """
    def convert(value) when is_number(value) and value > @y, do: "#{round(value/@y)}yrs"
    def convert(value) when is_number(value) and value == @y, do: "#{round(value/@y)}y"

    def convert(value) when is_number(value) and value > @d, do: "#{round(value/@d)}days"
    def convert(value) when is_number(value) and value == @d, do: "#{round(value/@d)}d"

    def convert(value) when is_number(value) and value > @h, do: "#{round(value/@h)}hrs"
    def convert(value) when is_number(value) and value == @h, do: "#{round(value/@h)}h"

    def convert(value) when is_number(value) and value > @m, do: "#{round(value/@m)}mins"
    def convert(value) when is_number(value) and value == @m, do: "#{round(value/@m)}m"

    def convert(value) when is_number(value) and value > @s, do: "#{round(value/@s)}secs"
    def convert(value) when is_number(value) and value == @s, do: "#{round(value/@s)}s"
    
    def convert(value) when is_number(value),do: "#{value}ms"


    @doc """
        Return the current time in milliseconds (since 1970)
    """
    def current_time_millis do
        {mega, sec, micro} = :erlang.now
        (mega * 1.0e6 + sec) * 1000 + round(micro/1000)
    end 

    @doc """
        Calculate future time in milliseconds.

        Example:
          # Milliseconds 1 day from now
          future_time("1d")

          # Milliseconds 6 hrs from now
          future_time("6hrs")
    """
    def future_time(word) when is_binary(word), do: convert(word) + current_time_millis
    def future_time(value) when is_number(value), do: value + current_time_millis
    

    # I love pattern matching...
    defp matchit([_,value, word]) when word == "years", do: value * @y
    defp matchit([_,value, word]) when word == "year", do: value * @y
    defp matchit([_,value, word]) when word == "yrs", do: value * @y
    defp matchit([_,value, word]) when word == "yr", do: value * @y
    defp matchit([_,value, word]) when word == "y", do: value * @y

    defp matchit([_,value, word]) when word == "days", do: value * @d
    defp matchit([_,value, word]) when word == "day", do: value * @d
    defp matchit([_,value, word]) when word == "d", do: value * @d

    defp matchit([_,value, word]) when word == "hours", do: value * @h
    defp matchit([_,value, word]) when word == "hrs", do: value * @h
    defp matchit([_,value, word]) when word == "hr", do: value * @h
    defp matchit([_,value, word]) when word == "h", do: value * @h

    defp matchit([_,value, word]) when word == "minutes", do: value * @m
    defp matchit([_,value, word]) when word == "minute", do: value * @m
    defp matchit([_,value, word]) when word == "mins", do: value * @m
    defp matchit([_,value, word]) when word == "min", do: value * @m
    defp matchit([_,value, word]) when word == "m", do: value * @m

    defp matchit([_,value, word]) when word == "seconds", do: value * @s
    defp matchit([_,value, word]) when word == "second", do: value * @s
    defp matchit([_,value, word]) when word == "secs", do: value * @s
    defp matchit([_,value, word]) when word == "sec", do: value * @s
    defp matchit([_,value, word]) when word == "s", do: value * @s

    defp matchit([_,value, word]) when word == "ms", do: value
    defp matchit([_,value, word]) when word == "milliseconds", do: value

    defp matchit([_,value]), do: value
    defp matchit(_), do: nil 
end
