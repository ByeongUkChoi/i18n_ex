defmodule I18nExTest do
  use ExUnit.Case
  doctest I18nEx

  test "greets the world" do
    assert I18nEx.hello() == :world
  end
end
