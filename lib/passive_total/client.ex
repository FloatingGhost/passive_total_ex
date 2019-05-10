defmodule PassiveTotal.Client do
  @moduledoc """
  Authenticated client to interact with PassiveTotal
  """

  @adapter {
    Tesla.Adapter.Hackney,
    [pool: :passive_total]
  }

  @doc """
  Create a new client using credentials given in config
  """
  def new do
    username = Application.get_env(:passive_total, :username)
    api_key = Application.get_env(:passive_total, :api_key)
    new(username, api_key)
  end

  @doc """
  Create a new client using specified credentials

      iex> new("my@email.com", "my_apikey")
      %Tesla.Client{...}

      iex> new("my@email.com", "my_apikey", adapter: {Tesla.Adapter.Hackney, [pool: :virustotal]})
      %Tesla.Client{...}
  """
  def new(username, api_key, opts \\ []) do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://api.passivetotal.org/v2/"},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.BasicAuth, username: username, password: api_key},
      {Tesla.Middleware.Timeout, timeout: Keyword.get(opts, :timeout, 5_000)},
      {Tesla.Middleware.Retry, delay: Keyword.get(opts, :retry_delay, 500),
        max_retries: Keyword.get(opts, :max_retries, 5)}
    ]

    adapter = Keyword.get(opts, :adapter, @adapter)

    Tesla.client(middleware, adapter)
  end
end
