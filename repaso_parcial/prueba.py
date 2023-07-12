def vaciarSecuencia (s: list[int]) -> list[int]:
    for i in range(len(s)):
        s[i] = 0
    return s

s = [1,1,1]
res = vaciarSecuencia(s)
print(res)