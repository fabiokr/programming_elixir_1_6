defmodule MyList do
  def all?([], _) do
    true
  end

  def all?([h|t], func) do
    func.(h) && all?(t, func)
  end

  def filter([], _) do
    []
  end

  def filter([h|t], func) do
    if func.(h) do
      [h] ++ filter(t, func)
    else
      filter(t, func)
    end
  end

  def span(to, to) do
    [to]
  end

  def span(from, to) do
    [from | span(from + 1, to)]
  end

  def is_prime?(0) do
    false
  end

  def is_prime?(1) do
    true
  end

  def is_prime?(2) do
    true
  end

  def is_prime?(n) when n < 0 do
    false
  end

  def is_prime?(n) do
    all? span(2, n - 1), &(rem(n, &1) > 0)
  end

  def primes(from, to) do
    span(from, to)
      |> filter(&is_prime?/1)
  end
end
