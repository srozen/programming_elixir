defmodule MyList do
  def span(from, to) when from < to and is_number(from) and is_number(to) do
    [from | span(from+1, to)]
  end

  def span(from, to) when from == to and is_number(from) and is_number(to) do
    [from]
  end
end


MyList.span(344,356)
|> inspect(charlists: :as_lists)
|> IO.puts
