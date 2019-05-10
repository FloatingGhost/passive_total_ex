# PassiveTotal

A binding to RiskIQ's PassiveTotal API

Basic usage:
```elixir
iex> client = PassiveTotal.Client.new("my@email.com", "my_apikey")
iex> PassiveTotal.PassiveDNS.get(client, "yuruyuri.com")
{:ok,
  %{
    "firstSeen" => "2011-03-05 20:15:11",
    "lastSeen" => "2019-05-10 15:44:30",
    "pager" => nil,
    "queryType" => "domain",
    "queryValue" => "yuruyuri.com",
    "results" => [
        ...
    ]
  }
}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `passive_total` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:passive_total, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/passive_total](https://hexdocs.pm/passive_total).

