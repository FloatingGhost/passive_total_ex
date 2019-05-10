defmodule PassiveTotal.Account do
  @moduledoc """
  API endpoints for `/account`
  """

  import PassiveTotal.Utils

  @doc """
  Read current account metadata and settings
  """
  def get(client) do
    Tesla.get(client, "/account")
    |> parse_response()
  end

  @doc """
  Read API usage history of the account
  """
  def history(client) do
    Tesla.get(client, "/account/history")
    |> parse_response()
  end

  @doc """
  Get active monitors
  """
  def monitors(client) do
    Tesla.get(client, "/account/monitors")
    |> parse_response()
  end

  @doc """
  Read current organization metadata
  """
  def organization(client) do
    Tesla.get(client, "/account/organization")
    |> parse_response()
  end

  @doc """
  Read current account and organization quotas
  """
  def quotas(client) do
    Tesla.get(client, "/account/quota")
    |> parse_response()
  end

  @doc """
  Check sources being used for queries
  """
  def sources(client) do
    Tesla.get(client, "/account/sources")
    |> parse_response()
  end

  @doc """
  Read team activity
  """
  def teamstream(client) do
    Tesla.get(client, "/account/teamstream")
    |> parse_response()
  end

  @doc """
  Retrieve items with the specified classification
  """
  def classifications(client) do
    Tesla.get(client, "/account/classifications")
  end
end
