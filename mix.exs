defmodule Validator.Mixfile do
  use Mix.Project

  def project do
    [app: :validator,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    []
  end

  defp deps do
    []
  end

  defp description do
    """
    A set of validators to confirm that a value conforms to a specific format.
    Heavily inspired by https://github.com/chriso/validator.js

    Currently, only supporting UUIDs.
    """
  end

  defp package do
    [
      name: :validator,
      files: ~w(lib mix.exs README.md LICENSE),
      maintainers: ["Chris Steinmeyer", "Mike Groseclose", "Alex Weidmann", "Justin Weidmann"],
      licenses: ~w(MIT),
      links: %{"GitHub" => "https://github.com/fourkio/validator"}
    ]
  end

end
