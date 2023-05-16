def es_multiplo_de(n: int, m: int) -> bool:
    if m % n == 0:
        return True
    else: 
        return False

def es_par(numero: int) -> bool:
    if es_multiplo_de(2, numero):
        return True
    else:
        return False



#res = es_multiplo_de(3, 10)
#print(res)

res = es_par(5)
print(res)

