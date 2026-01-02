def check_disk(usage):
    if usage > 90:
        print("BAHAYA")
    elif usage > 80:
        print("PERINGATAN")
    else: 
        print("AMAN")

print(check_disk(85))
