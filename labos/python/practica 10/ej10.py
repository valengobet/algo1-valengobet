from queue import LifoQueue as Pila

def cantidadElementos(p: list) -> int:
    y = p
    esVacia = False
    i = 0
    while esVacia == False:
        y.get()
        i += 1
        esVacia = y.empty()
    return i

p = Pila()
p.put(1)
p.put(2)
p.put(3)
p.put(3)
p.put(3)
p.put(3)
p.put(3)
res = cantidadElementos(p)
print(str(res))