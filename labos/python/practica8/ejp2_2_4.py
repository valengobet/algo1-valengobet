def reeplazaVocales(texto: str) -> str:
    texto_sin_vocales = ''
    i: int = 0
    while i < len(texto):
        if texto[i] in ['a', 'e', 'i', 'o', 'u']:
            texto_sin_vocales = texto_sin_vocales + '_'
            i = i + 1
        else:
            texto_sin_vocales = texto_sin_vocales + texto[i]
            i = i + 1
    return texto_sin_vocales


texto: str = "hola como estas"
res: str = reeplazaVocales(texto)
print("texto: " + texto)
print("texto: " + res)

