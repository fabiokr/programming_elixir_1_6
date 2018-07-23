defmodule Chop do
  def guess(n, x..y) do
    g = div(x, 2) + div(y, 2)
    IO.puts "Is it #{g}?"
    try_guess(n, x..y, g)
  end

  def try_guess(n, _, n), do: IO.puts n
  def try_guess(n, x.._, g) when g > n, do: guess n, x..g
  def try_guess(n, _..y, g) when g < n, do: guess n, g..y
end
