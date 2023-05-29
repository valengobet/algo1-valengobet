module Solucion where 
-- Completar con los datos del grupo
--
-- Nombre de Grupo: GrupoTN9
-- Integrante 1: Luis Theo, theoluis44@gmail.com, 130/23
-- Integrante 2: Gobet Valentin, valentingobet75@gmail.com, 851/23
-- Integrante 3: Cardozo Daniel Armando, dani54196@gmail.com, 135/17

type Usuario = (Integer, String) -- (id, nombre)
type Relacion = (Usuario, Usuario) -- usuarios que se relacionan
type Publicacion = (Usuario, String, [Usuario]) -- (usuario que publica, texto publicacion, likes)
type RedSocial = ([Usuario], [Relacion], [Publicacion])


-- Funciones basicas

usuarios :: RedSocial -> [Usuario]
usuarios (us, _, _) = us

relaciones :: RedSocial -> [Relacion]
relaciones (_, rs, _) = rs

publicaciones :: RedSocial -> [Publicacion]
publicaciones (_, _, ps) = ps

idDeUsuario :: Usuario -> Integer
idDeUsuario (id, _) = id 

nombreDeUsuario :: Usuario -> String
nombreDeUsuario (_, nombre) = nombre 

usuarioDePublicacion :: Publicacion -> Usuario
usuarioDePublicacion (u, _, _) = u

likesDePublicacion :: Publicacion -> [Usuario]
likesDePublicacion (_, _, us) = us

-- Ejercicios

-- Ejercicio 1
{- 
Describir qué hace la función: Recibe una Red social. Devuelve una lista sin elementos repetidos que contiene los nombres de todos los usuarios de una red social.
Esto lo hace por medio de la función proyectarNombres, dándole como parámetros la lista de usuarios de la red, que luego usa la función sinRepetidos, para evitar que haya nombres repetidos en la lista devuelta.
-}
nombresDeUsuarios :: RedSocial -> [String]
nombresDeUsuarios red = sinRepetidos (proyectarNombres (usuarios red))

-- Funciones auxiliares 
{- 
proyectarNombres: Recibe una lista de usuarios. Cada elemento de esta lista se le aplica la función nombreDeUsuario para obtener solo el nombre del usuario, que luego es insertado en una lista.
Finalmente, a esta lista, se le concatenan la recursión de proyectarNombres con los siguientes elementos. Esto ocurre hasta el caso base (la lista vacía) donde no agrega nada.
-}
proyectarNombres :: [Usuario] -> [String]
proyectarNombres [] = []
proyectarNombres (x:xs) = [nombreDeUsuario x] ++ proyectarNombres xs

{-
pertenece: Recibe un elemento y una lista. Esta función evalúa si un elemento se encuentra en alguna posición de la lista dada.
Esto lo hace comparando elemento a elemento por medio de recursión. Si mientras evalúa encuentra un elemento exactamente igual, entonces la función devuelve True.
Si la lista evalúa todos los elementos y no encuentra ninguno exactamente igual, entonces devuelve False.  
-}
pertenece :: (Eq a) => a -> [a] -> Bool
pertenece _ [] = False
pertenece a (x:xs) | a == x = True
                   | otherwise = pertenece a xs

{-
sinRepetidos: Recibe una lista. Utilizando la función pertenece, sinRepetidos se fija por cada elemento si está contenido en la lista parámetro.
Si pertenece devuelve False, entonces agrega el elemento a la nueva lista. Si pertenece devuelve True, entonces no lo agrega y pasa al siguiente elemento.
En caso de que pertenece devuelva False, entonces lo agrega a la lista que va a devolver finalmente.
-}
sinRepetidos :: [String] -> [String]
sinRepetidos [] = []
sinRepetidos (x:xs) | pertenece x xs = sinRepetidos xs
                    | otherwise = x : sinRepetidos xs


-- Ejercicio 2
{-
Describir qué hace la función: Recibe una Red social y un usuario. 
Esta función devuelve una lista de usuarios que están relacionados con el usuario parámetro.
Esto lo hace gracias a la función auxiliar filtraRelaciones, a la cual le damos como parámetros el usuario y la lista de relaciones de la red social.
-}
amigosDe :: RedSocial -> Usuario -> [Usuario]
amigosDe red us = filtraRelaciones us (relaciones red)

