defmodule Validator do
  import Ecto.Changeset
  @uuid ~r/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/

  def validate_uuid(changeset, field, opts \\ []), do: validate_change(changeset, field, {:format, @uuid}, fn _, value ->
      if value =~ @uuid, do: [], else: [{field, {message(opts, "has invalid format"), []}}]
    end)

  defp message(opts, key \\ :message, default) do
    Keyword.get(opts, key, default)
  end

end
