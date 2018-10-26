defmodule Summer do
  def sum(n) do
    summ(n, 0)
  end

  defp summ(0, total) do
    total
  end

  defp summ(n, total) do
    summ(n-1, total+n)
  end
end
