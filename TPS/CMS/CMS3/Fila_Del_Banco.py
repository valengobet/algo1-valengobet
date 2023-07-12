from queue import Queue

# El tipo de fila debería ser Queue[int], pero la versión de python del CMS no lo soporta. Usaremos en su lugar simplemente "Queue"
def avanzarFila(fila: Queue, min: int):
  #implementar función
  numero = fila.qsize()
  no_atendido = 0
  atendido = 0
  if min >= 60:
    while min > 60:
      for tiempo in range(0, 61, 1):
        if tiempo % 4 == 0:
          fila.put(numero+1)
          numero += 1
        if (tiempo == 1 or (tiempo - 1) % 10 == 0) and not fila.empty():
          fila.get()
        if (tiempo == 3 or (tiempo - 3) % 4 == 0) and not fila.empty():
          fila.get()
        if (tiempo == 2 or (tiempo - 2) % 4 == 0) and not fila.empty():
          atendido = fila.get()
          no_atendido = tiempo
        if no_atendido + 3 == tiempo and atendido != 0:
          fila.put(atendido)
      min = min - 60
    if min < 60 and min != 0:
      for tiempo in range(0, min+1, 1):
        if tiempo % 4 == 0:
          fila.put(numero+1)
          numero += 1
        if (tiempo == 1 or (tiempo - 1) % 10 == 0) and not fila.empty():
          fila.get()
        if (tiempo == 3 or (tiempo - 3) % 4 == 0) and not fila.empty():
          fila.get()
        if (tiempo == 2 or (tiempo - 2) % 4 == 0) and not fila.empty():
          atendido = fila.get()
          no_atendido = tiempo
        if no_atendido + 3 == tiempo and atendido != 0:
          fila.put(atendido)

  else:
    for tiempo in range(0, min+1, 1):
      if tiempo % 4 == 0:
        fila.put(numero+1)
        numero += 1
      if (tiempo == 1 or (tiempo - 1) % 10 == 0) and not fila.empty():
        fila.get()
      if (tiempo == 3 or (tiempo - 3) % 4 == 0) and not fila.empty():
        fila.get()
      if (tiempo == 2 or (tiempo - 2) % 4 == 0) and not fila.empty():
        atendido = fila.get()
        no_atendido = tiempo
      if no_atendido + 3 == tiempo and atendido != 0:
        fila.put(atendido)
  return fila

if __name__ == '__main__':
  fila: Queue = Queue()
  fila_inicial: int = int(input())
  for numero in range(1, fila_inicial+1):
    fila.put(numero)
  min: int = int(input())
  avanzarFila(fila, min)
  res = []
  for i in range(0, fila.qsize()):
    res.append(fila.get())
  print(res)


# Caja1: Empieza a atender 10:01, y atiende a una persona cada 10 minutos
# Caja2: Empieza a atender 10:03, atiende a una persona cada 4 minutos
# Caja3: Empieza a atender 10:02, y atiende una persona cada 4 minutos, pero no le resuelve el problema y la persona debe volver a la fila (se va al final y tarda 3 min en llegar. Es decir, la persona que fue atendida 10:02 vuelve a entrar a la fila a las 10:05)
# La fila empieza con las n personas que llegaron antes de que abra el banco. Cuando abre (a las 10), cada 4 minutos llega una nueva persona a la fila (la primera entra a las 10:00)

