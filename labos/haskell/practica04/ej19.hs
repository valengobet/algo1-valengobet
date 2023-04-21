esDivisor :: Integer -> Integer -> Integer
esDivisor x y | mod x y == 0 = y
              | y >= x = x
              | otherwise = esDivisor x (y+1)


menorDivisor :: Integer -> Integer
menorDivisor x = esDivisor x 2

esPrimo :: Integer -> Bool
esPrimo n = menorDivisor n == n

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = buscarPrimo n 2 1
  where
    buscarPrimo :: Integer -> Integer -> Integer -> Integer
    buscarPrimo n p c
      | c == n = p
      | esPrimo (p + 1) = buscarPrimo n (p + 1) (c + 1)
      | otherwise = buscarPrimo n (p + 1) c 



sumaInicialDePrimos :: Integer -> Bool
sumaInicialDePrimos n = restaPrimos n 1

restaPrimos :: Integer -> Integer -> Bool
restaPrimos n i | n < 0 = False
                | n - nEsimoPrimo i == 0 = True
                | otherwise = restaPrimos (n - nEsimoPrimo i) (i+1)