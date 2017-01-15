# validator

[![Build Status](https://semaphoreci.com/api/v1/fourkio/validator/branches/master/badge.svg)](https://semaphoreci.com/fourkio/validator)

This is aims to be an elixir clone of the [NPM Validator](https://github.com/chriso/validator.js) package.

Currently, only UUIDs, emails and URLs are supported.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `validator` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:validator, "~> 0.2.0"}]
    end
    ```
  
  2. Run `mix deps.install`   

  3. Ensure `validator` is started before your application:

    ```elixir
    def application do
      [applications: [:validator]]
    end
    ```

## Usage
```
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:api_id, :some_url, :some_email])
    |> validate_required([:api_id, :some_url])
    |> Validator.validate_uuid(:api_id)
    |> Validator.validate_email(:some_email)
    |> Validator.validate_url(:some_url)
  end
```
