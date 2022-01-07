defmodule StringBin do
  def anagram?(word1, word2) do
    Enum.reverse(word1) == word2
  end
end
