def agregaFraseInicio(archivo_in: str, frase: str) -> str:
    archivo = open(archivo_in, 'r', encoding = "utf-8")
    contenido = archivo.read()
    archivo = open(archivo_in, 'w', encoding = "utf-8")
    archivo.write(frase + '\n' + contenido)

agregaFraseInicio("archivo_5.txt", "esta es la frase nueva")