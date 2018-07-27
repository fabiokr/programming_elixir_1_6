defmodule Ticker do

  @name :ticker

  def start do
    pid = spawn_link(__MODULE__, :generator, [[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator(clients) do
    receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        updated_clients = clients ++ [pid]

        Enum.each updated_clients, fn client ->
          send client, { :update, updated_clients }
        end

        # kickoff
        if Enum.empty?(clients) do
          IO.puts "kicking off #{inspect pid}"
          send(pid, { :tick })
        end

        generator(updated_clients)
    end
  end
end

defmodule Client do
  @interval 2000   # 2 seconds

  def start do
    pid = spawn_link(__MODULE__, :receiver, [[]])
    Ticker.register(pid)
  end

  def receiver(clients) do
    receive do
      { :update, updated_clients } ->
        receiver(updated_clients)
      { :tick } ->
        IO.puts "tock in client"

        Process.sleep(@interval)

        # finds the next client and tick it
        index = Enum.find_index(clients, &(&1 == self()))
        next = Enum.at(clients, index + 1, Enum.at(clients, 0))
        send(next, { :tick })

        receiver(clients)
    end
  end
end
