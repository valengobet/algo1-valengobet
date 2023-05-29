def saldo(movimientos: list) -> int:
    saldo: int = 0
    for movimiento in movimientos:
        if movimiento[0] == "I":
            saldo = saldo + movimiento[1]
        if movimiento[0] == "R":
            saldo = saldo - movimiento[1]
    return saldo

res: int = saldo([("I", 2000), ("R", 20), ("R", 1000), ("I", 300)])
print(res)