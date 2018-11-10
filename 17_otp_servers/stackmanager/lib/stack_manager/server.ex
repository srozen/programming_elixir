defmodule StackManager.Server do
  use GenServer
  def init(list) do
    {:ok, list}
  end

  def handle_call(:pop, _from, list) do
    case list do
      [head|tail] ->
        {:reply, head, tail}
      [] ->
        {:reply, [], []}
    end
  end

  def handle_cast({:push, item}, list) do
    {:noreply, [item|list]}
  end
end
