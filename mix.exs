defmodule Milliseconds.Mixfile do
  use Mix.Project

  def project do
    [app: :milliseconds,
     version: "0.0.1",
     elixir: "~> 1.0",
     description: "Library to convert user-friendly names to milliseconds and vice-versa"]
  end

  defp package do
    [ contributors: ["Dave Bryson"],
      licenses: [],
      links: %{"GitHub" => "https://github.com/davebryson/elixir_milliseconds"} ]
  end

end
