defmodule Validator.Mixfile do
  use Mix.Project

  def project do
    [app: :validator,
     version: "0.2.0",
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
    [{:ecto, "~> 2.0"}]
  end

  defp description do
    """
    A set of changeset validators to confirm that a changeset value is the proper format.

    Heavily inspired by https://github.com/chriso/validator.js
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
