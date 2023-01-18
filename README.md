# I18nEx

## Overview
This library provides internationalization functionality for Elixir. It references the functionality of the JavaScript Intl library, and allows developers to format numbers, dates and currencies for different locales.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `i18n_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:i18n_ex, "~> 0.1.0"}
  ]
end
```

## Usage

Here are some examples of how to use the library:

```elixir
# Formatting numbers
I18nEx.Number.format(1000, locale: "en-US") |> to_string()
# => "1,000"

# Formatting a number with a specific number of decimal places
I18nEx.Number.format(3.14159265359, locale: "en-US", minimum_fraction_digits: 2, maximum_fraction_digits: 4) |> to_string()
# => "3.1416"

# Formatting a percentage
I18nEx.Number.format(0.25, locale: "en-US", style: "percent") |> to_string()
# => "25%"

# Formatting currencies
I18nEx.Currency.format(1000, currency: "USD", locale: "en-US") |> to_string()
# => "$1,000.00"

# Formatting a currency for a specific country
I18nEx.Currency.format(1000, currency: "USD", locale: "fr-FR") |> to_string()
# => "1 000,00 $US"

# Formatting a currency with a custom currency symbol
I18nEx.Currency.format(1000, currency: "USD", locale: "en-US", currency_display: "symbol", currency_sign: "€") |> to_string()
# => "€1,000.00"

# Formatting dates
I18nEx.DateTime.format(~D[2022-01-01], locale: "en-US", format: "MMM d, yyyy") |> to_string()
# => "Jan 1, 2022"

# Formatting a date and time with a specific time zone
I18nEx.DateTime.format(~N[2022-01-01T12:34:56.789Z], locale: "en-US", format: "MMM d, yyyy h:mm a z", time_zone: "America/New_York") |> to_string()
# => "Jan 1, 2022 7:34 AM EST"
```

You can find more information about the different formatting options available in the documentation.


## Configuration

You can configure the default locale by setting the `:locale` option in your configuration.

```elixir
config :i18n_ex, :locale, "en-US"
```

## References

- JavaScript Intl documentation: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl
- This library was developed with the assistance of OpenAI's GPT-3, which provided valuable suggestions on its design and implementation.


## Copyright and License

Copyright (c) [2022], ByeongUk Choi

This library is licensed under the [MIT License](https://opensource.org/licenses/MIT). See the LICENSE file for more details.

Please note that this is just an example and you should use your own information and be sure that you have the rights to distribute your code. Also be aware of the different licences and it's terms of use before making your code available to the public.
