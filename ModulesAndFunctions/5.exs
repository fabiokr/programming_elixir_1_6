defmodule MyMath do
  def gdc(x, 0), do: x
  def gdc(x, y), do: gdc(y, rem(x, y))
end
