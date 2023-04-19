suc :: Integer -> Float
suc 1 = 2
suc n = 2 + (1 / suc(n-1))

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = suc n - 1.0
