def viaje_en_el_tiempo(anio_partida: int, anio_llegada: int) -> str:
    for num in range(anio_partida - 1, anio_llegada - 1, -1):
        print('Viajo un anio al pasado, estamos en el anio: ' + str(num))

viaje_en_el_tiempo(2020, 2010)