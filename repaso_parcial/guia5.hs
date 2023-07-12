longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo xs

principio :: [t] -> [t]
principio [x] = [x]
principio (x:xs) | longitud (x:xs) == 2 = [x]
                 | otherwise = x : principio xs

reverso :: [t] -> [t] 
reverso [x] = [x]
reverso (x:xs) = reverso xs ++ [x]


pertenece ::  (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs) | e == x = True
                   | otherwise = pertenece e xs

todosIguales ::  (Eq t) => [t] -> Bool
todosIguales [x] = True
todosIguales (x:xs) = x == (primero xs) && todosIguales xs

primero :: [a] -> a
primero (x:xs) = x

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [x] = True
todosDistintos (x:xs) = not(pertenece x xs) && todosDistintos xs

hayRepetido :: (Eq t) => [t] -> Bool
hayRepetido [x] = False
hayRepetido (x:xs) | pertenece x xs = True
                   | otherwise = hayRepetido xs

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e (x:xs) | e == x = xs
                | otherwise = x : quitar e xs

quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos e (x:xs) | e == x = quitarTodos e xs
                     | otherwise = x : quitarTodos e xs      

eliminarRepetidos ::  (Eq t) => [t] -> [t] 
eliminarRepetidos [] = []
eliminarRepetidos (x:xs) | pertenece x xs = eliminarRepetidos xs
                         | otherwise = x : eliminarRepetidos xs


mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos _ [] = False
mismosElementos [] _ = False
mismosElementos (x:xs) lista | pertenece x lista && mismosElementos (sacaElemento x xs) (sacaElemento x lista) = True
                             | otherwise = False

sacaElemento :: (Eq t) => t -> [t] -> [t]
sacaElemento e [] = []
sacaElemento e (x:xs) | e == x = sacaElemento e xs
                      | otherwise = x : sacaElemento e xs

capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua [x] = True
capicua (x:xs) | x == ultimo xs && capicua (sacarUltimo xs) = True
               | otherwise = False

sacarUltimo :: (Eq t) => [t] -> [t]
sacarUltimo [x] = []
sacarUltimo (x:xs) = x : sacarUltimo xs 

sumatoria :: [Integer] -> Integer
sumatoria [x] = x
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Integer] -> Integer
productoria [x] = x
productoria (x:xs) = x * productoria xs

maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:xs) | x >= (head xs) && x > maximo xs = x
              | otherwise = maximo xs


sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [x] = [x+n]
sumarN n (x:xs) = (x+n) : sumarN n xs

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs)

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo (x:xs) = sumarN (ultimo (x:xs)) (x:xs)

pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | mod x 2 == 0 = x : pares xs
             | otherwise = pares xs


multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs) | mod x n == 0 = x : multiplosDeN n xs
                    | otherwise = multiplosDeN n xs

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:xs) | x == ' ' && primero xs /= ' ' = x : sacarBlancosRepetidos xs
                             | x /= ' ' = x : sacarBlancosRepetidos xs
                             | otherwise = sacarBlancosRepetidos xs

contarPalabras :: [Char] -> Integer
contarPalabras [] = 0

contarPalabras [x] | x /= ' ' = 1
                   | otherwise = 0

contarPalabras (x:xs) | x /= ' ' && primero xs == ' ' = 1 + contarPalabras xs
                      | otherwise = contarPalabras xs

aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos (x:xs) = x ++ " " ++ aplanarConBlancos xs

aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [] _ = []
aplanarConNBlancos (x:xs) n = x ++ nBlancos n ++ aplanarConNBlancos xs n

nBlancos :: Integer -> [Char]
nBlancos 0 = []
nBlancos n = ' ' : nBlancos (n-1)


type Set a = [a]

agregarATodos :: Integer -> Set (Set Integer) -> Set (Set Integer)
agregarATodos _ [] = []
agregarATodos n (x:xs) | not(pertenece n x) = [n : x] ++ agregarATodos n xs
                       | otherwise = x : agregarATodos n xs

partes :: Integer -> Set (Set Integer)
partes 0 = []
partes n | 