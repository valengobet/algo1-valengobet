eliminarYContarRepetidos :: [Int] -> ([Int], [(Int, Int)])
eliminarYContarRepetidos lista = (eliminaRepetidos lista, cuentaRepetidos lista)

eliminaRepetidos :: [Int] -> [Int]
eliminaRepetidos [] = []
eliminaRepetidos (x:xs) | pertenece x xs = eliminaRepetidos xs 
                        | otherwise = x : eliminaRepetidos xs

pertenece :: Int -> [Int] -> Bool
pertenece _ [] = False
pertenece e (x:xs) | e == x = True
                   | otherwise = pertenece e xs

cuentaRepetidos :: [Int] -> [(Int, Int)]
cuentaRepetidos [] = []
cuentaRepetidos (x:xs) = (x, apariciones x (x:xs)) : cuentaRepetidos(eliminaElemento x xs)

eliminaElemento :: Int -> [Int] -> [Int]
eliminaElemento _ [] = []
eliminaElemento e (x:xs) | e == x = eliminaElemento e xs
                         | otherwise = x : eliminaElemento e xs

apariciones :: Int -> [Int] -> Int
apariciones _ [] = 0
apariciones e (x:xs) | e == x = 1 + apariciones e xs
                     | otherwise = apariciones e xs