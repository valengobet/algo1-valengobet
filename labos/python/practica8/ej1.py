def pertenece(lista: list, elem_buscado) -> bool:
    for i in range(0, len(lista), 1):
        if lista[i] == elem_buscado:
            return True
    return False

res: bool = pertenece([1, 2, 3, 'Hola'], 'Hola')
print(res)