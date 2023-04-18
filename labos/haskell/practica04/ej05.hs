-- medioFact integer integer dado n calcula n!! = n(n-2)(n-4)

medioFact :: Integer -> Integer
medioFact n | n < 0 = undefined
            | n == 0 = 1
            | n == 1 = 1
            | otherwise = n * medioFact(n-2)