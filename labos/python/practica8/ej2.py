def divideATodos(lista: list, d: int) -> bool:
    i = 0
    while i < len(lista):
        if lista[i] % d == 0:
            i = i + 1
        else: 
            return False
    return True



res: bool = divideATodos([2, 4, 6, 8], 2)
print(res)