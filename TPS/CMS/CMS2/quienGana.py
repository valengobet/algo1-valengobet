import sys

def quienGana(j1: str, j2: str) -> str : 
    #Implementar esta funcion
  if gana(j1, j2):
    return "Jugador1"
  if gana(j2, j1):
    return "Jugador2"
  else:
    return "Empate"


def gana(j1: str, j2: str) -> bool:
  if piedraGanaATijera(j1, j2) or tijeraGanaAPapel(j1, j2) or papelGanaAPiedra(j1, j2):
    return True
  else:
    return False

def piedraGanaATijera(j1: str, j2: str) -> bool:
  if j1 == "Piedra" and j2 == "Tijera":
    return True
  else:
    return False

def tijeraGanaAPapel(j1: str, j2: str) -> bool:
  if j1 == "Tijera" and j2 == "Papel":
    return True
  else:
    return False

def papelGanaAPiedra(j1: str, j2: str) -> bool:
  if j1 == "Papel" and j2 == "Piedra":
    return True
  else:
    return False


if __name__ == '__main__':
  x = input()
  jug = str.split(x)
  print(quienGana(jug[0], jug[1]))