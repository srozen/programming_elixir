defmodule Manager do
  @name     :manager

  def start do
    pid = spawn(__MODULE__, :linker, [nil, nil])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), {:register, client_pid}
  end

  def linker(starter, current) do
    receive do
      {:register, pid} ->
        case starter do
          nil ->
            send pid, {:next, pid}
            send pid, {:tick}
            linker(pid, pid)
          _ ->
            case current do
              nil ->
                send starter, {:next, pid}
                send pid, {:next, starter}
                linker(starter, pid)
              _ ->
                send current, {:next, pid}
                send pid, {:next, starter}
                linker(starter, pid)
            end
        end
    end
  end
end

defmodule Client do
  @interval 2000
  def start do
    pid = spawn(__MODULE__, :receiver, [nil])
    Manager.register(pid)
  end

  def receiver(next) do
    receive do
      {:tick} ->
        IO.puts "tock in client"
        :timer.sleep @interval
        unless next == nil, do: send next, {:tick}
        receiver(next)
      {:next, new_next} ->
        receiver(new_next)
    end
  end
end

#Node.connect(:node_two@foxhound)
#c("nodes_3.ex")
#Manager.start
