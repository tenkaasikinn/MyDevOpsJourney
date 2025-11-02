import random

angka_rahasia = random.randint(1, 10)
kesempatan = 3

print("Tebak angka antara 1 sampai 10! Kamu hanya punya 3 kesempatan!")

while kesempatan > 0:
    tebakan = int(input("Masukkan tebakanmu: "))

    if tebakan < angka_rahasia:
        print("Salah! Angka terlalu kecil.")
    elif tebakan > angka_rahasia:
        print("Salah! Angka terlalu besar.")
    else:
        print("Selamat! Kamu benar!")
        break

    kesempatan -= 1
    print(f"Sisa kesempatan kamu {kesempatan}")

    if kesempatan == 0:
        print(f"Gagal dasar Goblok wkwkwk, nih angkanya {angka_rahasia}.")

