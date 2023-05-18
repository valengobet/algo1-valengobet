def viaje_en_el_tiempo(año_partida, año_llegada) -> str:
    año_partida = año_partida - 1
    while año_partida >= año_llegada:
        print('Viajo un año al pasado, estamos en el año: ' + str(año_partida))
        año_partida = año_partida - 1

viaje_en_el_tiempo(2023, 2018)