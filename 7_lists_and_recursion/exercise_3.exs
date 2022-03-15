defmodule MyList do
  def caesar([], _offset) do
    []
  end

  def caesar([head | tail], offset) do
    [_offset(head, offset) | caesar(tail, offset)]
  end

  defp _offset(elem, offset) when elem+offset > 122 do
    rem(elem+offset, 122)+96
  end

  defp _offset(elem, offset) do
    rem(elem+offset, 122)
  end
end


IO.puts MyList.caesar('ryvkve', 13)
