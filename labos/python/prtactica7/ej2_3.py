def imprimir_dos_veces(estribillo: str) -> str:
    res: str = 2 * (estribillo)
    return res

res = imprimir_dos_veces('En su cabeza lleva una bandera, Ella no quiere ser como cualquiera, Ella adora mostrar la paja de la cara ajena, Y dentro de su cuento ella era cenicienta, Su príncipe era un hippie de los años sesenta, Te amo, te odio, dame más.')
print('El estribillo es: ' + res)