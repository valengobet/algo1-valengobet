-- No editar esta parte
main :: IO()
main = do {
  x <- readLn ;
  print(combinacionesMenoresOiguales(x ::(Integer)))
  }

combinacionesMenoresOiguales :: Integer -> Integer
-- Completar la definición de la función
combinacionesMenoresOiguales n | n > 0 = sumatoria n n n
                               | otherwise = 0

sumatoria :: Integer -> Integer -> Integer -> Integer
sumatoria n i j = iteraJ n i j 

iteraJ :: Integer -> Integer -> Integer -> Integer
iteraJ n i 1 | i <= n = 1 + iteraI n (i-1) 1
             | otherwise = 0 + iteraI n (i-1) 1

iteraJ n i j | i * j > n = 0 + iteraJ n i (j-1)
             | i * j <= n = 1 + iteraJ n i (j-1)

iteraI :: Integer -> Integer -> Integer -> Integer
iteraI n 1 j | j == n = 1
             | j <= n = 1 + iteraI n 1 (j+1)
             | otherwise = 0

iteraI _ _ 0 = 0
iteraI _ 0 _ = 0

iteraI n i j | n == j && i * j <= n = 1 + iteraI n (i-1) 1
             | n == j && i * j > n = iteraI n (i-1) 1
             | i * j > n = 0 + iteraI n i (j+1)
             | i * j <= n = 1 + iteraI n i (j+1)


