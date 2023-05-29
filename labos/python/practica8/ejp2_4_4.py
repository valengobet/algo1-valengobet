import numpy as np 

def multiplica_raiz(d: int, p: float) -> list:
    m = np.random.randint(1, 5, (d,d))
    print("la matriz es: " + str(m))
    res = np.copy(m)
    for _ in range(p):
        res_temp = np.zeros((d,d))
        for i in range(d):
            for j in range(d):
                for n in range(d):
                    res_temp[i][j] += res[i][n] * res[n][j]
        res = np.copy(res_temp)
    return res

res = multiplica_raiz(2, 3)
print("el resultado es: "+ str(res))


        
