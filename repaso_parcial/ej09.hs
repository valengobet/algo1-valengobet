cantDigitos :: Integer -> Integer
cantDigitos n | n < 0 = undefined
              | n == 0 = 0
              | otherwise = 1 + cantDigitos(div n 10)

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i  | i > cantDigitos(n) = undefined
                  | i == cantDigitos(n) = mod n 10
                  | otherwise = iesimoDigito (div n 10) i


esCapicua :: Integer -> Bool
esCapicua n | n < 10 = True
            | otherwise = iesimoDigito n (cantDigitos(n)) == iesimoDigito n 1 && esCapicua (div (n - (iesimoDigito n 1 * 10 ^(cantDigitos(n) - 1))) 10)


-- ((div n 10) - (iesimoDigito n 1 * 10 ^(cantDigitos(n) - 1)))