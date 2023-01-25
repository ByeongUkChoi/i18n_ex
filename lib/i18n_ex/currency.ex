defmodule I18nEx.Currency do
  @moduledoc """
  A module for formatting currencies.
  """

  defstruct data: nil,
            locale: I18nEx.current_locale(),
            currency: "USD",
            delimiter: nil,
            fraction_digits: 2,
            decimal_separator: nil

  @doc """
  Formats the given number as a currency using the provided options.
  Currency and Locale will be passed within the opts paramter as `:currency` and `:locale` keys.
  Currency and Locale are optional, if not provided fallback to default values("USD" and "en-US").

  ## Examples

      iex> I18nEx.Currency.format(1000) |> to_string()
      "$1,000.00"

      iex> I18nEx.Currency.format(1000, currency: "EUR", locale: "fr-FR") |> to_string()
      "1 000,00 €"

  """

  def format(number, opts \\ []) do
    %__MODULE__{}
    |> struct(opts)
    |> struct(data: number)
  end
end

defimpl String.Chars, for: I18nEx.Currency do
  def to_string(%{data: number} = currency) do
    delimiter = get_delimiter(currency)

    number
    |> trunc()
    |> to_charlist()
    |> Enum.reverse()
    |> Enum.chunk_every(3)
    |> Enum.join(delimiter)
    |> String.reverse()
    |> append_floating_point_numbers(currency)
    |> display(currency)
  end

  defp get_delimiter(%{locale: "fr-FR", delimiter: nil}), do: " "
  defp get_delimiter(_), do: ","

  defp append_floating_point_numbers(number_string, currency) do
    number_string <> decimal_separator(currency) <> floating_point_numbers(currency)
  end

  defp floating_point_numbers(%{data: number, fraction_digits: fraction_digits}) do
    number
    |> Kernel.to_string()
    |> String.split(".")
    |> Enum.at(1, "")
    |> String.pad_trailing(fraction_digits, "0")
  end

  defp decimal_separator(%{decimal_separator: ds}) when ds != nil, do: "."
  defp decimal_separator(%{locale: "fr-FR"}), do: ","
  defp decimal_separator(_), do: "."

  defp display(string, %{currency: "USD", locale: "en-US"}), do: "$" <> string
  defp display(string, %{currency: "USD"}), do: "US$" <> string
  defp display(string, %{currency: "EUR", locale: "fr-FR"}), do: string <> " €"
  defp display(string, %{currency: "EUR"}), do: "€" <> string
  defp display(string, %{currency: "KRW"}), do: "₩" <> string
  defp display(string, %{currency: "JPY"}), do: "JP¥" <> string
  defp display(string, %{currency: "CNY"}), do: "CN¥" <> string
end
