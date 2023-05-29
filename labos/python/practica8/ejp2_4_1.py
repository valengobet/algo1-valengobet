def perteneceACadaUno(s: list, e: int) -> list:
    i = 0
    res = []
    while i < len(s):
        if pertenece(s[i], e):
            res = res + [True]
            i = i + 1
        else:
            res = res + [False]
            i = i+1
    return res



def pertenece(lista: list, elem_buscado) -> bool:
    for i in range(0, len(lista), 1):
        if lista[i] == elem_buscado:
            return True
    return False

lista: list = [[1,2,3], [1,4,5], [0,6,7]]
res: bool = perteneceACadaUno(lista, 1)
print(res)