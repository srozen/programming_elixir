defmodule Stack.Server do
  use GenServer

  def start_link(base_stack \\ []) do
    GenServer.start_link(__MODULE__, base_stack, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, {:pop})
  end

  def push(item) do
    GenServer.cast(__MODULE__, {:push, item})
  end

  def init(_) do
    {:ok, Stack.Stash.get}
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
      item when is_integer(item) -> raise ArgumentError, message: "Integers forbidden in this stack"
      item -> {:noreply, [item|stack]}
    end
  end

  def terminate(_reason, state) do
    Stack.Stash.update(state)
  end
end
