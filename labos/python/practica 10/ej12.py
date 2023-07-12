from queue import LifoQueue as Pila

def estaBienBalanceada(s: str) -> bool:
    p = Pila()
    for caracter in s:
        if caracter == "(":
            p.put(caracter)
        elif caracter == ")":
            if p.empty() or p.get() != "(":
                return False
    return p.empty()
    







s = "1 + ) 2 x 3 ( ( )"
res = estaBienBalanceada(s)
print(res)