sumaMenosQueMax :: (Int, Int, Int) -> Bool
sumaMenosQueMax terna = maximo terna > minimo terna + medio terna


maximo :: (Int, Int, Int) -> Int
maximo (a, b ,c) | a >= b && a >= c = a 
                 | b >= a && b >= c = b 
                 | otherwise = c

minimo :: (Int, Int, Int) -> Int
minimo (a, b ,c) | a <= b && a <= c = a 
                 | b <= a && b <= c = b 
                 | otherwise = c

medio :: (Int, Int, Int) -> Int
medio (a, b, c) |not(maximo (a,b,c) == a) && not(minimo(a,b,c) == a) = a
                | not(maximo (a,b,c) == b) && not(minimo(a,b,c) == b) = b
                | otherwise = c

sumaDigitos :: Integer -> Integer
sumaDigitos n | n < 10 = n
              | otherwise = mod n 10 + sumaDigitos(div n 10)


prod :: Integer -> Integer
prod n = duplicaN (2*n)


duplicaN :: Integer -> Integer
duplicaN 1 = (2^2 + 2*2) + (1 + 2)
duplicaN n2 = ((2*n)^2 + 2*2*n) * duplicaN (n2 -1)