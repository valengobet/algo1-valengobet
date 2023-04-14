digitoUnidades :: Integer -> Integer

digitoUnidades x = mod x 10 

digitoDecenas :: Integer -> Integer

digitoDecenas x = mod (div x 10) 10