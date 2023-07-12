
def contarlineas(archivo_in: str) -> int:
    archivo = open(archivo_in, 'r', encoding="utf-8")
    lineas = len(archivo.readlines())
    archivo.close()
    return lineas

print(contarlineas("archivo.txt"))

def existePalabra(palabra: str, archivo_in: str) -> bool:
    archivo = open(archivo_in, 'r', encoding="utf-8")
    for linea in archivo.readlines():
        if palabra in linea:
            archivo.close()
            return True
    archivo.close()
    return False

print(existePalabra("ensalada", "archivo.txt"))

def cantidadApariciones(palabra_in: str, archivo_in: str) -> bool:
    archivo = open(archivo_in, 'r', encoding="utf-8")
    count: int = 0
    for linea in archivo.readlines():
        for palabra in separaPalabras(linea):
            if palabra_in == palabra:
                count += 1
    archivo.close()
    return count

def separaPalabras(linea: str) -> list[str]:
    lista: list= []
    i = 0
    palabra = ""
    while i < len(linea):
        if linea[i] != ' ':
            palabra = palabra + linea[i]
            i += 1
        else:
            lista.append(palabra)
            palabra = ""
            i += 1
    lista.append(palabra)
    return lista

print(cantidadApariciones("hola", "archivo.txt"))
