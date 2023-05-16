import math

def cantidad_de_pizzas(comensales: int, porciones: int) -> int:
    res: int = math.ceil((comensales * porciones) / 8)
    return res

print(str(cantidad_de_pizzas(10, 3)))
