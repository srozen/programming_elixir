defmodule Enume do
  def all?(enum, fun) do
    all?(enum, fun, true)
  end

  defp all?([], _, truth) do
    truth
  end

  defp all?([head|tail], fun, truth) do
    all?(tail, fun, truth&&fun.(head))
  end

  def each([], _) do
    []
  end

  def each([head|tail], fun) do
    [fun.(head)|each(tail, fun)]
  end


  def filter([], fun) do
    []
  end

  def filter([head|tail], fun) do
    if fun.(head) do
      [head|filter(tail,fun)]
    else
      filter(tail, fun)
    end
  end

  def split(list, index) do
    split(list, index, index, list)
  end

  def split(tail, 0, index, list) do
    {take(list, index), tail}
  end

  def split([_|tail], index, or_index, list) do
    split(tail, index-1, or_index, list)
  end

  def take(_, 0) do
    []
  end

  def take([head|tail], index) do
    [head|take(tail, index-1)]
  end

  def flatten(list) do
    flatten(list, [])
    |> Enum.reverse
  end

  def flatten([h | t], acc) when h == [] do
    flatten(t, acc)
  end

  def flatten([h | t], acc) when is_list(h) do
    flatten(t, flatten(h, acc))
  end

  def flatten([h | t], acc) do
    flatten(t, [h | acc])
  end

  def flatten([], acc) do
    acc
  end


end
