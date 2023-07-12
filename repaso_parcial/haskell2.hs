fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

parteEntera :: Float -> Integer
parteEntera n | n > (-1) && n < 1 = 0 
              | n < (-1) = (-1) + parteEntera (n+1)
              | n > 1 = 1 + parteEntera (n-1)

esDivisible :: Integer -> Integer -> Bool
esDivisible 0 _ = True
esDivisible a b | a < b = False
                | a == b = True
                | otherwise = esDivisible (a - b) b

sumaImpares :: Integer -> Integer 
sumaImpares 0 = 0
sumaImpares n = 2 * n - 1 + sumaImpares (n-1)

medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact n = n * medioFact(n-2)

sumaDigitos :: Integer -> Integer
sumaDigitos n | n < 10 = n
              | otherwise = mod n 10 + sumaDigitos (div n 10)

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | n < 10 = True
                      | (mod n 10) == (mod (div n 10) 10) && todosDigitosIguales (div n 10) = True
                      | otherwise = False
            
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n 1 = mod n 10
iesimoDigito n i = iesimoDigito (div n 10) (i-1)

cantDigitos :: Integer -> Integer
cantDigitos n | n < 10 = 1
              | otherwise = 1 + cantDigitos (div n 10)

esCapicua :: Integer -> Bool
esCapicua n | n < 10 = True
            | iesimoDigito n (cantDigitos n) == mod n 10 && esCapicua (div (n - iesimoDigito n (cantDigitos n) * 10 ^ ((cantDigitos n) - 1)) 10) = True
            | otherwise = False

pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras m n r = iteraN m n r 

iteraN :: Integer -> Integer -> Integer -> Integer
iteraN m 0 r | m <= r = 1 + iteraM (m-1) 0 r
             | otherwise = 0 + iteraM m 0 r

iteraN m n r | (m^2 + n^2) <= r^2 = 1 + iteraN m (n-1) r  + iteraM (m-1) n r
             | otherwise = iteraN m (n-1) r + iteraM (m-1) n r

iteraM :: Integer -> Integer -> Integer -> Integer
iteraM 0 n r | n <= r = 1
             | otherwise = 0

iteraM m n r | (m^2 + n^2) <= r^2 = 1 + iteraM (m-1) n r
             | otherwise = iteraM (m-1) n r


tomaValorMax :: Int -> Int -> Int

