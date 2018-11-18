defmodule StackManager.Server do
  use GenServer
  def init(list) do
    {:ok, list}
  end

  def terminate(reason, _) do
    IO.puts "#{inspect reason}"
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
    case item do
      [] ->
        System.stop(0)
      _ ->
        {:noreply, [item|list]}
    end
  end
end
