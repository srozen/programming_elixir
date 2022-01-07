defmodule MyModule do
  def center(list) do
    max_len = Enum.max_by(list, &(String.length(&1))) |> String.length
    Enum.each(
      list,
      fn elem ->
        len = div((max_len - String.length(elem)), 2)
        "#{String.pad_leading("", len)}#{elem}"
        |> IO.puts()
      end
    )
  end
end

MyModule.center(["cat", "zebra", "elephant", "diplodocus"])
