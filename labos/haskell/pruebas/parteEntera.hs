
parteEntera :: Float -> Integer
parteEntera n | n < 1 = 0
              | otherwise = 1 + parteEntera(n-1)