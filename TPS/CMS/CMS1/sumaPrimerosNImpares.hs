-- No editar esta parte
main :: IO()
main = do {
  x <- readLn ;
  print(sumaPrimerosNImpares(x ::(Integer)))
  }

sumaPrimerosNImpares :: Integer -> Integer
-- Completar la definición de la función
sumaPrimerosNImpares n = sumatoria n (2*n -1)

-- Pueden agregan las funciones que consideren necesarias
sumatoria :: Integer -> Integer -> Integer
sumatoria n i| i == 1 = 4
             | mod i 2 == 0 = 0 + sumatoria n (i-1)
             | otherwise = (2*i + 2) + sumatoria n (i-1)




