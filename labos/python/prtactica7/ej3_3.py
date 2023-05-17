def es_nombre_largo(nombre: str) -> bool:
    return 3 <= len(nombre) and len(nombre) <= 8

res: bool= es_nombre_largo('valentin') 
print(res)