
sumaRacionalesAux :: Integer -> Integer -> Integer -> Integer -> Float
sumaRacionalesAux  p q n m | p > n = 0 
                           | q > m = sumaRacionalesAux (p+1) 1 n m 
                           | otherwise = fromIntegral p / fromIntegral q + sumaRacionalesAux p (q+1) n m 

sumaRacionales :: Integer -> Integer -> Float
sumaRacionales n m = sumaRacionalesAux 1 1 n m 