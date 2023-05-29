def historial() -> list:
    historial = []
    operacion = input('Ingrese "C" para cargar creditos, "D" para descontar creditos y "X" para finalizar: ')
    while operacion == 'C' or operacion == 'D':
        if operacion == "C":
            monto_cargar = input('Ingrese la cantidad de creditos a cargar: ')
            historial = historial + [("C", monto_cargar)]
            operacion = input('Ingrese "C" para cargar creditos, "D" para descontar creditos y "X" para finalizar: ')
        if operacion == "D":
            monto_descontar = input('Ingrese la cantidad de creditos a descontar: ')
            historial = historial + [("D", monto_descontar)]
            operacion = input('Ingrese "C" para cargar creditos, "D" para descontar creditos y "X" para finalizar: ')
    return historial

res = historial()
print(res)



