from queue import LifoQueue as Pila
def buscarElMaximo(p: list) -> int:
    maximo = p.get()
    esVacia = p.empty()
    while esVacia == False:
        elemento = p.get()

        if elemento > maximo:
            maximo = elemento

        esVacia = p.empty()
    return maximo

p = Pila()
p.put(1)
p.put(2)
p.put(3)
p.put(4)
p.put(5)
res = buscarElMaximo(p)
print(res)
