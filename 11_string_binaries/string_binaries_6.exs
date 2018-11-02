defmodule Parse do
  def foo(string) do
    String.trim_trailing(string, ". ")
    |> String.split(". ")
    |> Enum.map(&(String.trim(&1)))
    |> Enum.map(&(String.capitalize(&1)))
    |> Enum.map(&(String.pad_trailing(&1, String.length(&1)+2, ". ")))
    |> Enum.join("")
  end
end

IO.puts Parse.foo("oh. a DOG. Woof. ")
