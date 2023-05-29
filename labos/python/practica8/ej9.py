def tres_vocales(palabra: str) -> bool:
    if len(saca_repetidas(saca_consonates(palabra))) >= 3:
        return True
    else:
        return False

def saca_consonates(palabra: str) -> str:
    sin_consonantes = ''
    for i in palabra:
        if i in ['a', 'e', 'i', 'o', 'u']:
            sin_consonantes = sin_consonantes + i
        else:
            sin_consonantes = sin_consonantes
    return sin_consonantes

def saca_repetidas(palabra: str) -> str:
    sin_repetidas = ''
    for i in palabra:
        if i not in sin_repetidas:
            sin_repetidas = sin_repetidas + i
        else:
            sin_repetidas = sin_repetidas
    return sin_repetidas


res: str = tres_vocales("abecedario")
print(res)