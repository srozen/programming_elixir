fiz = fn
  0, 0, _ -> 'FizzBuzz'
  0, _, _ -> 'Fizz'
  _, 0, _ -> 'Buzz'
  _, _, n -> n
end

fizzbuzz = fn n -> fiz.(rem(n,3), rem(n,5), n) end

fizzbuzz.(10)
fizzbuzz.(11)
fizzbuzz.(12)
fizzbuzz.(13)
fizzbuzz.(14)
fizzbuzz.(15)
fizzbuzz.(16)
