from queue import LifoQueue as Pila
import random

def generarNrosAlAzar(n: int, desde: int, hasta: int) -> list[int]:
    secuencia = []
    for i in range(desde, hasta + 1, 1):
        secuencia = secuencia + [i]
    NrosAlAzar = random.sample(secuencia, n)
    return NrosAlAzar

def generaPila(numeros: list[int]) -> list:
    p = Pila()
    for i in range(0, len(numeros), 1):
        p.put(numeros[i])
    return p

numeros = generarNrosAlAzar(3, 0, 100)
print(numeros)
pila = generaPila(numeros)
print(pila.get())