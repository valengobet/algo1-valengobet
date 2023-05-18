def devolver_valor_si_es_par_sino_el_que_sigue(numero: int) -> int:
    if numero % 2 == 0:
        return numero
    else:
        return numero + 1
    

res: int = devolver_valor_si_es_par_sino_el_que_sigue(5)
print(res)