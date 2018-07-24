defmodule MyList do
  def mapsum([], value, _) do
    value
  end

  def mapsum([head | tail], value \\ 0, func) do
    mapsum(tail, func.(head) + value , func)
  end
end
