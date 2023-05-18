def peso_pino(altura_pino: float) -> float:
     if altura_pino <= 3:
        return altura_pino * 100 * 3
     else:
        return (300 * 3) + ((altura_pino - 3) * 100 * 2)


def es_peso_util(peso: float) -> bool:
    return 400 <= peso <= 1000


def sirve_pino(altura_pino: float) -> bool:
    return es_peso_util(peso_pino(altura_pino))

res: float = peso_pino(2.5)
print(res)

res2: bool = es_peso_util(2.5)
print(res2)

res3: bool = sirve_pino(2.5)
print(res3)