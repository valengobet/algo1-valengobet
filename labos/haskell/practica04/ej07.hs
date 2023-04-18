
todosDigitosIguales :: Integer -> Bool 

todosDigitosIguales n | n < 10 = True
                      | todosDigitosIguales(div n 10) && mod n 10 == mod (div n 10) 10 = True
                      | otherwise = False
