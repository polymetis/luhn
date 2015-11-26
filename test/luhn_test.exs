defmodule LuhnTest do
  use ExUnit.Case
  doctest Luhn

  test "valid number" do
    assert Luhn.test(49927398716) == :valid
  end
  test "invalid number" do
    assert Luhn.test(49927398717) == :invalid
  end
end
