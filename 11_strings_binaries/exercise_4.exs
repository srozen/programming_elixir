defmodule Parse do
  def calculate(charstring) do
    _calculate(charstring, 0)
  end

  defp _calculate([?\s | tail], acc) do
    _calculate(tail, acc)
  end

  defp _calculate([?+ | tail], acc) do
    acc + _calculate(tail, 0)
  end

  defp _calculate([?- | tail], acc) do
    acc - _calculate(tail, 0)
  end

  defp _calculate([?* | tail], acc) do
    acc * _calculate(tail, 0)
  end

  defp _calculate([?/ | tail], acc) do
    acc / _calculate(tail, 0)
  end

  defp _calculate([head | tail], acc) do
    _calculate(tail, acc*10 + head - ?0)
  end

  defp _calculate([], acc) do
    acc
  end
end

IO.puts Parse.calculate('123+27')
IO.puts Parse.calculate('123-27')
IO.puts Parse.calculate('60 / 20')
