defmodule MillsecConverter.Mixfile do
  use Mix.Project

  def project do
    [app: :millseconds,
     version: "0.0.1",
     elixir: "~> 1.0",
     description: "Library to convert user-friendly names to milliseconds and vice-versa"]
  end

  defp package do
    [ contributors: ["Dave Bryson"],
      licenses: [],
      links: %{"GitHub" => "https://github.com/meh/jazz"} ]
  end

end
