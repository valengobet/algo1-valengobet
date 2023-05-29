module Tests where
-- Nombre de Grupo: GrupoTN9
-- Integrante 1: Luis Theo, theoluis44@gmail.com, 130/23
-- Integrante 2: Gobet Valentin, valentingobet75@gmail.com, 851/23
-- Integrante 3: Cardozo Daniel Armando, dani54196@gmail.com, 135/17
   
import Test.HUnit
import Solucion 

-- Casos de test
main = runTestTT todosLosTest
todosLosTest = test [testsuite1, testsuite2, testsuite3, testsuite4, testsuite5, testsuite6, testsuite7, testsuite8, testsuite9, testsuite10]

testsuite1 = test [
    "Caso 1: La red tiene usuarios (en redB)" ~: (nombresDeUsuarios redB) ~?= ["Juan","Pedro","Natalia"],

    "Caso 1: La red tiene usuarios (en redC)" ~: (nombresDeUsuarios redC) ~?= ["Manuel","Camila","Alejandro","Julieta","Felipe","Antonela","Brian","Luciana","Martin","Rocio","Federico","Adriana"],

    "Caso 2: La red tiene usuarios (en redD)" ~: (nombresDeUsuarios redD) ~?= ["Manuel","Camila","Alejandro","Julieta","Felipe","Antonela","Brian","Luciana","Martin","Rocio","Federico","Adriana","Matias"]
 ]

testsuite2 = test [
    "Caso 1: Lista de un usuario sin amigos" ~: (amigosDe redB usuario5) ~?= [],

    "Caso 2: Lista de amigos de un usuario con amigos 1" ~: (amigosDe redB usuario2) ~?= [usuario1, usuario3],

    "Caso 2: Lista de amigos de un usuario con amigos 2" ~: (amigosDe redC usuario6) ~?= [usuario10,usuario9,usuario17],

    "Caso 2: Lista de amigos de un usuario con amigos 3" ~: (amigosDe redC usuario10) ~?= [usuario6, usuario9, usuario11, usuario12, usuario17]
 ]

testsuite3 = test [
    "Caso 1: La cantidad de amigos del usuario es 0" ~: (cantidadDeAmigos redB usuario5) ~?= 0,

    "Caso 2: Cantidad de amigos de un usuario con amigos 1" ~: (cantidadDeAmigos redA usuario1) ~?= 2,

    "Caso 2: Cantidad de amigos de un usuario con amigos 2" ~: (cantidadDeAmigos redA usuario4) ~?= 3,

    "Caso 2: Cantidad de amigos de un usuario con amigos 3" ~: (cantidadDeAmigos redC usuario10) ~?= 5,

    "Caso 2: Cantidad de amigos de un usuario con amigos 4" ~: (cantidadDeAmigos redD usuario8) ~?= 12
 ]

testsuite4 = test [
    "Caso 1: Usuarios con la misma cantidad de amigos" ~: expectAny (usuarioConMasAmigos redA) [usuario2, usuario4],

    "Caso 2: Usuario con mas amigos (en redB)" ~: (usuarioConMasAmigos redB) ~?= usuario2,

    "Caso 2: Usuario con mas amigos (en redC)" ~: (usuarioConMasAmigos redC) ~?= usuario10
 ]

expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)

{-Si bien la especificación indica que el usuario debería tener más de un millón de usuarios, consideramos cambiar el código y los nombres de los test para que nuestra código sea más fácil de testear-}
testsuite5 = test [
    "Caso 1: No hay un usuario con mas de 10 amigos " ~: (estaRobertoCarlos redC) ~?= False,

    "Caso 2: Hay un usuario con mas de 10 amigos " ~: (estaRobertoCarlos redD) ~?= True
 ]

testsuite6 = test [
    "Caso 1: Usuario sin publicaciones" ~: (publicacionesDe redB usuario5) ~?= [],

    "Caso 2: Usuario con publicaciones (en redA)" ~: (publicacionesDe redA usuario2) ~?= [publicacion2_1, publicacion2_2],

    "Caso 2: Usuario con publicaciones (en redC)" ~: (publicacionesDe redC usuario7) ~?= [publicacion7_1, publicacion7_2, publicacion7_3, publicacion7_4],

    "Caso 2: Usuario con publicaciones (en redC)" ~: (publicacionesDe redC usuario15) ~?= [publicacion15_1, publicacion15_2]
 ]

