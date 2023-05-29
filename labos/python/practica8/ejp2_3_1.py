def estudiantes() -> list:
    lista_alumnos = []
    alumno = input('Ingrese nombre de alumnos, ingrese "listo" cuando haya terminado: ')
    while alumno != 'listo':
        lista_alumnos = lista_alumnos + [alumno]
        alumno = input('Ingrese nombre de alumnos, ingrese "listo" cuando haya terminado: ')
    return lista_alumnos

print(estudiantes())