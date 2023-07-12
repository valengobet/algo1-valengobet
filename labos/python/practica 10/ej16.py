from queue import Queue as Cola
import random

def armarSecuenciaBingo() -> Cola[int]:
    secuencia_ord = []
    i = 0
    while i < 100:
        secuencia_ord = secuencia_ord + [i]
        i += 1
    random.shuffle(secuencia_ord)
    print("El bolillero es: " + str(secuencia_ord))
    c = Cola()
    for numero in secuencia_ord:
        c.put(numero)
    return c

def jugarCartonDeBingo(carton: list[int], bolillero: Cola[int]) -> int:
    jugadas = 0
    copia_carton = copia(carton)
    print(copia_carton)
    while len(copia_carton) > 0:
        numero = bolillero.get()
        if numero in copia_carton:
            copia_carton.remove(numero)
        jugadas += 1
    return jugadas

def copia(carton: list[int]) -> list[int]:
    copia_carton = []
    for numero in carton:
        copia_carton.append(numero)
    return copia_carton


def generarNrosAlAzar(n: int, desde: int, hasta: int) -> list[int]:
    secuencia = []
    for i in range(desde, hasta + 1, 1):
        secuencia = secuencia + [i]
    NrosAlAzar = random.sample(secuencia, n)
    return NrosAlAzar

carton = generarNrosAlAzar(12, 0, 99)
print("El carton es: " + str(carton))
bolillero = armarSecuenciaBingo()
res = jugarCartonDeBingo(carton, bolillero)
print("El carton ahora es:" + str(carton))
print("Jugadas: " + str(res))
    