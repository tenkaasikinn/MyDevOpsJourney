# Day 5 - Network Check

**Tanggal:** 2025-11-20  
**Fokus:** Analisis koneksi, port, DNS, dan HTTP(S) check.  

---

## 1️⃣ Ringkasan

Hari ini saya fokus mempelajari:
- Ping beberapa host untuk cek koneksi.
- Mengecek konfigurasi interface dan routing.
- Mengecek DNS dan konfigurasi NetworkManager.
- Melihat port yang listening dan koneksi aktif.
- Menguji HTTP(S) dengan `curl`.

---

## 2️⃣ Tools yang Digunakan

- `ping`  
- `ip`, `nmcli`  
- `ss`  
- `curl`  
- Bash scripting  

---

## 3️⃣ Langkah-langkah

1. Ping ke host publik (8.8.8.8, 1.1.1.1, google.com).  
2. Cek alamat IP, interface, dan route aktif.  
3. Ambil info DNS dan status koneksi dari NetworkManager.  
4. Cek port yang listening (`ss -tulnp`) dan koneksi aktif (`ss -tuna`).  
5. Tes HTTP(S) endpoint dengan `curl -w` dan `curl -v`.  

---

## 4️⃣ Hasil (Contoh)

**Ping Google.com:**

`PING google.com (142.251.10.101) 56(84) bytes of data.
64 bytes from 142.251.10.101: icmp_seq=1 ttl=118 time=10.5 ms
...`


**HTTP Test:**

`Total: 0.417037s
Connected to facebook.com (57.144.186.1) port 443
TLS handshake successful
HTTP/2 301`


---

## 5️⃣ Script

> Script ini otomatis melakukan semua langkah di atas dan menyimpan hasil ke file log.

```bash
#!/bin/bash
# ==============================
# Day 5 Network Check - DevOps
# ==============================

TARGET_DIR="$HOME/MyDevOpsJourney/Day5"
LOG_FILE="$TARGET_DIR/network_report_$(date +%Y%m%d_%H%M%S).log"

mkdir -p "$TARGET_DIR"

echo "===== Network Check Report =====" > "$LOG_FILE"
echo "Date: $(date)" >> "$LOG_FILE"
echo >> "$LOG_FILE"

# 1️⃣ Ping test
echo ">>> Ping Test" >> "$LOG_FILE"
for host in 8.8.8.8 1.1.1.1 google.com; do
    echo "--> Pinging $host" >> "$LOG_FILE"
    ping -c 4 $host >> "$LOG_FILE" 2>&1
    echo >> "$LOG_FILE"
done

# 2️⃣ Interface & Route
echo ">>> IP Addresses & Routes" >> "$LOG_FILE"
ip a >> "$LOG_FILE"
echo >> "$LOG_FILE"
ip route >> "$LOG_FILE"
echo >> "$LOG_FILE"

# 3️⃣ NetworkManager info
echo ">>> NetworkManager DNS & Connection Info" >> "$LOG_FILE"
nmcli dev show | grep DNS >> "$LOG_FILE"
nmcli connection show >> "$LOG_FILE"
nmcli general status >> "$LOG_FILE"
echo >> "$LOG_FILE"

# 4️⃣ Socket & Port Info
echo ">>> Listening Ports (ss -tulnp)" >> "$LOG_FILE"
ss -tulnp >> "$LOG_FILE"
echo >> "$LOG_FILE"

echo ">>> Active Connections (ss -tuna)" >> "$LOG_FILE"
ss -tuna >> "$LOG_FILE"
echo >> "$LOG_FILE"

# 5️⃣ HTTP(S) Test
echo ">>> HTTP(S) Test with curl" >> "$LOG_FILE"
for url in https://google.com https://facebook.com; do
    echo "--> Testing $url" >> "$LOG_FILE"
    curl -w "Total: %{time_total}s\n" -o /dev/null -s $url >> "$LOG_FILE" 2>&1
    curl -v $url >> "$LOG_FILE" 2>&1
    echo >> "$LOG_FILE"
done
```
---

# 6️⃣ Catatan Pribadi

- Sistem Fedora saya sudah menggunakan DNS over TLS.
- Semua koneksi HTTP(S) berhasil tanpa error.
- Bisa dilanjutkan untuk membuat monitoring harian otomatis.