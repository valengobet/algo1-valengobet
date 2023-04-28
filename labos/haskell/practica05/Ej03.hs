import Ej01

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Integer] -> Integer
productoria [] = 0
productoria [x] = x
productoria (x:xs) = x * productoria xs

maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs) | x >= head xs && x >= maximo xs = x
              | otherwise = maximo xs

sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n (x:xs) = (x + n) : sumarN n xs

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo (x:xs) = sumarN (head (reverso (x:xs))) (x:xs)

esPar :: Integer -> Bool
esPar x = mod x 2 == 0

pares :: [Integer] -> [Integer]
pares [] = []

pares (x:xs) | esPar x = (x : pares xs)
             | otherwise = pares xs


esMultiplo :: Integer -> Integer -> Bool
esMultiplo x n = mod x n == 0

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs) | esMultiplo x n = (x : multiplosDeN n xs)
                      | otherwise = multiplosDeN n xs



minimo :: [Integer] -> Integer
minimo [x] = x
minimo (x:xs) | x <= head xs && x <= minimo xs = x
              | otherwise = minimo xs
              
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar [x] = [x]
ordenar (x:xs) | maximo (x:xs) == x = ordenar xs ++ [x]
               | minimo (x:xs) == x = x : ordenar xs
               | otherwise = ordenar (xs ++ [x])