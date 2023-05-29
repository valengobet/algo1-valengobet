def conocer_aristoteles(anio_partida: int) -> str:
    for num in range(anio_partida - 20, -384, -20):
        if num >= 0:
            print('Viajo 20 anios al pasado, estamos en el anio: ' + str(num) + 'd.C')
        else: 
            print('Viajo 20 anios al pasado, estamos en el anio: ' + str((-1) * num) + 'a.C')

conocer_aristoteles(2020)