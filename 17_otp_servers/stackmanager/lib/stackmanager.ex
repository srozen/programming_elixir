defmodule StackManager do
  @server StackManager.Server

  def start_link(list) do
    GenServer.start_link(@server, list, name: @server)
  end

  def pop do
    GenServer.call(@server, :pop)
  end

  def push(item) do
    GenServer.cast(@server, {:push, item})
  end
end
