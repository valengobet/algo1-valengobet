esPar :: Integer -> Bool
esPar n = mod n 2 == 0

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


comparaDigitos :: Integer -> Integer -> Integer -> Integer
comparaDigitos n a b | esPar(iesimoDigito n a) && not (esPar(iesimoDigito n b)) = iesimoDigito n a
                     | not(esPar(iesimoDigito n a)) && esPar(iesimoDigito n b) = iesimoDigito n b
                     | otherwise = False

mayorDigitoPar :: Integer -> Integer
mayorDigitoPar