--Funciones auxiliares:
{-
filtraRelaciones: Recibe un usuario y una lista de relaciones. Se define un caso base donde, dado cualquier usuario, y una lista vacía, devuelve una lista vacía. 
Cuando la lista es distinta de vacía, separa la primera relación dentro de la misma para llamar a la función perteneceRelacion (con el usuario y esta primera relación como parámetros)
que, en el caso de devolver True, se llama a otra nueva función eligeAmigo que devuelve dentro de una lista usuario que está relacionado con el parámetro usuario de filtraRelaciones.
Luego, esta respuesta se la concatena con la respuesta de la recursión de filtraRelaciones, pero esta vez sin la relación que ya evaluó hasta agotar los elementos de la lista relaciones. 
En caso de que perteneceRelacion devuelva False, filtrarRelaciones ignora esta relación y se llama a sí misma para evaluar el siguiente elemento del parámetro dentro de relaciones. 
-}
filtraRelaciones :: Usuario -> [Relacion] -> [Usuario]
filtraRelaciones _ [] = []
filtraRelaciones us (x:xs) | perteneceRelacion us x = eligeAmigo us x ++ filtraRelaciones us xs
                           | otherwise = filtraRelaciones us xs

{- 
perteneceRelacion: Recibe un usuario y una relacion. Devuelve True, si el usuario dado es un elemento de la tupla relación.
De lo contrario devuelve False. Esto ayuda a descartar las relaciones en filtraRelaciones en las que no está el usuario recibido como parámetro.
-}
perteneceRelacion :: Usuario -> Relacion -> Bool
perteneceRelacion us (usA, usB) | us == usA || us == usB = True
                                | otherwise = False

{-
eligeAmigo: Recibe un usuario y una relacion. Si el usuario es exactamente igual a alguno de los elementos de la relación, la función devuelve en forma de lista al otro usuario, su amigo.
A este último lo devuelve en forma de una lista de usuarios, ya que era conveniente para concatenarlo dentro de filtraRelaciones.
-}
eligeAmigo :: Usuario -> Relacion -> [Usuario]
eligeAmigo us (usA, usB) | us == usA = [usB]
                         | us == usB = [usA]
                                      
-- Ejercicio 3
{-
Describir qué hace la función: Recibe una Red social y un usuario. 
Esta función devuelve en forma de Int, la cantidad de elementos que posee la lista de amigos del usuario parámetro por medio de la función longitud.
-}
cantidadDeAmigos :: RedSocial -> Usuario -> Int
cantidadDeAmigos red us = longitud (amigosDe red us)

--Funciones auxiliares 

{-
longitud: Recibe una lista. Por cada elemento que posee esta lista (los usuarios), suma 1 y vuelve a llamarse a sí misma pero esta vez con un elemento menos dentro de la lista de usuarios.
Cuando llega a la lista vacía, suma 0. 
-}
longitud :: [a] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- Ejercicio 4
{-
Describir qué hace la función: Recibe una Red social. Devuelve el usuario que más amigos tiene.
Utiliza la función comparaAmigos, al cual le pasamos la Red social dada y su lista de usuarios. La lista de usuarios de la red se la indicamos por medio de la función usuarios
-}
usuarioConMasAmigos :: RedSocial -> Usuario
usuarioConMasAmigos red = comparaAmigos red (usuarios red)

--Funciones auxiliares

{-
comparaAmigos: Recibe una red social y una lista de usuarios. Si la red tiene un solo usuario, entonces ese usuario es la respuesta. 
En otro caso, la función evalúa cada elemento de la lista de usuarios, utilizando la función cantidadDeAmigos, para ver si la cantidad de amigos del usuario en cuestión sea mayor o igual a la cantidad de amigos del primer elemento de la lista, y que además se cumpla que este elemento tenga más amigos que el resto de la lista, esto último lo logra hacer por medio de recursión.
Si el elemento siendo evaluado no cumple con alguna de estas condiciones, entonces la función vuelve a hacer las comparaciones adecuadas con el siguiente elemento de la lista. Esto lo hace hasta llegar al caso base; la lista de un solo usuario.
-}
comparaAmigos :: RedSocial -> [Usuario] -> Usuario 
comparaAmigos red [x] = x
comparaAmigos red (x:xs) | cantidadDeAmigos red x >= cantidadDeAmigos red (head xs) && cantidadDeAmigos red x >= cantidadDeAmigos red (comparaAmigos red xs) = x
                         | otherwise = comparaAmigos red xs


