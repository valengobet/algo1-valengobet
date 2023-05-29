def imprime_pares() -> str:
    x = 10
    while x <= 40:
        if x % 2 == 0:
            print(x)
            x = x + 1
        else:
            x = x + 1

imprime_pares()
