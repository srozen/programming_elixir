defmodule MyList do
  def span(from, to) when from < to and is_number(from) and is_number(to) do
    [from | span(from+1, to)]
  end

  def span(from, to) when from == to and is_number(from) and is_number(to) do
    [from]
  end


  def primer(n) do
    for num <- 2..n, Enum.all?(span(2, num), &(&1 == num or (rem(num, &1) != 0))) do
      num
    end
  end
end
