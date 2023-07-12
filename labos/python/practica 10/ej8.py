import random

def generarNrosAlAzar(n: int, desde: int, hasta: int) -> list[int]:
    secuencia = []
    for i in range(desde, hasta + 1, 1):
        secuencia = secuencia + [i]
    NrosAlAzar = random.sample(secuencia, n)
    return NrosAlAzar

print(generarNrosAlAzar(3, 0, 1000))