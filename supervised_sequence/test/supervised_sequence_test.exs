defmodule SupervisedSequenceTest do
  use ExUnit.Case
  doctest SupervisedSequence

  test "greets the world" do
    assert SupervisedSequence.hello() == :world
  end
end
