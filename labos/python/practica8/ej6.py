def es_palindroma(texto : str) -> bool:
    textoinverso = inverso(elimina_espacios(texto))
    if elimina_espacios(texto) == textoinverso:
        return True
    else:
        return False


def inverso(texto: str) -> str:
    inverso: str = ''
    for i in range(len(texto) - 1, -1, -1):
        inverso = inverso + texto[i]
    return inverso

def elimina_espacios(texto: str) -> str:
    sin_espacios: str = ''
    for caracter in texto:
        if caracter != ' ':
            sin_espacios = sin_espacios + caracter
        else:
            sin_espacios = sin_espacios
    return sin_espacios
    
res: bool = es_palindroma('a mama roma le aviva el amor a papa y a papa roma le aviva el amor a mama')
print(res)