with open("pesan.txt", "r") as file:
    isi = file.read()

print("Hasil dari isi pesan adalah")
print(isi)

isi_baru = isi.upper()

with open("hasil.txt", "w") as file:
    file.write(isi_baru)

print("\nPerubahan tolong di cek di hasil.txt")