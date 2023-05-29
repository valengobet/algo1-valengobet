def sumaTotal(lista: list) -> int:
    suma: int = 0
    for elem in lista:
        suma = suma + elem
    return suma

res: int = sumaTotal([1, 2, 3, 4])
print(str(res))