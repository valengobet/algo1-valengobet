class Multiset:

    def __init__(self):
        self.elements = []  # Inicializa la lista vacía en el constructor

    def add(self, val):
        # adds one occurrence of val from the multiset, if any
        self.elements.append(val)
        pass
    
    def remove(self, val):
        # removes one occurrence of val from the multiset, if any
        if val in self.elements:
            self.elements.remove(val)
        pass
        
    def __contains__(self, val):
        # returns True when val is in the multiset, else returns False
        if val in self.elements:
            return True
        return False
    
    def __len__(self):
        # returns the number of elements in the multiset
        contador = 0
        for elemento in self.elements:
            contador += 1
        return contador

    def imprime(self):
        lista = []
        for elemento in self.elements:
            lista.append(elemento)
        print(lista)

objeto = Multiset()
objeto.add(1)
objeto.add(2)
objeto.add(4)
objeto.remove(3)
objeto.imprime()
longitud = objeto.__len__()
print(str(longitud))