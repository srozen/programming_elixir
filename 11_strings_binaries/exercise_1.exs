defmodule StringBin do
  def is_printable(string) do
    Enum.all?(string, &(&1 in 32..126))
  end
end
