def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero: int) -> int:
    if numero % 9 == 0:
        return 3 * numero
    if numero % 3 == 0:
        return 2 * numero
    else:
        return numero

res: int = devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(18)
print(res)