defmodule Sequence.Stash do
  use GenServer

  @me __MODULE__

  # API

  def start_link({initial_number, delta}) do
    GenServer.start_link(__MODULE__, {initial_number, delta}, name: @me)
  end

  def get() do
    GenServer.call(@me, {:get})
  end

  def update(new_number) do
    GenServer.cast(@me, {:update, new_number})
  end

  # Server Implementation

  def init({initial_number, delta}) do
    {:ok, %Sequence.Server.State{current_number: initial_number, delta: delta}}
  end

  def handle_call({:get}, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:update, new_state}, _old_state) do
    {:noreply, new_state}
  end
end
