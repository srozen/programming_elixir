defmodule Stack do
  use GenServer

  def init(base_stack) do
    {:ok, base_stack}
  end


  def handle_call(:pop, _from, stack) do
    case stack do
      [] ->
        {:reply, [], []}
      [head | tail] ->
        {:reply, head, tail}
    end
  end

  def handle_cast({:push, item}, stack) do
    {:noreply, [item|stack]}
  end
end
