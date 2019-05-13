defmodule PassiveTotal.Enrichment do
  import PassiveTotal.Utils

  @doc """
  Get enrichment data for a query
  """
  def get(client, query) do
    Tesla.get(client, "/enrichment", query: [query: query])
    |> parse_response()
  end

  @doc """
  Get malware data for a query
  """
  def malware(client, query) do
    Tesla.get(client, "/enrichment/malware", query: [query: query])
    |> parse_response()
  end

  @doc """
  Get osint data for a query
  """
  def osint(client, query) do
    Tesla.get(client, "/enrichment/osint", query: [query: query])
    |> parse_response()
  end
  
  @doc """
  Get subdomains data for a query
  """
  def subdomains(client, query) do
    Tesla.get(client, "/enrichment/subdomains", query: [query: query])
    |> parse_response()
  end
end
