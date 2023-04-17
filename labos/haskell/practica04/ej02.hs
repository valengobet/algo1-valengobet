-- parteEntera resibe x real y devuelve entero. el resultado de parteEntera es <= a x y resultado +1 > a x

parteEntera :: Float -> Integer
parteEntera x | x > (-1) && x < 1  = 0
              | x < (-1) = (-1) + parteEntera(x+1)
              | x > 1 =  1 + parteEntera(x-1)
