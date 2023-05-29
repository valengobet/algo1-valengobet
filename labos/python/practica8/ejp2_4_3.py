def filasOrdenadas(m: list) -> bool:
    i = 0
    res = []
    while i < len(m):
        if ordenados(m[i]):
            res = res + [True]
            i = i+1
        else:
            res = res + [False]
            i = i+1
    return res




def ordenados(lista: list) -> bool:
    i: int = 0
    while i < len(lista):
        if len(lista) == 1:
            return True
        if i == len(lista) - 1 and lista[i] > lista[i-1]:
            return True
        if lista[i] < lista[i+1]:
            i = i + 1
        else: 
            return False
    return True

lista: list = [[1,2,3],
               [2,4,5],
               [1,2,3]]
               
res: bool = filasOrdenadas(lista)
print(res)