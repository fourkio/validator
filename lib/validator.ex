defmodule Validator do
  import Ecto.Changeset

  @uuid ~r/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/
  #regex adapted under MIT license from https://gist.github.com/dperini/729294
  @url ~r/\A(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\X-\X0-9]+-?)*[a-z\X-\X0-9]+)(?:\.(?:[a-z\X-\X0-9]+-?)*[a-z\X-\X0-9]+)*(?:\.(?:[a-z\X-\X]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?\z/i

  def validate_uuid(changeset, field, opts \\ []) do
    validate_change(changeset, field, {:format, @uuid}, validator(@uuid, opts))
  end

  def validate_url(changeset, field, opts \\ []) do
    validate_change(changeset, field, {:format, @url}, validator(@url, opts))
  end

  defp validator(regex, opts) do
    fn field, value -> if value =~ regex, do: [], else: [{field, {message(opts, "has invalid format"), []}}] end
  end

  defp message(opts, key \\ :message, default) do
    Keyword.get(opts, key, default)
  end
end
