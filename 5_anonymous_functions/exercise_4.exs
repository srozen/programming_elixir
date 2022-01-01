prefix = fn pfx ->
  fn name ->
    "#{pfx} #{name}"
  end
end
mrs = prefix.("Mrs")
mrs.("Smith")
prefix.("Elixir").("Rocks")
