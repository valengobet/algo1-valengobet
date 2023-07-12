absoluto :: Int -> Int
absoluto n | n >= 0 = n
           | otherwise = -n


maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto a b | absoluto a >= absoluto b = absoluto a
                   | otherwise = absoluto b

maximo :: Int -> Int -> Int
maximo a b | a >= b = a 
        | otherwise = b

maximo3 :: Int -> Int -> Int -> Int
maximo3 a b c = maximo (maximo a b) c

algunoEs0 :: Rational -> Rational -> Bool
algunoEs0 a b | a == 0 || b == 0 = True
              | otherwise = False

algunoEs0v2 :: Rational -> Rational -> Bool
algunoEs0v2 _ 0 = True
algunoEs0v2 0 _ = True
algunoEs0v2 _ _ = False

ambosSon0 :: Rational -> Rational -> Bool
ambosSon0 a b | a == 0 && b == 0 = True
              | otherwise = False

ambosSon0v2 :: Rational -> Rational -> Bool
ambosSon0v2 0 0 = True
ambosSon0v2 _ _ = False

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo a b | a <= 3 && b <= 3 = True
                   | a <= 7 && a > 3 && b <= 7 && b > 3 = True
                   | a > 7 && b > 7 = True
                   | otherwise = False

sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos a b c | a == b && b == c = 0
                    | a == b = a + c 
                    | a == c = a + b 
                    | b == c = a + b
                    | otherwise = a + b + c

esMultiploDe :: Int -> Int -> Bool
esMultiploDe a b | mod a b == 0 = True
                 | otherwise = False

digitoUnidades :: Int -> Int
digitoUnidades n = mod n 10

digitoDecenas :: Int -> Int
digitoDecenas n = div (mod n 100) 10

prodInt :: (Int, Int) -> (Int, Int) -> (Int, Int)
prodInt (a, b) (c, d) = (a*c, b*d)

todoMenor :: (Int, Int) -> (Int, Int) -> Bool
todoMenor (a, b) (c, d) | a < c && b < c = True
                        | otherwise = False

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1, y1) (x2, y2) = sqrt ((x2-x1)^2 + (y2-y1)^2)

sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (a, b, c) = a + b + c

sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (a, b, c) n = sumaMultiplos a n + sumaMultiplos b n + sumaMultiplos c n

sumaMultiplos :: Int -> Int -> Int
sumaMultiplos x n | mod x n == 0 = x 
                  | otherwise = 0


posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (a, b, c) | mod a 2 == 0 && mod b 2 == 0 && mod c 2 == 0 = 4
                       | mod a 2 == 0 = 0
                       | mod b 2 == 0 = 1
                       | mod c 2 == 0 = 2
                       | otherwise = 0

crearPar :: a -> b -> (a, b)
crearPar a b = (a, b)

crearPar :: a -> b -> (a, b)
crearPar a b = (b, c)

