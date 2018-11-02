defmodule Parse do

  def center(strings) do
    lengths = Enum.map(strings, fn string -> String.length(string) end)
    max = Enum.max(lengths)
    center(strings, lengths, max)
  end

  def center([], [], _) do
    :ok
  end

  def center([h1|t1], [h2|t2], max) when h2 != max do
    IO.puts String.pad_leading(h1, h2+div(max,h2))
    center(t1,t2,max)
  end

  def center([h1|t1], [_|t2], max) do
    IO.puts h1
    center(t1,t2,max)
  end
end

IO.inspect Parse.center(["cat", "zebra", "elephant"])
