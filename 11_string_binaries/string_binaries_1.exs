defmodule Myparser do
  def printable_ascii?(number) do
    Enum.all?(number, &(&1 in 32..126))
  end
end
