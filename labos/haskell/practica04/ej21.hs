--condicion :: Integer -> Integer -> Integer -> Integer
--condicion p2 q2 r2 = iteraP p2 q2 r2
                
--comprueba p2 q2 r2 | p2 + q2 <= r2 = 1
--                   | otherwise = 0

--iteraP :: Integer -> Integer -> Integer -> Integer
--iteraP 0 0 r = 1
--iteraP 0 q r = iteraQ 0 q r
--iteraP p q r = comprueba (p*p) (q*q) (r*r) + condicion (p-1) q r + iteraqQ p q r


--iteraQ p 0 r = 1
--iteraQ p q r = comprueba (p*p) (q*q) (r*r) + iteraQ p (q-1) r

pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras p q r = iteraP p q (r*r)

iteraP :: Integer -> Integer -> Integer -> Integer
iteraP 0 0 r2 = 1
iteraP 0 q r2 = iteraQ 0 q r2
iteraP p q r2 = iteraQ (p*p) q r2 + iteraP (p-1) q r2

iteraQ :: Integer -> Integer -> Integer -> Integer
iteraQ p2 0 r2 | p2 <= r2 = 1
               | otherwise = 0

iteraQ p2 q r2 | p2 + (q*q) <= r2 = iteraQ p2 (q-1) r2 + 1
               | otherwise = iteraQ p2 (q-1) r2