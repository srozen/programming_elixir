defmodule Factorial do
  def fact(n) do
    facto(n,1)
  end

  defp facto(0,f) do
    f
  end

  defp facto(n,f) do
    facto(n-1, f*n)
  end
end
