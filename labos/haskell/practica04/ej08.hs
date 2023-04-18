cantDigitos :: Integer -> Integer
cantDigitos n | n < 0 = undefined
              | n == 0 = 0
              | otherwise = 1 + cantDigitos(div n 10)
              
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i  | i > cantDigitos(n) = undefined
                  | i == cantDigitos(n) = mod n 10
                  | otherwise = iesimoDigito (div n 10) i