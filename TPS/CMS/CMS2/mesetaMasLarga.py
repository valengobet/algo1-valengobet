from typing import List

# Aclaración: Debido a la versión de Python del CMS, para el tipo Lista, la sintaxis de la definición de tipos que deben usar es la siguiente:
# l: List[int]  <--Este es un ejemplo para una lista de enteros.
# Respetar esta sintaxis, ya que el CMS dirá que no pasó ningún test si usan otra notación.
def mesetaMasLarga(l: List[int]) -> int :
  #Implementar esta funcion 
  res = []
  for meseta in separaMesetas(l):
    if len(res) <= len(meseta):
      res = meseta
  return len(res)


def separaMesetas(l: List[int]) -> List[List[int]]:
  i = 0
  e = 0
  lista_mesetas: List[List[int]] = []
  while i < len(l):
    if i == 0:
      lista_mesetas = lista_mesetas + [[]]
      lista_mesetas[e] = lista_mesetas[e] + [l[0]]
      i += 1
    else:
      if l[i] == l[i-1]:
        lista_mesetas[e] = lista_mesetas[e] + [l[i]]
        i += 1
      else:
        lista_mesetas = lista_mesetas + [[]]
        e += 1
        lista_mesetas[e] = lista_mesetas[e] + [l[i]]
        i +=1
  return lista_mesetas




if __name__ == '__main__':
  x = input()
  print(mesetaMasLarga([int(j) for j in x.split()]))