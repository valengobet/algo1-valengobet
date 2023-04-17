fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n | n < 0 = error "No esta definido para numeros negativos"
            | otherwise = fibonacci (n-1) + fibonacci (n-2)