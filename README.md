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

## Usage
```
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:api_id, :collection_id, :user_id])
    |> validate_required([:api_id, :collection_id, :user_id])
    |> Validator.validate_uuid(:api_id)
    |> Validator.validate_uuid(:collection_id)
    |> Validator.validate_uuid(:user_id)
  end
```
