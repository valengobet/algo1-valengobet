f1 :: Integer -> Integer
f1 n = div ((2^(n+1)) - 1) (2 - 1)

f2 :: Integer -> Integer -> Integer
f2 q n | q == 1 = q
       | otherwise = (div (q ^ (n+1)-1) (q - 1)) - 1

f4 :: Integer -> Integer -> Integer
f4 q n | q == 1 = n - 1
       | otherwise = div (q^(2*n + 1) - q^n) (q - 1)