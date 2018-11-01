defmodule Mylist do

  def caesar([], _) do
    []
  end

  def caesar([head|tail], offset) do
    [rem(rem(head, 96)+offset, 26)+96|caesar(tail, offset)]
  end

  def span(to , to) do
    [to]
  end

  def span(from, to) do
    [from|span(from+1, to)]
  end


  def map([], _) do
    []
  end

  def map([head|tail], fun) do
    [ fun.(head) | map(tail, fun) ]
  end

  def mapsum(list, fun) do
    mapsum(list, fun, 0)
  end

  defp mapsum([], _, acc) do
    acc
  end

  defp mapsum([head|tail], fun, acc) do
    mapsum(tail, fun, acc+fun.(head))
  end

  def maxlist([]) do
    :nil
  end

  def maxlist([head|[]]) do
    head
  end

  def maxlist([head|tail]) do
    maxlist(tail, head)
  end

  def maxlist([], maximum) do
    maximum
  end

  def maxlist([head|tail], maximum) when head > maximum do
    maxlist(tail, head)
  end

  def maxlist([_|tail], maximum)  do
    maxlist(tail, maximum)
  end

  def len(list) do
    len(list, 0)
  end

  defp len([], acc) do
    acc
  end

  defp len([_|tail], acc) do
    len(tail, acc+1)
  end

  def square([]) do
    []
  end

  def square([head|tail]) do
    [(head * head)|square(tail)]
  end
end
