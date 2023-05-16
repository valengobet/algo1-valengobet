def factorial_n(num: int) -> int:
    if num == 0:
        return 1
    else:
        return num * factorial_n(num - 1)

num = input('Ingrese un numero: ')
res = factorial_n(int(num))
print('El factorial de ' + str(num) + ' es ' + str(res))
        