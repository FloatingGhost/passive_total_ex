defmodule PassiveTotal.Monitor do
  import PassiveTotal.Utils

  @doc """
  Retrieve all alerts associated with an artifact or project.

  Valid params:
  - `:project`: uuid, the project to filter on
  - `:artifact`: uuid, the artifact to filter on  
  - `:start`: datetime
  - `:end`: datetime
  """
  def get(client, %{} = params \\ %{}) do
    Tesla.get(client, "/monitor", query: params)
    |> parse_response()
  end
end
