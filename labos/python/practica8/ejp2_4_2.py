def esMatriz(s: list) -> bool:
    i = 0
    while i < len(s):
        if len(s[0]) == len(s[i]):
            i = i+1
        else:
            return False
    return True

lista: list = [[1,2,3],
               [1,4,5],
               [1,6,7]]
               
res: bool = esMatriz(lista)
print(res)