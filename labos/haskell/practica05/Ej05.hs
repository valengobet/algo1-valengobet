import Ej01

nat2bin :: Integer -> [Integer]
nat2bin 0 = [0]
nat2bin 1 = [1]
nat2bin n = nat2bin (div n 2) ++ [mod n 2]

leng :: [t] -> Integer
leng [] = 0
leng (x:xs) = 1 + leng xs

bin2nat :: [Integer] -> Integer
bin2nat [0] = 0
bin2nat [1] = 1
bin2nat (x:xs) | leng (x:xs) == 1 = 1
               | otherwise = x * 2 ^ (leng (x:xs) - 1) + bin2nat xs


nat2hex :: Integer -> [Char]
nat2hex 0 = ['0']
nat2hex 1 = ['1']
nat2hex 2 = ['2']
nat2hex 3 = ['3']
nat2hex 4 = ['4']
nat2hex 5 = ['5']
nat2hex 6 = ['6']
nat2hex 7 = ['7']
nat2hex 8 = ['8']
nat2hex 9 = ['9']
nat2hex 10 = ['A']
nat2hex 11 = ['B']
nat2hex 12 = ['C']
nat2hex 13 = ['D']
nat2hex 14 = ['E']
nat2hex 15 = ['F']

nat2hex n = nat2hex (div n 16) ++ [head (nat2hex (mod n 16))]


sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada (x:xs) = sumaAcumuladaR (reverso (x:xs))

sumaAcumuladaR :: (Num t) => [t] -> [t]
sumaAcumuladaR [x] = [x]
sumaAcumuladaR (x:xs) = sumaAcumuladaR xs ++ [sumaAcumuladaAux (x:xs)]

sumaAcumuladaAux :: (Num t) => [t] -> t
sumaAcumuladaAux [] = 0
sumaAcumuladaAux [x] = x
sumaAcumuladaAux (x:xs) = x + sumaAcumuladaAux xs 



descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = [factoresPrimos x] ++ descomponerEnPrimos xs


esPrimo :: Integer -> Integer -> Bool
esPrimo n i | n == i = True
            | mod n i == 0 = False
            | otherwise = esPrimo n (i+1)

factoresPrimos :: Integer -> [Integer]
factoresPrimos n = factoresPrimosDesde n 2
  where
    factoresPrimosDesde n i
      | n < 2 = []
      | mod n i == 0 && esPrimo i 2 = i : factoresPrimosDesde (n `div` i) i
      | otherwise = factoresPrimosDesde n (i+1)

