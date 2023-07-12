import random
from queue import Queue as Cola

def generarNrosAlAzar(n: int, desde: int, hasta: int) -> list[int]:
    secuencia = []
    for i in range(desde, hasta + 1, 1):
        secuencia = secuencia + [i]
    NrosAlAzar = random.sample(secuencia, n)
    return NrosAlAzar

def armarCola(numeros: list) -> Cola:
    cola = Cola()
    for numero in numeros:
        cola.put(numero)
    return cola

numeros = generarNrosAlAzar(4, 0, 10)
print(numeros)
cola = armarCola(numeros)
print(cola)
cola.put(10)
print(cola.get())
