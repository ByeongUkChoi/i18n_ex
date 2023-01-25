defmodule I18nEx.MixProject do
  use Mix.Project

  @version "0.0.1"
  @source_url "https://github.com/ByeongUkChoi/i18n_ex"

  def project do
    [
      app: :i18n_ex,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description:
        "Easy-to-use and localized formatting library for numbers, currencies and dates"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.29", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
