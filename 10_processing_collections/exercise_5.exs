defmodule MyEnum do
  def all?(list, predicate) do
    _all?(list, predicate, true)
  end

  defp _all?([], _, status) do
    status
  end

  defp _all?([head | tail], predicate, status) do
    if predicate.(head) do
      _all?(tail, predicate, status)
    else
      false
    end
  end

  def each([], _) do
    :ok
  end

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _) do
    []
  end

  def filter([head | tail], predicate) do
    if predicate.(head) do
      [head | filter(tail, predicate)]
    else
      filter(tail, predicate)
    end
  end

  def split(list, index) do
    _split([], list, index)
  end

  def _split(acc, rem, 0) do
    {Enum.reverse(acc), rem}
  end

  def _split(acc, [head | tail], index) do
    _split([head|acc], tail, index-1)
  end

  def take(list, number) do
    {res, _} = split(list, number)
    res
  end
end

MyEnum.all?([1,2,3], &(rem(&1, 2) == 0))
|> IO.puts
MyEnum.all?([2,4,6], &(rem(&1, 2) == 0))
|> IO.puts

MyEnum.each([1,2,3], &IO.puts/1)

MyEnum.filter([1,2,3,4,5], &(rem(&1, 2) == 0))
|> inspect(charlists: :as_lists)
|> IO.puts

MyEnum.split([1,2,3,4], 2)
|> inspect(charlists: :as_lists)
|> IO.puts
MyEnum.split([1,2,3,4], 3)
|> inspect(charlists: :as_lists)
|> IO.puts
MyEnum.split([1,2,3,4], 4)
|> inspect(charlists: :as_lists)
|> IO.puts

MyEnum.take([1,2,3,4], 2)
|> inspect(charlists: :as_lists)
|> IO.puts
