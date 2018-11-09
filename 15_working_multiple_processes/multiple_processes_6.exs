defmodule Parallel do
  def pmap(collection, fun) do
    me = self() # Important otherwise ->
    collection
    |> Enum.map(fn (elem) ->
      # The spawned process will use it's own self() here instead of me 
      spawn_link(fn -> (send me, {self(), fun.(elem)}) end)
    end)
    |> Enum.map(fn (pid) ->
      receive do
        { ^pid, result} ->
          result
      end
    end)
  end
end
