def reverso(archivo_int: str) -> int:
    archivo = open(archivo_int, 'r', encoding = "utf-8")
    reverso = open("reverso.txt", 'x', encoding = 'utf-8')
    lineas = archivo.readlines()
    for i in range(len(lineas) - 1, -1, -1):
        print(lineas[i])
        reverso.write(lineas[i] + '\n')

reverso("archivo_3.txt")
