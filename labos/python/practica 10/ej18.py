def agruparPorLongitud(nombre_archivo: str) -> dict:
    archivo = open(nombre_archivo, "r", encoding= "utf-8")
    contenido = archivo.readlines()
    diccionario: dict = {}
    longitudes = []
    for linea in contenido:
        longitudes = longitudes + cuentaLongitudes(separaPalabras(linea))
    for longitud in longitudes:
        if longitud not in diccionario:
            diccionario[longitud] = 1
        else:
            diccionario[longitud] += 1
    return diccionario
    


def separaPalabras(linea: str) -> list:
    lista = []
    palabra = ""
    i = 0
    while i < len(linea):
        if linea[i] != " ":
            palabra = palabra + linea[i]
            i += 1
        else:
            lista.append(palabra)
            palabra = ""
            i += 1
    lista.append(palabra)
    return lista

def cuentaLongitudes(palabras: list[str]) -> list[int]:
    longitudes: list = []
    for palabra in palabras:
        if palabra[-1] == '\n':
            palabra = palabra[:-1]
        longitudes.append(len(palabra))
    return longitudes

print(agruparPorLongitud("archivo.txt"))