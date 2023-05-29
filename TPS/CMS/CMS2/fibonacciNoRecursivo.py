import sys

def fibonacciNoRecursivo(n: int) -> int:
  # Implementar esta funcion
  lista = []
  i = 0
  while i <= n:
    if i == 0:
      lista = lista + [0]
      i += 1
    if i == 1:
      lista = lista + [1]
      i += 1
    if n >= 2:
      lista = lista + [lista[i-1] + lista[i-2]]
      i +=1
  return lista[n]

if __name__ == '__main__':
  x = int(input())
  print(fibonacciNoRecursivo(x))