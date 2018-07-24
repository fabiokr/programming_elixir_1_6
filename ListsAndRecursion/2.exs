defmodule MyList do
  def max([]) do
    nil
  end

  def max([head | []]) do
    head
  end

  def max([head | [tail_head | tail]]) do
    if head > tail_head do
      max([head|tail])
    else
      max([tail_head|tail])
    end
  end
end