-- Ejercicio 5
{-
Describir qué hace la función: Recibe una Red social. Esta función devuelve True si dentro de la lista de los usuarios de la red dada existe algún usuario que tenga mas de un millón de amigos.
En caso de que no lo haya, devuelve False. Esto lo hace por medio de la función iteraUsuarios a la cual le pasamos como parámetro la Red social dada y la lista de los usuarios de la red por medio de otra función auxiliar llamada usuarios.
-}
estaRobertoCarlos :: RedSocial -> Bool
estaRobertoCarlos red = iteraUsuarios red (usuarios red)

--Funciones auxiliares

{-
iteraUsuarios: Recibe una red social y la lista de usuarios de la red dada.
Llamando a la función cantidadDeAmigos, la función iteraUsuarios hace una comparación con cada elemento para ver si el elemento (un usuario) tiene más de un millón de amigos, de ser asi, la función devuelve True, de lo contrario
pasa al siguiente elemento de la lista de usuarios de la red dada hasta llegar a una lista vacía, que en cuyo caso devuelve False.
-}
iteraUsuarios :: RedSocial -> [Usuario] -> Bool
iteraUsuarios _ [] = False
iteraUsuarios red (x:xs) | cantidadDeAmigos red x > 10 = True
                         | otherwise = iteraUsuarios red xs

-- Ejercicio 6
{-
Describir qué hace la función: Recibe una red social y un usuario de dicha red. Esta función devuelve todas las publicaciones, en forma de lista, del usuario dado como parámetro.
Esto lo hace por medio de una función auxiliar llamada filtraPublicaciones a la cual debemos pasarle el usuario dado como parámetro y las publicaciones de la red elegida, cosa que podemos hacer gracias a la función publicaciones.
-}
publicacionesDe :: RedSocial -> Usuario -> [Publicacion]
publicacionesDe red us = filtraPublicaciones red us (publicaciones red)

--Funciones auxiliares

{-
filtraPublicaciones: Recibe una red social junto con un usuario y una lista de publicaciones que pertenecen a la red social. Esta función recorre todos los elementos de la lista de publicaciones para usar la función auxiliar usuarioDePublicacion y así comparar el elemento con el usuario dado.
De ser iguales, la función filtraPublicaciones inserta en una nueva lista la publicación perteneciente al usuario y la concatena con la recursión de esta misma función, pero esta vez con el siguiente elemento de la lista de publicaciones.
En caso de que el usuario dado y el usuario devuelto por usuarioDePublicacion no coincidan, filtraPublicaciones ignora este caso en particular y continua con el siguiente elemento de la lista de publicaciones. Finalmente, cuando llega a la lista vacía, el caso base, simplemente devuelve una lista vacía.
-}
filtraPublicaciones :: RedSocial -> Usuario -> [Publicacion] -> [Publicacion]
filtraPublicaciones _ _ [] = []
filtraPublicaciones red us (x:xs) | us == usuarioDePublicacion x = [x] ++ filtraPublicaciones red us xs
                                  | otherwise = filtraPublicaciones red us xs

-- Ejercicio 7
{-
Describir qué hace la función: Recibe una red social y un usuario. Devuelve, en forma de lista, todas las publicaciones en las cuales el usuario dado aparece en la lista de “me gusta” (sería estar contenido en el tercer elemento del tipo de dato publicación).
Esto lo hace usando filtraPublicacionesLikes a la cual le da como parámetro el usuario dado y la lista de publicaciones de la red por medio de la función auxiliar publicaciones.
-}
publicacionesQueLeGustanA :: RedSocial -> Usuario -> [Publicacion]
publicacionesQueLeGustanA red us = filtraPublicacionesPorLikes us (publicaciones red)

--Funciones auxiliares

