defmodule PassiveTotal.Utils do
  @doc """
  Simple function to convert a tesla response to either a tuple
  of {:ok, json} or {:error, reason}
  """
  def parse_response(resp) do
    case resp do
      {:ok, %{status: 200, body: body}} ->
        {:ok, body}

      {:ok, other} ->
        {:error, other}

      other ->
        other
    end
  end
end
