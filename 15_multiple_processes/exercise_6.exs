defmodule Parallel do
  def pmap(collection, func) do
    me = self()
    collection
    |> Enum.map(fn elem ->
      # If not using "me" here, the spawned process would send
      # the message to itself. Indeed the self() call is inside
      # a block which will be evaluated when executed by the spawned
      # process.
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
