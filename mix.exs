defmodule Validator.Mixfile do
  use Mix.Project

  def project do
    [
      app: :validator,
      version: "0.3.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      
      # Docs
      name: "Validator",
      source_url: "https://github.com/fourkio/validator",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    []
  end

  defp deps do
    [{:ecto, "~> 2.0"},
     {:ex_doc, ">= 0.0.0", only: :dev}
   ]
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
