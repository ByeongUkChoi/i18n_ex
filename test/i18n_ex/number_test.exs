defmodule I18nEx.NumberTest do
  use ExUnit.Case, async: true
  doctest I18nEx.Number

  # import I18nEx.Number

  # test "formats a number with the default options" do
  #   assert format(1000) == "1,000"
  # end

  # test "formats a number with the custom options" do
  #   assert format(1000, minimum_fraction_digits: 2, use_grouping: false, locale: "fr-FR") ==
  #            "1000,00"
  # end

  # test "formats a number with the custom options, but missing minimum_fraction_digits" do
  #   assert format(1000, use_grouping: false, locale: "fr-FR") == "1 000"
  # end

  # test "formats a number with the custom options, but missing use_grouping" do
  #   assert format(1000, minimum_fraction_digits: 2, locale: "fr-FR") == "1 000,00"
  # end

  # test "formats a number with the custom options, but missing locale" do
  #   assert format(1000, minimum_fraction_digits: 2, use_grouping: false) == "1,000.00"
  # end
end
