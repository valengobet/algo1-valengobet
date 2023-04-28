import Ej02


type Set a = [a]
agregarATodos :: Integer -> Set (Set Integer) -> Set (Set Integer)
agregarATodos _ [] = []
agregarATodos n (x:xs) | not (pertenece n x) = [n : x] ++ agregarATodos n xs
                       | otherwise = [x] ++ agregarATodos n xs

partes :: Integer -> Set (Set Integer) 
partes 0 = []
partes n = [[]] ++ individuales n 1 ++ combinaciones n 1 2 ++ [masGrande n 1]


individuales :: Integer -> Integer -> Set (Set Integer) 
individuales n e | n == e = [[e]]
                 | otherwise = [[e]] ++ individuales n (e+1)

combinaciones :: Integer -> Integer -> Integer -> Set (Set Integer) 
combinaciones n c e | c == n = []
                    | n == e = [[c, e]] ++ combinaciones n (c+1) e
                    | otherwise = [[c, e]] ++ combinaciones n c (e+1)


masGrande :: Integer -> Integer -> Set Integer
masGrande n c | n == c = [c]
              | otherwise = [c] ++ masGrande n (c+1)

productoCartesiano :: Set Integer -> Set Integer -> Set (Integer, Integer)
productoCartesiano _ [] = []
productoCartesiano [] _ = []
productoCartesiano s r = iteraR s r


iteraS :: Set Integer -> Set Integer -> Set (Integer, Integer)
iteraS [] _ = []
iteraS _ [] = []
iteraS (s:ss) (r:rs) = (s, r) : iteraS ss (r:rs) 

iteraR :: Set Integer -> Set Integer -> Set (Integer, Integer)
iteraR [] _ = []
iteraR _ [] = []
iteraR (s:ss) (r:rs) = iteraS (s:ss) (r:rs) ++ iteraR (s:ss) rs


