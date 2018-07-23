fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

solution = fn n -> IO.puts fizzbuzz.(rem(n, 3), rem(n, 5), n) end

solution.(10)
solution.(11)
solution.(12)
solution.(13)
solution.(14)
solution.(15)
solution.(16)
