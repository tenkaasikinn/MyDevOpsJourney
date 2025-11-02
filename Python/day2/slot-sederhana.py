import random

nb = random.randint(1, 10)
cc = 3

print("Selamat datang di slot sederhana dan silahkan masukkan angka anda tapi ingat anda hanya memiliki 3 kesempatan")

while cc > 0:
    gs = int(input("Silahkan masukkan tebakanmu: "))

    if gs < nb:
        print("Salah terlalu kecil")
    elif gs > nb:
        print("Salah terlalu besar")
    else:
        print("Benar")
        break

    cc -= 1
    print(f"Kesempatan kamu tersisa {cc}")

    if cc == 0:
        print(f"Sayang sekali tapi ini nomor yang benar {nb}")