maybe = fn
  1 -> with foo = 1 * 2
    do
      foo
    end
  2 -> 'woke'
  _ -> 'nope'
end

maybe.(1)
maybe.(3)
maybe.(2)