testsuite7 = test [
    "Caso 1: Al usuario no le gusta ninguna publicacion" ~: (publicacionesQueLeGustanA redC usuario10) ~?= [],

    "Caso 2: Al usuario le gustan algunas publicaciones (en redA)" ~: (publicacionesQueLeGustanA redA usuario2) ~?= [publicacion1_1, publicacion3_2, publicacion4_1],

    "Caso 2: Al usuario le gustan algunas publicaciones (en redB)" ~: (publicacionesQueLeGustanA redB usuario2) ~?= [publicacion1_3, publicacion3_2, publicacion3_3],

    "Caso 2: Al usuario le gustan algunas publicaciones (en redC)" ~: (publicacionesQueLeGustanA redC usuario9) ~?= [publicacion7_2, publicacion15_1],

    "Caso 2: Al usuario le gustan algunas publicaciones (en redD)" ~: (publicacionesQueLeGustanA redD usuario18) ~?= [publicacion8_1]
 ]

testsuite8 = test [
    "Caso 1: A los usuarios no les gustan las mismas publicaciones" ~: (lesGustanLasMismasPublicaciones redC usuario15 usuario6) ~?= False,

    "Caso 2: A los usuarios les gustan las mismas publicaciones (en redC)" ~: (lesGustanLasMismasPublicaciones redC usuario8 usuario13) ~?= True,

    "Caso 2: A los usuarios les gustan las mismas publicaciones (en redD)" ~: (lesGustanLasMismasPublicaciones redD usuario18 usuario17) ~?= True
 ] 


testsuite9 = test [
    "Caso 1: El usuario no tiene ningún seguidor fiel" ~: (tieneUnSeguidorFiel redC usuario6) ~?= False,

    "Caso 2: El usuario tiene un seguidor fiel (en redA)" ~: (tieneUnSeguidorFiel redA usuario2) ~?= True,

    "Caso 2: El usuario tiene un seguidor fiel (en redC)" ~: (tieneUnSeguidorFiel redC usuario7) ~?= True,

    "Caso 2: El usuario tiene un seguidor fiel (en redD)" ~: (tieneUnSeguidorFiel redD usuario8) ~?= True
 ]

testsuite10 = test [
    "Caso 1: No hay cadena de relaciones posible entre los usuarios" ~: (existeSecuenciaDeAmigos redB usuario1 usuario5) ~?= False,

    "Caso 1: No hay cadena de relaciones posible entre los usuarios" ~: (existeSecuenciaDeAmigos redB usuario2 usuario4) ~?= False,

    "Caso 2: Existe una cadena de relaciones por ser amigos" ~: (existeSecuenciaDeAmigos redC usuario10 usuario6) ~?= True,

    "Caso 3: Los usuarios no son amigos pero existe una cadena de relaciones posible (en redC)" ~: (existeSecuenciaDeAmigos redC usuario8 usuario9) ~?= True,

    "Caso 3: Los usuarios no son amigos pero existe una cadena de relaciones posible (en redC)" ~: (existeSecuenciaDeAmigos redC usuario10 usuario8) ~?= True, 

    "Caso 3: Los usuarios no son amigos pero existe una cadena de relaciones posible (en redD)" ~: (existeSecuenciaDeAmigos redD usuario10 usuario15) ~?= True
 ]


-- Ejemplos
redA = (usuariosA, relacionesA, publicacionesA)
usuariosA = [usuario1, usuario2, usuario3, usuario4]
relacionesA = [relacion1_2, relacion1_4, relacion2_3, relacion2_4, relacion3_4]
publicacionesA = [publicacion1_1, publicacion1_2, publicacion2_1, publicacion2_2, publicacion3_1, publicacion3_2, publicacion4_1, publicacion4_2]

redB = (usuariosB, relacionesB, publicacionesB)
usuariosB = [usuario1, usuario2, usuario3, usuario5]
relacionesB = [relacion1_2, relacion2_3]
publicacionesB = [publicacion1_3, publicacion1_4, publicacion1_5, publicacion3_1, publicacion3_2, publicacion3_3]

usuario1 = (1, "Juan")
usuario2 = (2, "Natalia")
usuario3 = (3, "Pedro")
usuario4 = (4, "Mariela")
usuario5 = (5, "Natalia")

relacion1_2 = (usuario1, usuario2)
relacion1_3 = (usuario1, usuario3)
relacion1_4 = (usuario4, usuario1) -- Notar que el orden en el que aparecen los usuarios es indistinto
relacion2_3 = (usuario3, usuario2)
relacion2_4 = (usuario2, usuario4)
relacion3_4 = (usuario4, usuario3)

publicacion1_1 = (usuario1, "Este es mi primer post", [usuario2, usuario4])
publicacion1_2 = (usuario1, "Este es mi segundo post", [usuario4])
publicacion1_3 = (usuario1, "Este es mi tercer post", [usuario2, usuario5])
publicacion1_4 = (usuario1, "Este es mi cuarto post", [])
publicacion1_5 = (usuario1, "Este es como mi quinto post", [usuario5])

