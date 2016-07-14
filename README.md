# validator

This is aims to be an elixir clone of the [NPM Validator](https://github.com/chriso/validator.js) package.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `validator` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:validator, "~> 0.1.0"}]
    end
    ```

  2. Ensure `validator` is started before your application:

    ```elixir
    def application do
      [applications: [:validator]]
    end
    ```


