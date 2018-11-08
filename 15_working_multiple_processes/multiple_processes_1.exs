defmodule TokenRepeater do
  def repeat do
    receive do
      {pid, token} ->
        send pid, {:ok, token}
        repeat()
    end
  end
end

one = spawn(TokenRepeater, :repeat, [])
two = spawn(TokenRepeater, :repeat, [])

send one, {self(), "Fred"}


send two, {self(), "Betty"}


receive do
  {:ok, message} -> IO.puts message
end

receive do
  {:ok, message} -> IO.puts message
end

# No guaranty that One will take more time to answer
