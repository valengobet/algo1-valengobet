def es_capicua(palabra: str) -> bool:
    i: int = 0
    while i < len(palabra):
        if palabra[i] == palabra[len(palabra) - 1 - i]:
          i = i + 1
        else:
          return False
    return True

res: bool = es_capicua('neuquen')
print(res)