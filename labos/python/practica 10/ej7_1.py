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

print(promedioEstudiante('409/09'))

