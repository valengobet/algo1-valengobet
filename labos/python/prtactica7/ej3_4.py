def es_bisiesto(año: int) -> bool:
    return año % 400 == 0 or (año % 4 == 0 and not(año % 100 == 0))

res: bool= es_bisiesto(1900)
print(res)