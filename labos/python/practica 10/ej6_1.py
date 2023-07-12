def palabraslegibles(archivo_in: str) -> list:
    archivo = open(archivo_in, 'rb')
    lista = []
    for linea in archivo.readlines():
        file.write(linea)
        if len(linea) >= 5:
            lista = lista + linea
    return lista


print(palabraslegibles("hola.zip"))