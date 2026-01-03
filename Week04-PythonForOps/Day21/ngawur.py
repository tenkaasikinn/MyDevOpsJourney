import argparse

nama = argparse.ArgumentParser()

nama.add_argument("-t", "--tenka", action="store_true")
nama.add_argument("-v", "--violet", action="store_true")
nama.add_argument("-p", "--path")

hasil = nama.parse_args()

if hasil.tenka:
    print("Tenka Asikin")
else:
    print("Violet Evergarden")

print("PATH:", hasil.path)
