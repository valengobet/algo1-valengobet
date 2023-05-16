import math

def raizDe2(num: int) -> float:
    res: float = round(math.sqrt(num), 4)
    return res

num = input('Ingrese un numero: ')
res = raizDe2(int(num))
print('La raiz cuadrada de ' + str(num) + ' es: ' + str(res))

