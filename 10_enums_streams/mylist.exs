defmodule Mylist do

  def span(to , to) do
    [to]
  end

  def span(from, to) do
    [from|span(from+1, to)]
  end

  def all?(enum, fun) do
    all?(enum, fun, true)
  end

  defp all?([], _, truth) do
    truth
  end

  defp all?([head|tail], fun, truth) do
    all?(tail, fun, truth&&fun.(head))
  end

  def primes(n) do
    IO.inspect for x <- span(2,n),
      Enum.all?(
        span(2,Enum.max([2,x-1])),
        &(rem(x,&1) != 0)
      ), do: x
  end
end
