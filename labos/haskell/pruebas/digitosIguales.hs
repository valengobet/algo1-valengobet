digitosIguales :: Int -> Bool
digitosIguales n | n < 10 = True
                 | otherwise = digitosIguales(div n 10) == (mod n 10 == mod (div n 10) 10)
