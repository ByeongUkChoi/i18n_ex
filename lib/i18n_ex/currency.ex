defmodule I18nEx.Currency do
  @moduledoc """
  A module for formatting currencies.
  """

  @doc """
  Formats the given number as a currency using the provided options.
  Currency and Locale will be passed within the opts paramter as `:currency` and `:locale` keys.
  Currency and Locale are optional, if not provided fallback to default values("USD" and "en-US").

  ## Examples

      iex> I18nEx.Currency.format(1000)
      "$1,000.00"

      iex> I18nEx.Currency.format(1000, currency: "EUR", locale: "fr-FR")
      "10 000,00 €"

  """
  def format(number, opts \\ []) do
  end
end
