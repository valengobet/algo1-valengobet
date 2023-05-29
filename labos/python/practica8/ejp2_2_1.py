def pone_cero(lista: list) -> list:
    i = 0
    for numero in lista:
        if es_par(i):
            lista[i] = 0
            i = i + 1
        else:
            i = i + 1
    return lista

def es_par(numero: int) -> bool:
    if numero % 2 == 0:
        return True
    else:
        return False

res: list = pone_cero([0, 1, 2, 3, 4, 5, 6])
print(res)

