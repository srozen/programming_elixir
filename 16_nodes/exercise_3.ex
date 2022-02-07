defmodule Ticker do
  @interval 2000
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[], []])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid}
  end

  def generator(send_list, passed) do
    receive do
      {:register, client_pid} ->
        IO.puts "Registering #{inspect client_pid}"
        generator(send_list ++ [client_pid], passed)
    after
      @interval ->
        case send_list do
          [] ->
            generator(Enum.reverse(passed), [])
          [head | tail] ->
            IO.puts "Tick"
            send head, {:tick}
            generator(tail, [head | passed])
        end
    end
  end
end

defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      {:tick} ->
        IO.puts("tock in client")
        receiver()
    end

  end
end
