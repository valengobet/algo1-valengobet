estanRelacionados ::  Integer -> Integer -> Bool

estanRelacionados x y | x == 0 || y == 0 = error "a y b deben ser distintos de 0"
                      | mod x y == 0 = True
                      | otherwise = False