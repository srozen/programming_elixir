defmodule Parallel do
  def pmap(collection, func) do
    me = self()
    collection
    |> Enum.map(fn elem ->
      spawn_link fn -> (send me, {self(), func.(elem)})  end
    end)
    |> Enum.map(fn pid ->
      receive do
        {^pid, value} -> value
      end
    end)
  end
end

Parallel.pmap 1..10000, &(&1+&1)
|> IO.puts
