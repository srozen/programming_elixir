defmodule Chop do
  def guess(number, a..b) do
    IO.puts("Is it #{div(a+b,2)} ?")
    _guess(number, div(a+b,2), a..b)
  end

  defp _guess(number, guessed, _) when number === guessed do
    IO.puts(guessed)
  end

  defp _guess(number, guessed, _..b) when guessed < number do
    guess(number, guessed+1..b)
  end

  defp _guess(number, guessed, a.._) when guessed > number do
    guess(number, a..guessed-1)
  end
end
