defmodule ControlFlow do
  def fizzbuzz(n) when n > 0 do
    1..n
    |> Enum.map(&(fizzbuzz_(&1)))
  end

  defp fizzbuzz_(n) do
    case fb(n) do
      {0,0,_} -> "FizzBuzz"
      {0,_,_} -> "Fizz"
      {_,0,_} -> "Buzz"
      _ -> n
    end
  end

  defp fb(n) do
    {rem(n,3), rem(n,5), n}
  end

end

IO.inspect ControlFlow.fizzbuzz(15)
