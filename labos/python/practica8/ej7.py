def fortaleza(contrasenia: str) -> str:
    if roja(contrasenia):
        return "ROJA"
    if verde(contrasenia):
        return "VERDE"
    else:
        return "AMARILLA"


def roja(contrasenia: str) -> bool:
    if len(contrasenia) < 5:
        return True
    else: 
        return False

def verde(contrasenia: str) -> bool:
    if len(contrasenia) > 8 and tiene_mayuscula(contrasenia) and tiene_minuscula(contrasenia) and tiene_numero(contrasenia):
        return True
    else:
        return False


def tiene_mayuscula(contrasenia: str) -> bool:
    for i in contrasenia:
            if "A" <= i <= "Z":
                return True
    return False

def tiene_minuscula(contrasenia: str) -> bool:
    for i in contrasenia:
        if "a" <= i <= "z":
            return True
    return False

def tiene_numero(contrasenia: str) -> bool:
    for i in contrasenia:
        if "0" <= i <= "9":
            return True
    return False


res : str = fortaleza("maximina1")
print(res)