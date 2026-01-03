import argparse

parser = argparse.ArgumentParser()

parser.add_argument("-b", "--backup", action="store_true")
parser.add_argument("-r", "--restore", action="store_true")
parser.add_argument("-s", "--source")
parser.add_argument("-d", "--dest")

args = parser.parse_args()

print(args)
