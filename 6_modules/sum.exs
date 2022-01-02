defmodule Sum do
  def of(n) when is_integer(n) and n >= 0 do
    _of(n, 0)
  end

  defp _of(0, acc) do
    acc
  end

  defp _of(n, acc) do
    _of(n-1, acc+n)
  end
end
