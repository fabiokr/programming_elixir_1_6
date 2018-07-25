defmodule Exercise do
  # Exercise.capitalize_sentences("oh. a DOG. woof. ")
  def capitalize_sentences(s) do
    list = s
             |> String.split(". ")
             |> Enum.map(&String.capitalize/1)
             |> Enum.join(". ")
  end
end
