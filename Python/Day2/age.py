usia = int(input("Masukkan usia kamu:"))

if usia <= 13:
    print("Kamu anak-anak")
elif usia <= 19:
    print("kamu remaja")
elif usia <= 59:
    print("kamu dewasa")
else:
    print("kamu lansia")