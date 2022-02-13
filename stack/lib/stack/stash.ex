defmodule Stack.Stash do
  use GenServer

  def start_link(base_state \\ []) do
    GenServer.start_link(__MODULE__, base_state, name: __MODULE__)
  end

  def get do
    GenServer.call(__MODULE__, {:get})
  end

  def update(state) do
    GenServer.cast(__MODULE__, {:update, state})
  end

  def init(state) do
    {:ok, state}
  end


  def handle_call({:get}, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:push, new_state}, _state) do
    {:noreply, new_state}
  end
end
