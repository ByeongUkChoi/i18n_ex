defmodule I18nEx.Number do
  @moduledoc """
  A module for formatting numbers.
  """

  @doc """
  Formats the given number using the provided options.
  Locale will be passed within the opts paramter as locale: key.
  Locale is optional, if not provided fallback to default value "en-US".

  ## Examples

      iex> I18nEx.Number.format(1000)
      "1,000"

      iex> I18nEx.Number.format(1000, [locale: "fr-FR"])
      "1 000"

  """

  defstruct data: nil, locale: "en-US", delimiter: ","

  def format(number, opts \\ []) do
    %__MODULE__{}
    |> struct(opts)
    |> struct(data: number)
    |> to_string()
  end
end

defimpl String.Chars, for: I18nEx.Number do
  def to_string(%{data: number, locale: _, delimiter: delimiter}) do
    number
    |> Integer.to_charlist()
    |> Enum.reverse()
    |> Enum.chunk_every(3)
    |> Enum.join(delimiter)
    |> String.reverse()
  end
end
