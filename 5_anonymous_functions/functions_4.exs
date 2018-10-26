prefix = fn pref -> fn name -> "#{pref} #{name}" end end

mrs = prefix.("Mrs")
mrs.("Smith")

prefix.("Elixir").("Rocks")
