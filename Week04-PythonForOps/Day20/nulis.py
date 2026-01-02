with open("nama_mahasiwa.txt", "w") as n:
    n.write("Tenka\nMochi\n")

with open("nama_mahasiwa.txt", "a") as n:
    n.write("Cronous\n")

with open("nama_mahasiwa.txt", "r") as n:
    for line in n:
        print(line.strip())
