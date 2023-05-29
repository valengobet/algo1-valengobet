def pone_cero(lista: list) -> list:
    lista_con_ceros: list = []
    i = 0
    for numero in lista:
        if es_par(i):
            lista_con_ceros = lista_con_ceros + [0]
            i = i + 1
        else:
            lista_con_ceros = lista_con_ceros + [lista[i]]
            i = i + 1
    return lista_con_ceros

def es_par(numero: int) -> bool:
    if numero % 2 == 0:
        return True
    else:
        return False
lista = [0, 1, 2, 3, 4, 5, 6]
res: list = pone_cero(lista)
print("lista: " + str(lista))
print("lista_con_ceros: " + str(res))
