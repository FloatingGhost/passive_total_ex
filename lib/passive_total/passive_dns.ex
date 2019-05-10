defmodule PassiveTotal.PassiveDNS do
  import PassiveTotal.Utils

  @doc """
  Retrieves the passive DNS results from active account sources.

  Valid params:
  - `:start`: datetime
  - `:end`: datetime
  - `:timeout`: integer
  """
  def get(client, query, params \\ []) do
    params = Keyword.merge(params, [query: query])
    Tesla.get(client, "/dns/passive", query: params)
    |> parse_response()
  end

  def unique(client, query, params \\ []) do
    params = Keyword.merge(params, [query: query])
    Tesla.get(client, "/dns/passive/unique", query: params)
    |> parse_response()
  end

  def search(client, keyword) do
    Tesla.get(client, "/dns/search/keyword", query: [keyword: keyword])
    |> parse_response()
  end
end
