def viaje_en_el_tiempo(año_partida) -> str:
    año_partida = año_partida - 20
    while año_partida >= -384:
        if año_partida >= 0:
            print('Viajo 20 años al pasado, estamos en el año: ' + str(año_partida) + ' d.C')
            año_partida = año_partida - 20
        else:
            print('Viajo 20 años al pasado, estamos en el año: ' + str(-1 * año_partida) + ' a.C')
            año_partida = año_partida - 20

viaje_en_el_tiempo(2023)