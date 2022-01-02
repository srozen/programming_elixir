defmodule Scratch do
  def foo(1, n) do
    IO.puts("One")
  end

  def foo(_, n) do
    IO.puts("Two")
  end
end
