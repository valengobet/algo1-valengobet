def nombreDeUsuario(ids_usuarios: list[(chr, chr)], id: list[chr]) -> list[chr]:
    res: list = []
    for i in range(len(id)):
        for j in range(len(ids_usuarios)):
            if id[i] == ids_usuarios[j][0]:
                res.append(ids_usuarios[j][1])
    return res


res = nombreDeUsuario([('1','v'),('2','g')], ['2','1'])
print(res)