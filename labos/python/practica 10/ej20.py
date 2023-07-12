def laPalabraMasFrecuente(nombre_archivo: str) -> str:
    archivo = open(nombre_archivo, "r", encoding="utf-8")
    contenido = archivo.readlines()
    diccionario = {}
    for linea in contenido:
        for palabra in separaPalabras(linea):
            if palabra[-1] == '\n':
                palabra = palabra[:-1]

            if palabra not in diccionario:
                diccionario[palabra] = 1

            else:
                diccionario[palabra] += 1
    maximo = ['palabra', 0]
    for clave, valor in diccionario.items():
        if valor > maximo[1]:
            maximo = [clave, valor]
    return maximo[0]



def separaPalabras(linea: str) -> list[str]:
    i = 0
    lista = []
    palabra = ""
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

res = laPalabraMasFrecuente("archivo.txt")
print(res)