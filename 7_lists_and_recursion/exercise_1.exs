defmodule MyList do
  def mapsum(list, function) do
    _mapsum(list, function, 0)
  end

  defp _mapsum([], _function, accumulator) do
    accumulator
  end

  defp _mapsum([head | tail], function, accumulator) do
    _mapsum(tail, function, accumulator + function.(head))
  end
end


IO.puts MyList.mapsum([1,2,3], &(&1 * &1))
IO.puts MyList.mapsum([1,2,3], &(&1 + &1))
