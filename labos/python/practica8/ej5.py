def masDe7(lista: list) -> bool:
    i: int = 0
    for palabra in lista:
        if len(palabra) > 7:
            return True
    return False


res: bool = masDe7(['Hola', 'como', 'estas', 'Valen'])
print(res)