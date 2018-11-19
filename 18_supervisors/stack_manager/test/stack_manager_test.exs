defmodule StackManagerTest do
  use ExUnit.Case
  doctest StackManager

  test "greets the world" do
    assert StackManager.hello() == :world
  end
end
