defmodule Milliseconds.Mixfile do
  use Mix.Project

  def project do
    [ app: :milliseconds,
      version: "0.0.1",
      elixir: "~> 1.0",
      description: description,
      package: package,
      description: description
    ]
  end

  def application do
    []
  end

  defp description do
    """
      Simple library to work with milliseconds.
      Convert text to milliseconds: convert("2d")
      Convert milliseconds to text: convert(8640000)
      Calculate future time: future_time("6hrs")
    """
   end

  defp package do
    [ 
      files: ["lib", "mix.exs", "README*"],
      contributors: ["Dave Bryson"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/davebryson/elixir_milliseconds"} 
    ]
  end

end
