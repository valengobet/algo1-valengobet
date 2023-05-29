def daVueltaStr(texto: str) -> str:
    dado_vuelta: str = ''
    for i in range(len(texto) - 1, -1, -1):
        dado_vuelta = dado_vuelta + texto[i]
    return dado_vuelta

texto: str = "hola como estas"
res: str = daVueltaStr(texto)

print("texto: " + texto)
print("texto dado vuelta: " + res)