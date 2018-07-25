defmodule Exercise do
  @space 32
  @tilde 126

  def ascii_only?(list) do
    list
      |> Enum.all? &(&1 >= @space && &1 <= @tilde)
  end
end
