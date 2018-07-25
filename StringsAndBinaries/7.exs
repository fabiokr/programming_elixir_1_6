defmodule Tax do
  @tax_rates [ NC: 0.075, TX: 0.08 ]

  def add(orders) do
    for order = [id: id, ship_to: ship_to, net_amount: net_amount] <- orders do
      tax = net_amount * Keyword.get(@tax_rates, ship_to, 0)
      Keyword.put order, :total_amount, net_amount + tax
    end
  end

  def from_csv do
    { :ok, file } = File.open("7.csv")

    file
      |> IO.stream(:line)
      |> Enum.with_index
      |> Enum.map(&csv_to_param/1)
      |> Enum.reject(&(&1 == []))
      |> add
  end

  def csv_to_param({ _csv, 0 }) do
    []
  end

  def csv_to_param({ csv, _ }) do
    [id, ship_to, net_amount] = csv
          |> String.trim
          |> String.split(",")
    [ id: String.to_integer(id), ship_to: String.to_atom(ship_to), net_amount: String.to_float(net_amount) ]
  end
end
