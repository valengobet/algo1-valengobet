esFibonacci :: Integer -> Bool
esFibonacci n = buscarIndice 0 1
  where
    buscarIndice :: Integer -> Integer -> Bool
    buscarIndice a b
      | a == n = True
      | a > n = False
      | otherwise = buscarIndice b (a + b)