{-
filtraPublicacionesPorLikes: Recibe un usuario y una lista de publicaciones.
Primero evalua si el usuario le dio like a la publicacion o no, esto lo hace dandole a la funcion auxiliar pertenece el usuario y la lista de likes de la publicacion (usando la funcion likesDePublicacion con la publicacion dada como parametro)
De ser True, la función filtraPublicacionesPorLikes añade la publicación a una lista y concatena los siguientes elementos de la lista de publicaciones, que lo hace por medio de recursión.
En caso de que la funcion pertenece devuelva False (osea que el usuario no le dio like), la función no concatena esa publicación en particular a la lista que devuelve y pasa al siguiente elemento.
-}
filtraPublicacionesPorLikes :: Usuario -> [Publicacion] -> [Publicacion]  
filtraPublicacionesPorLikes _ [] = []
filtraPublicacionesPorLikes us (x:xs) | pertenece us (likesDePublicacion x) = [] ++ [x] ++ filtraPublicacionesPorLikes us xs
                                      | otherwise = filtraPublicacionesPorLikes us xs

--Ejercicio 8

{-
Describir qué hace la función: Recibe una red social y dos usuarios. Si ambos usuarios son el mismo, entonces devuelve True.
Si son usuarios distintos, entonces llama a la función publicacionesQueLeGustanA con los parámetros de la red social dada y el usuario 1, luego la lista devuelta por esa función es comparada con publicacionesQueLeGustanA de la red social dada y el usuario restante.
Si las listas devueltas por publicacionesQueLeGustanA son iguales, entonces lesGustanLasMismasPublicaciones devuelve True, en caso contrario devuelve False.
-}
lesGustanLasMismasPublicaciones :: RedSocial -> Usuario -> Usuario -> Bool
lesGustanLasMismasPublicaciones red us1 us2 | us1 == us2 = True
                                            | publicacionesQueLeGustanA red us1 == publicacionesQueLeGustanA red us2 = True 
                                            | otherwise = False

--Ejercicio 9
{- 
Describir qué hace la función: Recibe una red social y un usuario. La función recorre, con todos los usuarios de la red, la lista de publicaciones del usuario dado dentro de la red social que funciona como parámetro.
Esto lo hace con la ayuda de la función auxiliar iteraSeguidores, a la cual se le debe pasar como parámetros la lista de usuarios de la red social y las publicaciones del usuario original.
Si hay un usuario que pertenece a la lista de me gustas de exactamente todas las publicaciones del usuario original, entonces la función tieneUnSeguidorFiel devuelve True, si no existe ningún usuario que cumpla esto, entonces devuelve False.
-}
tieneUnSeguidorFiel :: RedSocial -> Usuario -> Bool
tieneUnSeguidorFiel red us | publicacionesDe red us == [] = False
                           | otherwise = iteraSeguidores (usuarios red) (publicacionesDe red us)

--Funciones auxiliares

{-
iteraSeguidores: Recibe una lista de usuarios y una lista de publicaciones. Por cada usuario dentro de la lista de usuarios (utilizando la función auxiliar iteraPublicaciones), devuelve True si alguno de ellos está presente en los me gusta de todas las publicaciones de la lista pasada como parámetro.
Si no existe ningún usuario que cumpla con esto (la lista vacía), devuelve False.
-}
iteraSeguidores :: [Usuario] -> [Publicacion] -> Bool
iteraSeguidores [] _ = False
iteraSeguidores (x:xs) pubs | iteraPublicaciones x pubs = True
                            | otherwise = iteraSeguidores xs pubs

{-
iteraPublicaciones: Recibe un usuario y una lista de publicaciones. Por cada publicación en la lista de publicaciones, esta función revisa que el usuario pertenezca a los me gusta de la publicación.
Si lo hace, entonces pasa a la siguiente publicación de la lista. Si todas las publicaciones contienen al usuario parámetro, entonces devuelve True. En caso contrario, devuelve False.
-}
iteraPublicaciones :: Usuario -> [Publicacion] -> Bool
iteraPublicaciones _ [] = True
iteraPublicaciones us (y:ys) | pertenece us (likesDePublicacion y) = iteraPublicaciones us ys
                             | otherwise = False

