defmodule Stack.Server do
  use GenServer

  def init(base_stack) do
    {:ok, base_stack}
  end


  def handle_call({:pop}, _from, stack) do
    case stack do
      [] ->
        {:reply, [], []}
      [head | tail] ->
        {:reply, head, tail}
    end
  end

  def handle_cast({:push, item}, stack) do
    case item do
      item when is_integer(item) -> System.halt(item)
      item -> {:noreply, [item|stack]}
    end
  end

  def terminate(reason, state) do
    IO.puts(reason)
    IO.puts(state)
  end
end
