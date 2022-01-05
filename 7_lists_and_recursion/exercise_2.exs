defmodule MyList do
  def max([]) do
    []
  end

  def max([head | tail]) do
    _max(tail, head)
  end

  defp _max([], current_max) do
    current_max
  end

  defp _max([head | tail], current_max) when head > current_max do
    _max(tail, head)
  end

  defp _max([head | tail], current_max) do
    _max(tail, current_max)
  end
end


IO.puts MyList.max([1,2,3])
IO.puts MyList.max([4,2,3])
