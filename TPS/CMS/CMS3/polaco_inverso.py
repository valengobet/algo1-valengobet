from queue import LifoQueue


# para el tipo pila de enteros, usar: "pila: LifoQueue". La notación "pila: LifoQueue[int]" no funciona.
def calcular_expresion(expr: str, pila: LifoQueue) -> float:
    # implementar función con el TAD Pila
    num = ''
    for caracter in expr:
      if caracter.isdigit() or caracter == '.':
        num = num + caracter
      
      elif caracter == ' ' and num != '':
        pila.put(float(num))
        num = ''
      
      elif caracter == '+':
        num2 = pila.get()
        num1 = pila.get()
        pila.put(num1 + num2)
      
      elif caracter == '-':
        num2 = pila.get()
        num1 = pila.get()
        pila.put(num1 - num2)
      
      elif caracter == '*':
        num2 = pila.get()
        num1 = pila.get()
        pila.put(num1 * num2)
      
      elif caracter == '/':
        num2 = pila.get()
        num1 = pila.get()
        pila.put(num1 / num2)


    return pila
   
if __name__ == '__main__':
  x = input()  # Por ejemplo: 2 5 * 7 +
  x = x.strip()
  pila = LifoQueue()
  calcular_expresion(x, pila)
  resultado = pila.get()
  print(round(resultado, 5))
