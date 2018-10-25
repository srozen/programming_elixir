content = "fizzbuzz"
fuzz = with content = "fuzzbizz"
       do "foobar #{content}"
       end
IO.puts content
IO.puts fuzz
