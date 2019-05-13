defmodule PassiveTotal.WhoIs do
  import PassiveTotal.Utils

  @doc """
  Retrieves the WHOIS data for the specified query

  Valid params:
  - `:compact_record`: bool, whether to compress the results
  - `:history`: bool, whether to return historical results
  """
  def get(client, query, params \\ []) do
    params = Keyword.merge(params, [query: query])
    Tesla.get(client, "/whois", query: params)
    |> parse_response()
  end

  def keyword(client, keyword) do
    Tesla.get(client, "/whois/search/keyword", query: [keyword: keyword])
    |> parse_response()
  end

  @doc """
  Searches WHOIS data by field and query.

  Field values can be one of
      "email", "domain", "name", "organization", "address", "phone", "nameserver"
  """
  def search(client, query, field) do
    Tesla.get(client, "/whois/search", query: [query: query, field: field])
    |> parse_response()
  end
end
