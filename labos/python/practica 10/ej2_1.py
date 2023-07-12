def clonarSinComentarios(archivo_int: str) -> int:
    archivo = open(archivo_int, 'r', encoding = "utf-8")
    archivo_clonado = open("archivo_clonado.txt", 'x', encoding = 'utf-8')
    for linea in archivo.readlines():
        print(linea)
        if "#" not in linea:
            archivo_clonado.write(linea)

        elif linea.index("#") != 0 and (linea[0 : linea.index("#") - 1] != (" " * (linea.index("#") - 1))):
            archivo_clonado.write(linea)
    archivo.close()


clonarSinComentarios("archivo_2.txt")