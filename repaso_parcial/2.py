def sacarRepetidos(l: list) -> list:
    res: list = []
    for elemento in l:
        if elemento not in res:
            res: list = res + [elemento]
    return res

l = [1,1,1,2,2,2,3,3,3,4]
res = sacarRepetidos(l)
print(res)