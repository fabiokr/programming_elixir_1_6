defmodule MyList do
  @count 27
  @a 97
  @z 122

  def caesar([], _) do
    []
  end

  def caesar([head | tail], n) do
    x = @a + rem(head + n - @a, @count)
    [x | caesar(tail, n)]
  end
end
