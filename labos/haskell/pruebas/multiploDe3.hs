multiploDe3 :: Integer -> Bool

multiploDe3 n | n == 3 = True
              | n < 3 = False
              | otherwise = multiploDe3(n-3)
