defmodule Exercise do
  # Exercise.center(["cat", "zebra", "elephant"])
  def center(list) do
    longest = list |> Enum.map(&String.length/1) |> Enum.max

    for s <- list do
      pad = (longest - String.length(s)) |> div(2)
      IO.puts "#{String.duplicate(" ", pad)}#{s}"
    end
  end
end
