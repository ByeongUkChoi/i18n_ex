defmodule I18nEx.Currency do
  @moduledoc """
  A module for formatting currencies.
  """

  defstruct data: nil,
            locale: I18nEx.current_locale(),
            currency: "USD",
            delimiter: ",",
            fraction_digits: 2

  @doc """
  Formats the given number as a currency using the provided options.
  Currency and Locale will be passed within the opts paramter as `:currency` and `:locale` keys.
  Currency and Locale are optional, if not provided fallback to default values("USD" and "en-US").

  ## Examples

      iex> I18nEx.Currency.format(1000) |> to_string()
      "$1,000.00"

      # iex> I18nEx.Currency.format(1000, currency: "EUR", locale: "fr-FR") |> to_string()
      # "10 000,00 €"

  """

  def format(number, opts \\ []) do
    %__MODULE__{}
    |> struct(opts)
    |> struct(data: number)
  end
end

defimpl String.Chars, for: I18nEx.Currency do
  def to_string(%{data: number} = currency) do
    number
    |> trunc()
    |> to_charlist()
    |> Enum.reverse()
    |> Enum.chunk_every(3)
    |> Enum.join(",")
    |> String.reverse()
    |> append_floating_point_numbers(currency)
    |> display(currency)
  end

  defp append_floating_point_numbers(number_string, currency) do
    number_string <> "." <> floating_point_numbers(currency)
  end

  defp floating_point_numbers(%{data: number, fraction_digits: fraction_digits}) do
    number
    |> Kernel.to_string()
    |> String.split(".")
    |> Enum.at(1, "")
    |> String.pad_trailing(fraction_digits, "0")
  end

  defp display(string, %{currency: "USD", locale: "en-US"}) do
    "$" <> string
  end

  defp display(string, %{currency: "USD"}) do
    "US$" <> string
  end

  defp display(string, %{currency: "KRW"}) do
    "₩" <> string
  end

  defp display(string, %{currency: "JPY"}) do
    "JP¥" <> string
  end

  defp display(string, %{currency: "CNY"}) do
    "CN¥" <> string
  end
end
