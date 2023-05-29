import random

def siete_medio() -> list:
    carta: int = random.choice([1, 2, 3, 4, 5, 6, 7, 10, 11, 12])
    historial = [carta]
    if carta == 10 or carta == 11 or carta == 12:
        puntaje = 0.5
    else:
        puntaje = carta
        
    jugada = input('Usted saco la carta: ' + str(carta) + ', su puntaje es: ' + str(puntaje) + '. Ingrese "sacar" para sacar otra carta o "plantarse" para plantarse: ')
    
    if jugada == "plantarse":
        return historial

    while jugada == "sacar":
        carta: int = random.choice([1, 2, 3, 4, 5, 6, 7, 10, 11, 12])
        historial = historial + [carta]
        if carta == 10 or carta == 11 or carta == 12:
            puntaje = puntaje + 0.5
        else:
          puntaje = puntaje + carta
        if puntaje > 7.5:
            print('Usted ha perdido')
            return historial
        
        jugada = input('Usted saco la carta: ' + str(carta) + ', su puntaje es: ' + str(puntaje) + '. Ingrese "sacar" para sacar otra carta o "plantarse" para plantarse: ')
    return historial


res = siete_medio()
print(res)