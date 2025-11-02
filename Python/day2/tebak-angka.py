import random

angka_rahasia = random.randint(1, 10)

print("Tebak angka antara 1 sampai 10")

while True:
    tebakan = int(input("Masukkan tebakan kamu: "))

    if tebakan < angka_rahasia:
        print("kekecilan")
    elif tebakan > angka_rahasia:
        print("kebesaran")
    else:
        print("wah benar")
        break
