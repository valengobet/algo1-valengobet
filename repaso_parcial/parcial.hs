nombreDeUsuario :: [(Char, Char)] -> [Char] -> [Char]
nombreDeUsuario _ [] = []
nombreDeUsuario ids_usuarios (x:xs)= iteraIds ids_usuarios x : nombreDeUsuario ids_usuarios xs

iteraIds :: [(Char, Char)] -> Char -> Char
iteraIds ((id, us): xs) id2 | id == id2 = us
                            | otherwise = iteraIds xs id2