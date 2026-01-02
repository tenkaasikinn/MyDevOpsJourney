count = 1
with open("nama_mahasiwa.txt", "r") as m:
    for count, line in enumerate(m, start=1):
        print(f"{count}. {line.strip()}")
