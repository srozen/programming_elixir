defmodule Taxes do
  def apply_taxes(orders, rates) do
    for order <- orders do
      case rates[order[:ship_to]] do
        nil -> order
        rate -> Keyword.merge(order, [total_amount: order[:net_amount]*((100+rate)/100)])
      end
    end
  end

  def apply_taxes_for_file(file, rates) do
    file = File.open!(file)

    keys = IO.read(file, :line)
    |> clean_line()
    |> Enum.map(&(String.to_atom(&1)))

    IO.stream(file, :line)
    |> Enum.map(fn line ->
      cleaned = clean_line(line)
      case cleaned do
        [id, ship_to, net_amount] ->
          formatted = [String.to_integer(id), String.to_atom(String.trim_leading(ship_to, ":")), String.to_float(net_amount)]
          Enum.zip(keys, formatted)
        end
    end)
    |> apply_taxes(rates)
  end

  defp clean_line(line) do
    String.trim_trailing(line)
    |> String.split(",")
  end
end

tax_rates = [ NC: 0.075, TX: 0.08 ]

Taxes.apply_taxes_for_file("orders.csv", tax_rates)
|> IO.inspect
