defmodule PassiveTotal.MixProject do
  use Mix.Project

  def project do
    [
      app: :passive_total,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "A set of bindings to RiskIQ's PassiveTotal API",
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      maintainers: ["FloatingGhost"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/FloatingGhost/passive_total_ex",
        "API documentation" => "https://api.passivetotal.org/api/docs/"
      }
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.2.0"},
      {:hackney, "~> 1.15.1"},
      {:jason, "~> 1.1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
