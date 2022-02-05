defmodule TokenRepeater do
  def repeat do
    receive do
      {sender, secret} ->
        send sender, {:ok, secret}
    end
  end
end

one = spawn(TokenRepeater, :repeat, [])
two = spawn(TokenRepeater, :repeat, [])

send one, {self(), "fred"}
send two, {self(), "betty"}

receive do
  {:ok, secret} -> IO.inspect(secret)
end

receive do
  {:ok, secret} -> IO.inspect(secret)
end
