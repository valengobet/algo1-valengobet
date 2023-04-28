sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs) | x == ' ' && y == ' ' = sacarBlancosRepetidos (y:xs)
                               | otherwise = x : sacarBlancosRepetidos (y:xs)

contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras [x] = 1
contarPalabras (x:y:xs) | not(x == ' ') && y == ' ' = 1 + contarPalabras (y:xs)
                        | otherwise = contarPalabras (y:xs)


cantindadDeLetras :: [Char] -> Integer
cantindadDeLetras [] = 0
cantindadDeLetras [x] = 1
cantindadDeLetras (x:xs) = 1 + cantindadDeLetras xs


aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar [x] = x
aplanar (x:xs) = x ++ aplanar xs

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos [x] = x
aplanarConBlancos (x:xs) = x ++ [' '] ++ aplanarConBlancos xs

aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [] _ = []
aplanarConNBlancos (x:xs) n = x ++ nBlancos n ++ aplanarConNBlancos xs n


nBlancos :: Integer -> [Char]
nBlancos 1 = ['_']
nBlancos n = ['_'] ++ nBlancos (n - 1)




                
