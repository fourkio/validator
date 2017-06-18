defmodule Validator do
  import Ecto.Changeset

  @uuid ~r/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/
  #regex adapted under MIT license from https://gist.github.com/dperini/729294
  @url ~r/\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z0-9]+-?)*[a-z0-9]+)(?:\.(?:[a-z0-9]+-?)*[a-z0-9]+)*(?:\.(?:[a-z]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/i
  #email regex adapted from: https://tools.ietf.org/html/rfc5322#section-3.4  with help from: http://www.elixre.uk/ 
  @email ~r/\A(?=[a-z0-9@.!#$%&'*+\/=?^_`{|}~-]{6,254}\z)(?=[a-z0-9.!#$%&'*+\/=?^_`{|}~-]{1,64}@)[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:(?=[a-z0-9-]{1,63}\.)[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?=[a-z0-9-]{1,63}\z)[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\z/

  def validate_uuid(changeset, field, opts \\ []) do
    validate_change(changeset, field, {:format, @uuid}, validator(@uuid, opts))
  end

  def validate_url(changeset, field, opts \\ []) do
    validate_change(changeset, field, {:format, @url}, validator(@url, opts))
  end

  def validate_email(changeset, field, opts \\ []) do
    validate_change(changeset, field, {:format, @email}, validator(@email, opts))
  end

  defp validator(regex, opts) do
    fn field, value -> if value =~ regex, do: [], else: [{field, {message(opts, "has invalid format"), []}}] end
  end

  defp message(opts, key \\ :message, default) do
    Keyword.get(opts, key, default)
  end
end