publicacion2_1 = (usuario2, "Hello World", [usuario4])
publicacion2_2 = (usuario2, "Good Bye World", [usuario1, usuario4])

publicacion3_1 = (usuario3, "Lorem Ipsum", [])
publicacion3_2 = (usuario3, "dolor sit amet", [usuario2])
publicacion3_3 = (usuario3, "consectetur adipiscing elit", [usuario2, usuario5])

publicacion4_1 = (usuario4, "I am Alice. Not", [usuario1, usuario2])
publicacion4_2 = (usuario4, "I am Bob", [])
publicacion4_3 = (usuario4, "Just kidding, i am Mariela", [usuario1, usuario3])

--Redes sociales propuestas:

--redC:
redC = (usuariosC, relacionesC, publicacionesC)
usuariosC = [usuario6, usuario7, usuario8, usuario9, usuario10, usuario11, usuario12, usuario13, usuario14, usuario15, usuario16, usuario17]
relacionesC = [relacion6_10, relacion9_10, relacion10_11, relacion10_12, relacion10_17, relacion6_9, relacion6_17, relacion12_15, relacion15_8]
publicacionesC = [publicacion7_1, publicacion7_2, publicacion7_3, publicacion7_4, publicacion10_1, publicacion10_2, publicacion10_3, publicacion15_1, publicacion15_2]

usuario6 = (6, "Manuel")
usuario7 = (7, "Camila")
usuario8 = (8, "Alejandro")
usuario9 = (9, "Julieta")
usuario10 = (10, "Felipe")
usuario11 = (11, "Antonela")
usuario12 = (12, "Brian")
usuario13 = (13, "Luciana")
usuario14 = (14, "Martin")
usuario15 = (15, "Rocio")
usuario16 = (16, "Federico")
usuario17 = (17, "Adriana")

relacion6_9 = (usuario6, usuario9)
relacion6_10 = (usuario6, usuario10)
relacion6_17 = (usuario6, usuario17)
relacion7_14 = (usuario7, usuario14)
relacion9_10 = (usuario9, usuario10)
relacion10_11 = (usuario10, usuario11)
relacion10_12 = (usuario10, usuario12)
relacion10_17 = (usuario10, usuario17)
relacion12_15 = (usuario12, usuario15)
relacion15_8 = (usuario15, usuario8)

publicacion7_1 = (usuario7, "tengo frio", [usuario14,usuario13,usuario6,usuario8,usuario12])
publicacion7_2 = (usuario7, "quiero abrigarme", [usuario9,usuario14])
publicacion7_3 = (usuario7, "tengo hambre", [usuario11,usuario8,usuario13,usuario14])
publicacion7_4 = (usuario7, "quiero comer", [usuario16,usuario14])

publicacion10_1 = (usuario10, "Anoche vi una pelicula", [usuario6,usuario13,usuario7,usuario8])
publicacion10_2 = (usuario10, "Hoy lei un libro", [usuario6,usuario14])
publicacion10_3 = (usuario10, "Algun dia voy a ir al museo", [usuario8,usuario6,usuario15,usuario13])

publicacion15_1 = (usuario15, "me gusta el mar", [usuario7,usuario9])
publicacion15_2 = (usuario15, "no me gusta la ciudad", [])

--redD:
redD = (usuariosD, relacionesD, publicacionesD)
usuariosD = [usuario6, usuario7, usuario8, usuario9, usuario10, usuario11, usuario12, usuario13, usuario14, usuario15, usuario16, usuario17, usuario18]
relacionesD = [relacion15_8, relacion8_6, relacion8_7, relacion8_9, relacion8_10, relacion8_11, relacion8_12, relacion8_13, relacion8_14,relacion8_16, relacion8_17, relacion8_18]
publicacionesD = [publicacion8_1]

usuario18 = (18, "Matias")

relacion8_6 = (usuario8, usuario6)
relacion8_7 = (usuario8, usuario7)
relacion8_9 = (usuario8, usuario9)
relacion8_10 = (usuario8, usuario10)
relacion8_11 = (usuario8, usuario11)
relacion8_12 = (usuario8, usuario12)
relacion8_13 = (usuario8, usuario13)
relacion8_14 = (usuario8, usuario14)
relacion8_16 = (usuario8, usuario16)
relacion8_17 = (usuario8, usuario17)
relacion8_18 = (usuario8, usuario18)

publicacion8_1 = (usuario8, "Esta es la unica publicacion de la red", [usuario18,usuario17])