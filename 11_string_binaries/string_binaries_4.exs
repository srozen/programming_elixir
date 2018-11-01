defmodule Parse do
  def calculate(calculus) do
    calculate(calculus, 0)
  end

  defp calculate([], acc) do
    acc
  end

  defp calculate([?+|tail], acc) do
    acc + calculate(tail, 0)
  end

  defp calculate([?-|tail], acc) do
    acc - calculate(tail, 0)
  end

  defp calculate([?*|tail], acc) do
    acc * calculate(tail, 0)
  end

  defp calculate([?/|tail], acc) do
    acc / calculate(tail, 0)
  end

  defp calculate([head|tail], acc) do
    calculate(tail, (10*acc)+head - ?0)
  end
end
