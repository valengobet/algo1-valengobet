from typing import List
from typing import Tuple

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista y Tupla, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# t: Tuple[str,str]  <--Este es un ejemplo para una tupla de strings.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def sePuedeLlegar(origen: str, destino: str, vuelos: List[Tuple[str, str]]) -> int :
  # definir esta función
  if vueloDirecto(origen, destino, vuelos):
    return 1
  if origenSinVuelos(origen, vuelos) or destinoSinVuelos(destino, vuelos):
    return -1
  else:
    return viajeConEscalas(origen, destino, vuelos)
  


def vueloDirecto(origen: str, destino: str, vuelos: List[Tuple[str, str]]) -> bool:
  for i in range(len(vuelos)):
    if origen == vuelos[i][0] and destino == vuelos[i][1]:
      return True
  return False

def origenSinVuelos(origen: str, vuelos: List[Tuple[str, str]]) -> bool:
  for i in range(len(vuelos)):
    if origen == vuelos[i][0]:
      return False
  return True

def destinoSinVuelos(destino: str, vuelos: List[Tuple[str, str]]) -> bool:
  for i in range(len(vuelos)):
    if destino == vuelos[i][1]:
      return False
  return True  

def viajeConEscalas(origen: str, destino: str, vuelos: List[Tuple[str, str]]) -> int:
  origen = origen
  destino = destino
  i = 0
  vuelos_tomados = 0 
  while i < len(vuelos):
    if origen == vuelos[i][0] and origen != destino:
      origen = vuelos[i][1]
      i = 0
      vuelos_tomados = vuelos_tomados + 1
    else:
      i += 1
  if origen == destino:
    return vuelos_tomados
  else:
    return -1

if __name__ == '__main__':
  origen = input()
  destino = input()
  vuelos = input()
  
  print(sePuedeLlegar(origen, destino, [tuple(vuelo.split(',')) for vuelo in vuelos.split()]))