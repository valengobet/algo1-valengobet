sumaInterna :: Integer -> Integer -> Integer
sumaInterna i m | m <= 0 = undefined
                | m == 1 = i 
                | otherwise = i^m + sumaInterna i (m-1)

sumaExterna :: Integer -> Integer -> Integer -> Integer
sumaExterna n m i| n <= 0 = undefined    
                 | n == 1 = sumaInterna i m
                 | otherwise = sumaInterna i m + sumaExterna (n-1) m i
            