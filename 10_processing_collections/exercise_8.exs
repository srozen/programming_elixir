defmodule Taxes do
  def apply_taxes(orders, rates) do
    for order <- orders do
      case rates[order[:ship_to]] do
        nil -> order
        rate -> Keyword.merge(order, [total_amount: order[:net_amount]*((100+rate)/100)])
      end
    end
  end
end

tax_rates = [ NC: 0.075, TX: 0.08 ]

orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount:  35.50 ],
  [ id: 125, ship_to: :TX, net_amount:  24.00 ],
  [ id: 126, ship_to: :TX, net_amount:  44.80 ],
  [ id: 127, ship_to: :NC, net_amount:  25.00 ],
  [ id: 128, ship_to: :MA, net_amount:  10.00 ],
  [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  [ id: 130, ship_to: :NC, net_amount:  50.00 ]
]

Taxes.apply_taxes(orders, tax_rates)
|> IO.inspect
