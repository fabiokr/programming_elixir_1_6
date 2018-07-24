defmodule MyEnum do
  def all?([], _) do
    true
  end

  def all?([h|t], func) do
    func.(h) && all?(t, func)
  end

  def each([], _) do
  end

  def each([h|t], func) do
    func.(h)
    each(t, func)
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

  def split(list, n, result \\ [])

  def split([], _, result) do
    result
  end

  def split(list=[h|t], n, result) do
    if Enum.count(result) < n do
      split(t, n, result ++ [h])
    else
      [result, list]
    end
  end

  def take(list, n, result \\ [])

  def take([], _, result) do
    result
  end

  def take([h|t], n, result) do
    if Enum.count(result) < n do
      take(t, n, result ++ [h])
    else
      result
    end
  end
end
