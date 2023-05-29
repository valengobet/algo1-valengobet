def despegue(numero: int) -> str:
    for num in range(numero, -1, -1):
        if num != 0:
            print(str(num))
        else:
            print('Despegue!')

despegue(15)