defmodule ValidatorTest do
  use ExUnit.Case
  import Ecto.Changeset
  doctest Validator

  defmodule Thing do
    use Ecto.Schema

    schema "things" do
      field :uuid
      field :url
      field :email
    end
  end

  ####  EMAILS
    test "a valid set of emails" do
      emails = [
                "email@example.com",
                "firstname.lastname@example.com",
                "email@subdomain.example.com",
                "firstname+lastname@example.com",
                "email@123.123.123.123",
                "firstname-lastname@example.com"
      ]
      Enum.each(emails, fn (email) ->
        params = %{"email" => email}
        struct = %Thing{}
        changeset = cast(struct, params, ~w(email))
        assert Validator.validate_email(changeset, :email).valid?
      end)

    end

    test "an invalid set of emails" do
      emails = [
                "plainaddress",
                 "#@%^%#$@#$@#.com",
                 "@example.com",
                 "Abc..123@example.com",
                 "email@example@example.com",
                 ".email@example.com",
                 "email.@example.com",
                 "あいうえお@example.com",
                 "email..email@example.com"
      ]
      Enum.each(emails, fn(email) ->
        params = %{"email" => email}
        struct = %Thing{}
        changeset = cast(struct, params, ~w(email))
        assert Validator.validate_email(changeset, :email).valid? == false
      end)
    end

  ####  UUIDS
  test "a valid UUID" do
    params = %{"uuid" => "d03d503d-d99e-48c9-8fc5-e227b57cf90f"}
    struct = %Thing{}

    changeset = cast(struct, params, ~w(uuid))
    assert Validator.validate_uuid(changeset, :uuid).valid?
  end

  test "an invalid UUID" do
    params = %{"uuid" => "chrisfishwood"}
    struct = %Thing{}

    changeset = cast(struct, params, ~w(uuid))
    assert Validator.validate_uuid(changeset, :uuid).valid? == false
  end

  ####  URLs
  test "a valid URL" do
    urls = [
      "http://foo.com/blah_blah",
      "http://foo.com/blah_blah/",
      "http://foo.com/blah_blah_(wikipedia)",
      "http://foo.com/blah_blah_(wikipedia)_(again)",
      "http://www.example.com/wpstyle/?p=364",
      "https://www.example.com/foo/?bar=baz&inga=42&quux",
      "http://userid:password@example.com:8080",
      "http://userid:password@example.com:8080/",
      "http://userid@example.com",
      "http://userid@example.com/",
      "http://userid@example.com:8080",
      "http://userid@example.com:8080/",
      "http://userid:password@example.com",
      "http://userid:password@example.com/",
      "http://142.42.1.1/",
      "http://142.42.1.1:8080/",
      "http://foo.com/blah_(wikipedia)#cite-1",
      "http://foo.com/blah_(wikipedia)_blah#cite-1",
      "http://foo.com/(something)?after=parens",
      "http://code.google.com/events/#&product=browser",
      "http://j.mp",
      "ftp://foo.bar/baz",
      "http://foo.bar/?q=Test%20URL-encoded%20stuff",
      "http://1337.net",
      "http://a.b-c.de",
      "http://223.255.255.254"
    ]
    Enum.each(urls, fn (url) ->
      params = %{"url" => url}
      struct = %Thing{}

      changeset = cast(struct, params, ~w(url))
      assert Validator.validate_url(changeset, :url).valid?
    end)
  end


  test "an invalid URL" do
    urls = [
      "http://",
      "http://.",
      "http://..",
      "http://../",
      "http://?",
      "http://??",
      "http://??/",
      "http://#",
      "http://##",
      "http://##/",
      "http://foo.bar?q=Spaces should be encoded",
      "//",
      "//a",
      "///a",
      "///",
      "http:///a",
      "foo.com",
      "rdar://1234",
      "h://test",
      "http:// shouldfail.com",
      ":// should fail",
      "http://foo.bar/foo(bar)baz quux",
      "ftps://foo.bar/",
      "http://.www.foo.bar/",
      "http://www.foo.bar./",
      "http://.www.foo.bar./",
      "http://0.0.0.0",
      "http://10.1.1.0",
      "http://10.1.1.255",
      "http://224.1.1.1",
      "http://1.1.1.1.1",
      "http://123.123.123",
      "http://3628126748",
      "http://10.1.1.1"
    ]
    Enum.each(urls, fn (url) ->
      params = %{"url" => url}
      struct = %Thing{}

      changeset = cast(struct, params, ~w(url))
      assert Validator.validate_url(changeset, :url).valid? == false
    end)
  end
end
