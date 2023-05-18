def devolver_el_doble_si_es_par(numero: int) -> int:
    if numero % 2 == 0:
        return 2 * numero
    else:
        return numero
    

res: int = devolver_el_doble_si_es_par(4)
print(res)