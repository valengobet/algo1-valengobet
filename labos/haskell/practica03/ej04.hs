prodInt :: (Float, Float) -> (Float, Float) -> (Float, Float)
prodInt (v1, v2) (w1, w2) = ((v1 * w1), (v2 * w2))


todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (v1, v2) (w1, w2) | v1 < w1 && v2 < w2 = True
                            | otherwise = False


distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (v1, v2) (w1, w2) = sqrt ((w1 - v1) ^ 2 + (w2 -v2) ^ 2)


sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (a, b, c) = a + b + c


sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplos (a, b, c) n = sum [i | i <- [a, b, c], mod i n == 0]


posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (a, b, c) | mod a 2 == 0 && mod b 2 == 0 && mod c 2 == 0 = 4
                       | mod a 2 == 0 = 0
                       | mod b 2 == 0 = 1
                       | mod c 2 == 0 = 2


crearPar :: ta -> tb -> (ta, tb)
crearPar a b = (a , b)


invertir :: ta -> tb -> (tb, ta)
invertir a b = (b, a)


