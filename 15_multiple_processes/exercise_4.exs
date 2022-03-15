import :timer, only: [sleep: 1]
defmodule Links do
  def contact_parent_die(parent) do
    send parent, "I will die soon"
    raise "boom"
  end

  def rcv do
    receive do
      message -> IO.inspect(message)
      rcv()
    end
  end
end

spawn_link(Links, :contact_parent_die, [self()])

sleep 500
Links.rcv()

# The exception is propagated to the parent and die
