defmodule MyList do
  # MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
  def flatten(list, flattened \\ [])

  def flatten([], flattened) do
    flattened
  end

  def flatten([h|t], flattened) do
    flattened = if is_list(h) do
      flatten(h, flattened)
    else
      flattened ++ [h]
    end

    flatten t, flattened
  end
end
