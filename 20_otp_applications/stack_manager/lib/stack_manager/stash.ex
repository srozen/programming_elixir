defmodule StackManager.Stash do
  use GenServer

  @me __MODULE__

  # API

  def start_link(initial_stack) do
    GenServer.start_link(__MODULE__, initial_stack, name: @me)
  end

  def get() do
    GenServer.call(@me, {:get})
  end

  def update(list) do
    GenServer.cast(@me, {:update, list})
  end

  # Server Implementation

  def init(initial_stack) do
    {:ok, initial_stack}
  end

  def handle_call({:get}, _from, current_stack) do
    {:reply, current_stack, current_stack}
  end

  def handle_cast({:update, new_stack}, _) do
    {:noreply, new_stack}
  end
end
