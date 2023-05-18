def vacaciones_trabajo(sexo: chr, edad: int) -> str:
    if edad < 18:
        return 'Anda de vacaciones.'
    if sexo == 'M' and edad >= 60:
        return 'Anda de vacaciones'
    if edad >= 65:
        return 'Anda de vacaciones'
    else: 
        return 'Te toca trabajar'

res: str = vacaciones_trabajo('M', 17)
print(res)