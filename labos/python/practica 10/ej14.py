from queue import Queue as Cola

def cantidadDeElementos(c: Cola) -> int:
    c_copia = c
    esVacia = False
    elementos = 0
    while esVacia == False:
        c_copia.get()
        elementos += 1
        esVacia = c_copia.empty()
    return elementos

c = Cola()
c.put(1)
c.put(2)
c.put(3)
c.get()
res = cantidadDeElementos(c)
print(res)