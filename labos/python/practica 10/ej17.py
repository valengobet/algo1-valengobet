from queue import Queue as Cola

def nPacientesUrgentes(c: Cola[(int,str,str)]) -> int:
    pacientes_urgentes = 0
    while not c.empty():
        elemento = c.get()
        if elemento[0] <= 3:
            pacientes_urgentes += 1
    return pacientes_urgentes

c = Cola()
c.put((1, "nombre", "especialidad"))
c.put((2, "juan", "traumatologia"))
c.put((3, "juan", "traumatologia"))
c.put((4, "juan", "traumatologia"))
c.put((5, "juan", "traumatologia"))

res = nPacientesUrgentes(c)
print(res)