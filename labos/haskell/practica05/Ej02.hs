module Ej02 where
import Ej01

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs) | e == x = True
                   | otherwise = pertenece e xs

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:xs) | x == head xs = todosIguales xs
                    | otherwise = False

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:xs) | x /= head xs = todosDistintos xs
                      | otherwise = False

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos [x] = False
hayRepetidos (x:xs) | x == head xs = True
                    | otherwise = hayRepetidos xs

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e (x:xs) | e == x = xs
                | otherwise = x : quitar e xs


quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos e (x:xs) | e == x = quitarTodos e xs
                     | otherwise = x : quitarTodos e xs


eliminaRepetidos :: (Eq t) => [t] -> [t]
eliminaRepetidos [] = []
eliminaRepetidos (x:xs) | pertenece x xs = x : quitarTodos x xs 
                        | otherwise = x : eliminaRepetidos xs


mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos x y = sinRepetidos (eliminaRepetidos x) (eliminaRepetidos y)   


sinRepetidos :: (Eq t) => [t] -> [t] -> Bool
sinRepetidos x y | mismosX x y && mismosY x y = True
                 | otherwise = False

mismosX :: (Eq t) => [t] -> [t] -> Bool
mismosX [] _ = True
mismosX (x:xs) y = pertenece x y && mismosX xs y

mismosY :: (Eq t) => [t] -> [t] -> Bool
mismosY _ [] = True
mismosY x (y:ys) = pertenece y x && mismosY x ys


capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua [x] = True
capicua (x:xs) = x == head (reverso xs) && capicua (quitar x (reverso xs))

