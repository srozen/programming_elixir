defmodule Sequence.Server do
  use GenServer
  alias Sequence.Impl

  def init(initial_number) do
    {:ok, initial_number}
  end

  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, Impl.next(nextcurrent_number)}
  end

  def handle_call({:set_number, new_number}, _from, _current_number) do
    {:reply, new_number, new_number}
  end

  def handle_cast({:increment_number, delta}, current_number) do
    {:noreply, Impl.increment(current_number, delta)}
  end

  def format_status(_reason, [ _pdict, state]) do
    [data: [{'State', "My current state is '#{state}', and I'm happy"}]]
  end
end