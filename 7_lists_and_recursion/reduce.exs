defmodule ListOps do
  def reduce([], _function, accumulator) do
    accumulator
  end

  def reduce([head | tail], function, accumulator) do
    reduce(tail, function, function.(head, accumulator))
  end
end
