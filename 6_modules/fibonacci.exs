defmodule Fibonacci do
  def of(0), do: 0
  def of(1), do: 1
  def of(number) do
    _of(0, 1, 2, number)
  end

  def _of(a, b, increment, target) when increment == target do
    a + b
  end

  def _of(a, b, increment, target) do
    _of(b, a+b, increment+1, target)
  end
end
