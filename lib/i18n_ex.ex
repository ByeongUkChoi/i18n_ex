defmodule I18nEx do
  @moduledoc """
  Documentation for `I18nEx`.
  """

  def current_locale() do
    Application.get_env(:i18n_ex, :locale, "en-US")
  end
end
