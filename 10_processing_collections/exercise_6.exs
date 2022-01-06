defmodule MyEnum do
  def flatten(list) do
    flatten(list, [])
    |> Enum.reverse
  end

  def flatten([head | tail], acc) when head == [] do
    flatten(tail, acc)
  end

  def flatten([head | tail], acc) when is_list(head) do
    flatten(tail, flatten(head, acc))
  end

  def flatten([head | tail], acc) do
    flatten(tail, [head | acc])
  end

  def flatten([], acc) do
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
