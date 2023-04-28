module Ej01 where

longitud :: [t] -> Integer 
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

ultimo :: [t] -> t
ultimo [x] = x
ultimo (_:xs) = ultimo xs 

principio :: [t] -> [t] 
principio [x] = [x]
principio (x:xs) | longitud (x:xs) == 2 = [x]
                 | otherwise = x : principio xs

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = (reverso xs) ++ [x]