defmodule StackmanagerTest do
  use ExUnit.Case
  doctest Stackmanager

  test "greets the world" do
    assert Stackmanager.hello() == :world
  end
end
