defmodule I18nEx.Number do
  @moduledoc """
  A module for formatting numbers.
  """

  defstruct data: nil, locale: I18nEx.current_locale(), delimiter: nil

  @doc """
  Formats the given number using the provided options.
  Locale will be passed within the opts paramter as locale: key.
  Locale is optional, if not provided fallback to default value "en-US".

  ## Examples

      iex> I18nEx.Number.format(1000) |> to_string()
      "1,000"

      iex> I18nEx.Number.format(1000, locale: "fr-FR") |> to_string()
      "1 000"

  """

  def format(number, opts \\ []) do
    %__MODULE__{}
    |> struct(opts)
    |> struct(data: number)
  end
end

defimpl String.Chars, for: I18nEx.Number do
  def to_string(%{data: number, locale: _} = struct) do
    delimiter = get_delimiter(struct)

    number
    |> Integer.to_charlist()
    |> Enum.reverse()
    |> Enum.chunk_every(3)
    |> Enum.join(delimiter)
    |> String.reverse()
  end

  defp get_delimiter(%{locale: "fr-FR", delimiter: nil}), do: " "
  defp get_delimiter(_), do: ","
end
