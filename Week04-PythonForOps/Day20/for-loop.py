# for loop

services = ["Cloudflare", "Google Public", "Quad9"]
count = 1
for sv in services:
    print(f"{count}. Penyedia layanan DNS: {sv}")
    count += 1
