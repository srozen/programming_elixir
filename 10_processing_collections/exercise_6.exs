defmodule MyEnum do
  def flatten(list) do
    _flatten(list, [])
    |> Enum.reverse
  end

  defp _flatten([head | tail], acc) when is_list(head) do
    _flatten(tail, _flatten(head, acc))
  end

  defp _flatten([head | tail], acc) when head == [] do
    _flatten(tail, acc)
  end

  defp _flatten([head | tail], acc) do
    _flatten(tail, [head | acc])
  end

  defp _flatten([], acc) do
    acc
  end
end

MyEnum.flatten([[1]])
|> inspect(charlists: :as_lists)
|> IO.puts

MyEnum.flatten([1, [2]])
|> inspect(charlists: :as_lists)
|> IO.puts

MyEnum.flatten([1, [2, 3]])
|> inspect(charlists: :as_lists)
|> IO.puts


MyEnum.flatten([1, [2, 3], [1, [2, 3]]])
|> inspect(charlists: :as_lists)
|> IO.puts
