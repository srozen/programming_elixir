defmodule ControlFlow do
  def fizzbuzz(number) do
    _fizzbuzz(rem(number,3), rem(number, 5), number)
  end

  defp _fizzbuzz(remainder3, remainder5, number) do
    case {remainder3, remainder5} do
      {0,0} -> "Fizzbuzz"
      {0,_} -> "Fizz"
      {_,0} -> "Buzz"
      {_,_} -> number
    end
  end
end


ControlFlow.fizzbuzz(10)
ControlFlow.fizzbuzz(11)
ControlFlow.fizzbuzz(12)
ControlFlow.fizzbuzz(13)
ControlFlow.fizzbuzz(14)
ControlFlow.fizzbuzz(15)
ControlFlow.fizzbuzz(16)
