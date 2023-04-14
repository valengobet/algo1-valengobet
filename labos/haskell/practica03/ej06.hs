esMultiplo :: (Integer, Integer) -> Bool
esMultiplo (x,y) = mod x y == 0  

bisiesto :: Integer -> Bool
bisiesto anio | not (esMultiplo(anio,4)) || (esMultiplo(anio,100) && not (esMultiplo(anio,400))) = False
              | otherwise = True

