def agregaFrase(archivo_in: str, frase: str) -> str:
    archivo = open(archivo_in, 'a', encoding = "utf-8")
    archivo.write('\n' + frase)
    archivo.close()

agregaFrase("archivo_4.txt", "esta es la frase nueva")