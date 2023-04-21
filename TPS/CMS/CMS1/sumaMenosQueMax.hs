-- No editar esta parte
main :: IO ()
main = do
  x <- readLn
  print (sumaMenosQueMax (x :: (Int, Int, Int)))

sumaMenosQueMax :: (Int, Int, Int) -> Bool
-- Completar acá la definición de la función
sumaMenosQueMax (t0, t1, t2) = max3 t0 t1 t2 > min3 t0 t1 t2 + medio t0 t1 t2
                             

-- Pueden agregan las funciones que consideren necesarias
max3 :: Int -> Int -> Int -> Int
max3 t0 t1 t2 | max2 t0 t1 > max2 t1 t2 = max t0 t1 
              | otherwise = max2 t1 t2

max2 :: Int -> Int -> Int
max2 a b | a > b = a
         | otherwise = b 

min3 :: Int -> Int -> Int -> Int
min3 t0 t1 t2 | max2 t0 t1 < max2 t1 t2 = max t0 t1 
              | otherwise = max2 t1 t2

min2 :: Int -> Int -> Int
min2 a b | a < b = a
         | otherwise = b 

medio :: Int -> Int -> Int -> Int
medio t0 t1 t2 = eligePermutacion (t0, t1, t2) (t0, t1, t2)


eligePermutacion :: (Int, Int, Int) -> (Int, Int, Int) -> Int
eligePermutacion (l0, l1, l2) (t0, t1, t2) | permutacionOrdenada (l0, l1, l2) (t0, t1, t2) = t1
                                           | permutacionOrdenada (l0, l2, l1) (t0, t1, t2) = t2
                                           | permutacionOrdenada (l1, l0, l2) (t0, t1, t2) = t0
                                           | permutacionOrdenada (l2, l0, l1) (t0, t1, t2) = t0
                                           | permutacionOrdenada (l1, l2, l0) (t0, t1, t2) = t2
                                           | permutacionOrdenada (l2, l1, l0) (t0, t1, t2) = t1

permutacionOrdenada :: (Int, Int, Int) -> (Int, Int, Int) -> Bool
permutacionOrdenada (l0, l1, l2) (t0, t1, t2) = esPermutacion (l0, l1, l2) (t0, t1, t2) && l0 <= l1 && l1 <= l2 

esPermutacion :: (Int, Int, Int) -> (Int, Int, Int) -> Bool
esPermutacion (l0, l1, l2) (t0, t1, t2) = cantidadDeApariciones t0 [t0, t1, t2] == cantidadDeApariciones t0 [l0, l1, l2] && cantidadDeApariciones t1 [t0, t1, t2] == cantidadDeApariciones t1 [l0, l1, l2] && cantidadDeApariciones t2 [t0, t1, t2] == cantidadDeApariciones t2 [l0, l1, l2]


cantidadDeApariciones :: Int -> [Int] -> Int
cantidadDeApariciones _ [] = 0
cantidadDeApariciones n (x:xs) | n == x = cantidadDeApariciones n xs  + 1
                               | otherwise = cantidadDeApariciones n xs

        
