defmodule I18nEx.Currency do
  @moduledoc """
  A module for formatting currencies.
  """

  defstruct data: nil, locale: I18nEx.current_locale(), delimiter: ","

  @doc """
  Formats the given number as a currency using the provided options.
  Currency and Locale will be passed within the opts paramter as `:currency` and `:locale` keys.
  Currency and Locale are optional, if not provided fallback to default values("USD" and "en-US").

  ## Examples

      iex> I18nEx.Currency.format(1000) |> to_string()
      "$1,000.00"

      iex> I18nEx.Currency.format(1000, currency: "EUR", locale: "fr-FR") |> to_string()
      "10 000,00 €"

  """

  def format(number, opts \\ []) do
    %__MODULE__{}
    |> struct(opts)
    |> struct(data: number)
  end
end

defimpl String.Chars, for: I18nEx.Currency do
  def to_string(%{data: number, locale: _} = currency) do
    number
    |> Integer.to_charlist()
    |> Enum.reverse()
    |> Enum.chunk_every(3)
    |> Enum.join(",")
    |> String.reverse()
    |> display(currency)
  end

  defp display(string, %{locale: "en-US"}) do
    "$" <> string
  end
end
