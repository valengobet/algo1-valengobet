def f(s1: list[int], s2: list[int]):
    i: int = 0
    a: int = 0
    b: int = 0
    while i < len(s1):
        a = s1[i]
        if i >= len(s2):
            b = 0
        else:
            b = s2[i]
        s1[i] = a + b
        if i < len(s2):
            if a - b > 0:
                s2[i] = b - a
            else:
                s2[i] = a - b
        i += 1
    return s1 ,s2

s1 = [1]
s2 = [1]
res = f(s1, s2)
print(res)