

esDivisor :: Integer -> Integer -> Integer
esDivisor x y | mod x y == 0 = y
              | y >= x = x
              | otherwise = esDivisor x (y+1)


menorDivisor :: Integer -> Integer
menorDivisor x = esDivisor x 2

esPrimo :: Integer -> Bool
esPrimo n = menorDivisor n == n

mcd :: Integer -> Integer -> Integer
mcd a 0 = a 
mcd a b = mcd b (mod a b)

sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos a b | mod (menorDivisor a) b == 0 = False
                | mod (menorDivisor b) a == 0 = False
                | otherwise = True

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = buscarPrimo n 2 1
  where
    buscarPrimo :: Integer -> Integer -> Integer -> Integer
    buscarPrimo n p c
      | c == n = p
      | esPrimo (p + 1) = buscarPrimo n (p + 1) (c + 1)
      | otherwise = buscarPrimo n (p + 1) c 

