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

res: bool = ordenados([4])
print(res)