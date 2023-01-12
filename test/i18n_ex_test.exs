defmodule I18nExTest do
  use ExUnit.Case, async: true
  doctest I18nEx

  test "default locale is `en-US`" do
    Application.delete_env(:i18n_ex, :locale)
    assert I18nEx.current_locale() == "en-US"
  end

  test "set locale from config" do
    new_locale = "ko-KR"
    Application.put_env(:i18n_ex, :locale, new_locale)
    on_exit(fn -> Application.delete_env(:i18n_ex, :locale) end)

    assert I18nEx.current_locale() == new_locale
  end
end
