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

  defstruct locale: "en-US", data: nil

  def format(number, opts \\ []) do
    %__MODULE__{}
    |> struct(opts)
    |> struct(data: number)
  end
end

defimpl String.Chars, for: I18nEx.Number do
  def to_string(%{data: number, locale: _}) do
    number
    |> Integer.to_charlist()
    |> Enum.reverse()
    |> Enum.chunk_every(3)

    # TODO: add delimiter, to string, variable count
  end
end