-- Ejercicio 10
{- 
Describir qué hace la función: Recibe una red social y dos usuarios distintos. La función primero evalúa si estos usuarios son o no amigos entre sí, de serlo devuelve True, pues se cumple la especificación.
De no ser amigos entre sí, la función hace uso de iteraAmigos, a la cual se le dan como parámetros la red, los dos usuarios y la lista de amigos del usuario 1.
Con estos datos, iteraAmigos ayuda a evaluar si existe una cadena posible de amistades, devolviendo True si existe, o False si no existe. 
-}
existeSecuenciaDeAmigos :: RedSocial -> Usuario -> Usuario -> Bool
existeSecuenciaDeAmigos red us1 us2 | pertenece us1 (amigosDe red us2) = True
                                    | otherwise = iteraAmigos red us1 us2 (amigosDe red us1)

--Funciones auxiliares
{-
iteraAmigos: Recibe una red social dos usuarios distintos y una lista de usuarios. Utilizando cadenaDeAmigos, esta función revisa si con algún usuario de la lista dada como parámetro, se puede crear una cadena de amistades.
Como utiliza recursión, si no encuentra ningún caso para que esto se cumpla, llega hasta el caso base de la lista vacía, en la que devuelve False.
-}
iteraAmigos :: RedSocial -> Usuario -> Usuario -> [Usuario] -> Bool
iteraAmigos _ _ _ [] = False
iteraAmigos red us1 us2 (usX:xs) | cadenaDeAmigos red us1 us2 usX = True
                                 | otherwise = iteraAmigos red us1 us2 xs

{-
cadenaDeAmigos: Recibe una red social y tres usuarios (dos de ellos son los que ingresamos cuando utilizamos comparaAmigos, y el otro es un elemento de la lista de usuarios de la red, que ingresa a esta función gracias a iteraAmigos).
Si el tercer usuario dado como parámetro se encuentra dentro de la lista de amigos del segundo usuario, entonces la función devuelve True. De lo contrario llama a iteraAmigos con una nueva lista de usuarios, que no contiene ni al primer usuario, ni a los amigos que tienen en común ni a los amigos que tienen en común el usuario 1 con el usuario 3.
Además, iteraAmigos ahora utiliza al usuario 3 como parámetro, de manera que podemos evaluar el siguiente eslabón de la cadena de amistades.
-}
cadenaDeAmigos :: RedSocial -> Usuario -> Usuario -> Usuario -> Bool
cadenaDeAmigos red us1 us2 usX | pertenece usX (amigosDe red us2) = True
                               | otherwise = iteraAmigos red usX us2 (sacaUsuario us1 (eliminaAmigosEnComun (amigosDe red us1) (amigosDe red usX)))

{-
eliminaAmigosEnComun: Recibe dos listas de usuarios. Esta función revisa si algún elemento de la primera lista de usuarios pertenece a la segunda. Si esto ocurre, lo elimina de la segunda lista por medio de otra función auxiliar llamada sacaUsuario.
De lo contrario, pasa al siguiente elemento de la primera lista hasta vaciarla, uno de los casos base, donde devuelve la segunda lista. El otro caso base sería que la segunda lista dada como parámetro sea vacía, con lo cual la función aliminaAmigosEnComun devuelve una lista vacía.
-}
eliminaAmigosEnComun :: [Usuario] -> [Usuario] -> [Usuario]
eliminaAmigosEnComun _ [] = []
eliminaAmigosEnComun [] x = x
eliminaAmigosEnComun (x:xs) amigos | pertenece x amigos = eliminaAmigosEnComun xs (sacaUsuario x amigos)
                                   | otherwise = eliminaAmigosEnComun xs amigos


{-
sacaUsuario: Recibe un usuario y una lista de usuarios. Esta función devuelve una lista de usuarios que no contiene al usuario que es usado como parámetro.
Si la lista en un principio es vacía, entonces devuelve la misma lista.
-}
sacaUsuario :: Usuario -> [Usuario] -> [Usuario]
sacaUsuario _ [] = []
sacaUsuario us (x:xs) | us == x = xs
                      | otherwise = [x] ++ sacaUsuario us xs

