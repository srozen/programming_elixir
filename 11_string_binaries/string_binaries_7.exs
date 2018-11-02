defmodule Taxes do
  def apply_taxes_from_file(file, tax_rates) do
    {:ok, file_ref} = File.open(file, [:read])
    get_data(file_ref)
    |> apply_taxes(tax_rates)
    |> IO.inspect
    File.close(file_ref)
  end

  def apply_taxes(orders, tax_rates) do
    for [id: id, ship_to: state, net_amount: net_amount] <- orders,
      do: [id: id, ship_to: state, total_amount: apply_tax(net_amount, tax_rates[state])]
  end

  def apply_tax(net_amount, nil) do
    net_amount
  end

  def apply_tax(net_amount, rate) do
    net_amount + (net_amount*rate)
  end

  defp get_data(file) do
    IO.read(file, :line)
    |> get_headers()
    |> produce_data(file)
  end

  defp get_headers(string_line) do
    String.trim(string_line)
    |> String.split(",")
  end

  defp produce_data(headers, file_desc) do
    IO.stream(file_desc, :line)
    |> Enum.map(&(String.trim(&1)))
    |> Enum.map(&(String.replace(&1,":", "")))
    |> Enum.map(&(String.split(&1, ",")))
    |> Enum.map(&(unite_headers_data(headers,&1)))
  end

  defp unite_headers_data([id, ship_to, net_amount], [id_val, ship_val, net_val]) do
    [
      "#{id}": String.to_integer(id_val),
      "#{ship_to}": String.to_atom(ship_val),
      "#{net_amount}": String.to_float(net_val)
    ]
  end
end

tax_rates = [NC: 0.075, TX: 0.08]

Taxes.apply_taxes_from_file("sales.csv", tax_rates)
