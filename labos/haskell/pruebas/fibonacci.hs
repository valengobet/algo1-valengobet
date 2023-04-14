-- fib(0) = 0, fib(1) = 1, otherwise fib(n) = fib(n-1) + fib(n-2)

-- fib(3) = fib(2) + fib(1)
-- fib(3) = fib(1) + fib(0) + fib(1) 
-- fib(3) =   1    +   0    +  1  = 2


fib :: Integer -> Integer
fib(0) = 0
fib(1) = 1

fib n | n >= 0 = fib(n-1) + fib(n-2)
      | otherwise = error "Fibonacci no esta definido para numeros negativos"
