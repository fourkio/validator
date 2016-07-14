defmodule ValidatorTest do
  use ExUnit.Case
  doctest Validator

  ####  UUIDS
  test "a valid UUID" do
    assert Validator.validate_uuid("d03d503d-d99e-48c9-8fc5-e227b57cf90f")
  end

  test "an invalid UUID" do
    assert Validator.validate_uuid("chrisfishwood") != true
  end

end
