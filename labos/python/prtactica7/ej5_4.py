def cantidad_de_letras(nombre: str) -> str:
    if len(nombre) >= 5:
        return 'Tu nombre tienenmuchas letras!!'
    if len(nombre) < 5:
        return 'Tu nombre tiene menos de 5 letras.'


res: str = cantidad_de_letras('valentin')
print(res)