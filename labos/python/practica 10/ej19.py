def promedioEstudiante(lu : str) -> float:
    archivo = open("notas.csv", 'r', encoding= 'utf-8')
    notas = 0
    lineas = archivo.readlines()
    cantidad_notas = 0
    for linea in lineas:
        if linea[0: linea.index(",")] == lu:
            i = 0
            nota = linea
            while i < 3:
                nota = nota[nota.index(',') + 1 : len(linea)]
                i += 1
            notas = notas + float(nota)
            cantidad_notas += 1
    promedio = notas / cantidad_notas
    return promedio


def separaLibretas(lu: str) -> list[str]:
    archivo = open(lu, 'r', encoding= 'utf-8')
    lineas = archivo.readlines()
    libretas: list = []
    for linea in lineas:
        libretas = libretas + [linea[0: linea.index(",")]]
    return libretas

def diccionarioPromedios(libretas: list[str]) -> dict:
    diccionario = {}
    for libreta in libretas:
        if libreta not in diccionario:
            diccionario[libreta] = promedioEstudiante(libreta)
    return diccionario


libretas = separaLibretas("notas.csv")
print(diccionarioPromedios(libretas))