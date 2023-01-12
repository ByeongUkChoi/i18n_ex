defmodule I18nEx.CurrencyTest do
  use ExUnit.Case

  import I18nEx.Currency

  test "formats a number as a currency with the default options" do
    assert format(1000) == "$1,000.00"
  end

  test "formats a number as a currency with the custom options" do
    assert format(1000, currency: "EUR", locale: "fr-FR") == "10 000,00 €"
  end

  test "formats a number as a currency with the custom options, but missing currency" do
    assert format(1000, locale: "fr-FR") == "1 000,00 $US"
  end

  test "formats a number as a currency with the custom options, but missing locale" do
    assert format(1000, currency: "EUR") == "€1,000.00"
  end
end
