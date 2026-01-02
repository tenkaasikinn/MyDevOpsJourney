try:
    angka = int(input("Masukin Nilai UAS mu brok: "))
except ValueError:
    print("Masukin angka brok")
    exit(1)

if angka > 85:
    print("nilai kamu A. Anjay keren, gas lagi brok")
elif angka > 75:
    print("nilai kamu B. Ya boleh lah, naikin lagi gas nya semester depan")
elif angka > 65:
    print("Nilai kamu C. Semangat dong")
else:
    print("Nilai kamu D. Selama ini ngapain aja?")
