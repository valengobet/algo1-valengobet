f :: Integer -> Integer
f n | n <= 7 = n ^ 2
    | n > 7 = 2 * n - 1

esPar :: Integer -> Bool
esPar n  = mod n 2 == 0 

g :: Integer -> Integer
g n | esPar(n) = div n 2
    | otherwise = 3 * n + 1


todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (a, b, c) | f(a) > g(a) && f(b) > g(b) && f(c) > g(c) = True
                       | otherwise = False



