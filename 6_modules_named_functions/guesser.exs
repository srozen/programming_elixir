defmodule Guesser do
  def guess(n, min..max) do
    guess(n, div(min+max, 2), min..max)
  end

  defp guess(n, guess, min.._) when guess > n do
    IO.puts "Is it #{guess}"
    guess(n, min..guess-1)
  end

  defp guess(n, guess, _..max) when guess < n do
    IO.puts "Is it #{guess}"
    guess(n, guess+1..max)
  end

  defp guess(_, guess, _.._) do
    IO.puts "#{guess}"
  end
end
