from queue import Queue
from typing import List
from typing import Dict
from typing import Union
import json

# ACLARACIÓN: El tipo de "pedidos" debería ser: pedidos: Queue[Dict[str, Union[int, str, Dict[str, int]]]]
# Por no ser soportado por la versión de CMS, usamos simplemente "pedidos: Queue"
def procesamiento_pedidos(pedidos: Queue,
                          stock_productos: Dict[str, int],
                          precios_productos: Dict[str, float]) -> List[Dict[str, Union[int, str, float, Dict[str, int]]]]:

  pedidos_procesados = []

  while not pedidos.empty():
    pedido = pedidos.get()
    precio_total = 0
    pedido_procesado = {}
    estado_pedido = "completo"

    for clave in pedido:
      valor = pedido[clave]

      if clave != "productos":
        pedido_procesado[clave] = valor

      else:
        pedido_procesado[clave] = valor

        for producto in valor:
          if stock_productos[producto] >= valor[producto]:
            stock_productos[producto] = stock_productos[producto] - valor[producto]
          else:
            estado_pedido = "incompleto"
            pedido_procesado[clave][producto] = stock_productos[producto]
            stock_productos[producto] = 0

          precio_total += (precios_productos[producto] * valor[producto])
    pedido_procesado["precio_total"] = precio_total
    pedido_procesado["estado"] = estado_pedido
    pedidos_procesados.append(pedido_procesado)

  return pedidos_procesados              


if __name__ == '__main__':
  pedidos: Queue = Queue()
  list_pedidos = json.loads(input())
  [pedidos.put(p) for p in list_pedidos]
  stock_productos = json.loads(input())
  precios_productos = json.loads(input())
  print("{} {}".format(procesamiento_pedidos(pedidos, stock_productos, precios_productos), stock_productos))


# Ejemplo input  
# pedidos: [{"id":21,"cliente":"Gabriela", "productos":{"Manzana":2}}, {"id":1,"cliente":"Juan","productos":{"Manzana":2,"Pan":4,"Factura":6}}]
# stock_productos: {"Manzana":10, "Leche":5, "Pan":3, "Factura":0}
# precios_productos: {"Manzana":3.5, "Leche":5.5, "Pan":3.5, "Factura":5}