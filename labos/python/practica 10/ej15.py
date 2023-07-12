from queue import Queue as Cola

def buscarElMaximo(c: Cola) -> int:
    maximo = c.get()
    esVacio = c.empty()
    while esVacio == False:
        elemento = c.get()
        if elemento > maximo:
            maximo = elemento
        esVacio = c.empty()
    return maximo


c = Cola()
c.put(1)
c.put(2)
c.put(3)
c.put(4)
c.put(5)
res = buscarElMaximo(c)
print(res)