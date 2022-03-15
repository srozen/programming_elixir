defmodule ControlFlow do
  def ok!(arbitrary) do
    case arbitrary do
      {:ok, data} -> data
      other -> "Unexpected param : #{Kernel.inspect other}"
    end
  end
end


ControlFlow.ok!(File.open("exercise_1.ex"))
ControlFlow.ok!(11)
