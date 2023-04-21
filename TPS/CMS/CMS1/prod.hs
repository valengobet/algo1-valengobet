-- No editar esta parte
main :: IO()
main = do {
  x <- readLn ;
  print(prod(x ::(Integer)))
  }

prod :: Integer -> Integer
-- Completar la definición de la función
prod n = duplicaN (2*n)

-- Pueden agregan las funciones que consideren necesarias
duplicaN :: Integer -> Integer
duplicaN n2 | n2 == 1 = 3
            | otherwise = ((n2)^2 + 2*(n2)) * duplicaN (n2-1)