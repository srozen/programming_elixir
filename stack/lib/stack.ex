defmodule Stack do
  @server Stack.Server

  def start(initial_stack \\ []) do
    GenServer.start_link(@server, initial_stack, name: @server)
  end

  def push(item) do
    GenServer.cast(@server, {:push, item})
  end

  def pop do
    GenServer.call(@server, {:pop})
  end
end
