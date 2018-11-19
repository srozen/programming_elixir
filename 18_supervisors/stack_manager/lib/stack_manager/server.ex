defmodule StackManager.Server do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(item) do
    GenServer.cast(__MODULE__, {:push, item})
  end

  def init(_) do
    {:ok, StackManager.Stash.get()}
  end

  def terminate(_, stack) do
    StackManager.Stash.update(stack)
  end

  def handle_call(:pop, _from, stack) do
    case stack do
      [top|bottom] ->
        {:reply, top, bottom}
    end
  end

  def handle_cast({:push, item}, stack) do
    {:noreply, [item|stack]}
  end
end
