defmodule Validator do
  @uuid ~r/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/

  def validate_uuid(value), do: test(value, @uuid)

  defp test(value, @uuid) do
    Regex.match?(@uuid, value)
  end
end
