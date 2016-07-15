defmodule ValidatorTest do
  use ExUnit.Case
  import Ecto.Changeset
  doctest Validator

  defmodule Thing do
    use Ecto.Schema

    schema "things" do
      field :uuid
    end
  end

  ####  UUIDS
  test "a valid UUID" do
    params = %{"uuid" => "d03d503d-d99e-48c9-8fc5-e227b57cf90f"}
    struct = %Thing{}

    changeset = cast(struct, params, ~w(uuid))
    assert Validator.validate_uuid(changeset, :uuid)
  end

  test "an invalid UUID" do
    params = %{"uuid" => "chrisfishwood"}
    struct = %Thing{}

    changeset = cast(struct, params, ~w(uuid))
    assert Validator.validate_uuid(changeset, :uuid) != true
  end

end
