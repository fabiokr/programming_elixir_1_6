defmodule Exercise do
  def process(sender) do
    receive do
      "Ping!" -> Enum.each(1..10, fn
                       n ->
                        send(sender, "Pong #{inspect(self())} #{n}!")
                     end)
    end
  end

  def run(n) do
    pids = Enum.map(1..n, fn _ -> spawn(Exercise, :process, [self()]) end)
    Enum.each(pids, fn pid -> send(pid, "Ping!") end)
    waiter()
  end

  def waiter do
    receive do
      msg -> IO.puts msg
    end

    waiter()
  end
end
