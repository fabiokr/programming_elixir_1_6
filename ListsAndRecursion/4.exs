defmodule MyList do
  def span(to, to) do
    [to]
  end

  def span(from, to) do
    [from | span(from + 1, to)]
  end
end
