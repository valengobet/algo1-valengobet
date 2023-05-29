def saca_vocales(texto: str) -> str:
    sin_vocales = ''
    for i in texto:
        if not (i in ['a', 'e', 'i', 'o', 'u']):
            sin_vocales = sin_vocales + i
        else:
            sin_vocales = sin_vocales
    return sin_vocales

texto: str = "hola como estas"
res: str = saca_vocales(texto)
print("texto: " + texto)
print("texto: " + res)
