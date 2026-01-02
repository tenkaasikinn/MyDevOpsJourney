with open("distro-linux.txt", "r")as d:
    for line in d:
        print(line.strip())

with open("distro-baru.txt", "w")as d:
    d.write("Gentoo\nLinux from Scratch\n")

with open("distro-baru.txt", "a")as d:
    d.write("Gobo Linux\nFedora Rawhide\nBedrock Linux\n")
