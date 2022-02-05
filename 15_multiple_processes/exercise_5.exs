import :timer, only: [sleep: 1]
defmodule Links do
  def contact_parent_die(parent) do
    send parent, "I will die soon"
    raise "DIE"
  end

  def rcv do
    receive do
      message -> IO.inspect(message)
      rcv()
    end
  end
end

spawn_monitor(Links, :contact_parent_die, [self()])

sleep 500
Links.rcv()
