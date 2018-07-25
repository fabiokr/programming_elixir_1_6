defmodule Exercise do
  def anagram?(word1, word2) do
    (Enum.count(word1) == Enum.count(word2)) &&
      Enum.all?(word1, &(&1 in word2))
  end
end
