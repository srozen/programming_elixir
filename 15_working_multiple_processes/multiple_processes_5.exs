defmodule Spawner do
  import :timer, only: [sleep: 1]

  def send_parent(parent) do
    send parent, {self(), "Goodbye, Daddy"}
    raise RuntimeError
  end

  def receive_messages do
    receive do
      msg ->
        IO.puts inspect msg
        receive_messages()
    end
  end

  def run do
    spawn_monitor(Spawner, :send_parent, [self()])
    sleep 500
    receive_messages()
  end


end

Spawner.run
