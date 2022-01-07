defmodule MyModule do
  def capitalize_sentences(sentences) do
    String.split(sentences, ". ")
    |> Enum.map(&(String.capitalize(&1)))
    |> Enum.join(". ")
  end
end

MyModule.capitalize_sentences("oh. a DOG. woof. ")
|> IO.inspect
