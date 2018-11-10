iex --sname "node_one"
iex --sname "node_two"
Node.connect :node_two@foxhound

func = fn -> IO.puts(Enum.join(File.ls!, ",")) end
Node.spawn(:node_one@foxhound, func)
Node.spawn(:node_two@foxhound, func)
