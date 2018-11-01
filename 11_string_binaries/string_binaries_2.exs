defmodule Myparser do
  def anagram?(word1, word2) when length(word1) == length(word2) do
    anagram?(word1, word2, true)
  end

  defp anagram?(_,_,false) do
    false
  end

  defp anagram?(_,[],truth) do
    truth
  end

  defp anagram?([head|tail], word2, _) do
    anagram?(tail, word2--[head], head in word2)
  end
end
