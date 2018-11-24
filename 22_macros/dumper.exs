defmodule My do
  defmacro macro(param) do
    IO.inspect param
  end
end

defmodule Test do
  require My

  # The values represent themselves
  My.macro :atom
  My.macro 1
  My.macro [1,2,3]
  My.macro "binaries"

  # These are represented by 3 elements tuples
  My.macro do: (a= 1; a+a)
end
