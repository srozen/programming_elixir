defmodule Parallel do
  def pmap(collection, func) do
    me = self()
    collection
    |> Enum.map(fn elem ->
      spawn_link fn ->
        :timer.sleep(Enum.random(4000..8000))
        (send me, {self(), func.(elem)})
      end
    end)
    |> Enum.map(fn pid ->
      receive do
        {_pid, value} -> value
      end
    end)
  end
end
