
sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q n m = sumaPotenciasAux q 1 1 n m

sumaPotenciasAux :: Integer -> Integer -> Integer -> Integer -> Integer -> Integer
sumaPotenciasAux q a b n m
  | a > n = 0
  | b > m = sumaPotenciasAux q (a+1) 1 n m
  | otherwise = (q^(a+b)) + sumaPotenciasAux q a (b+1) n m


