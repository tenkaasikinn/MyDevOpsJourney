# Day 4 — Disk Usage & Log Management

Hari ini fokus belajar menjaga kesehatan sistem Linux:
- Mengecek disk usage (`df`, `du`)
- Memantau log systemd (`journalctl`)
- Mengatur rotasi log dengan `logrotate`
- Membuat script sederhana untuk laporan disk

Repo ini berisi catatan, script, dan contoh konfigurasi yang gua buat selama Day 4.

---

## 🧰 Tools yang Dipelajari
### 1. `df`
Dipakai untuk melihat penggunaan filesystem secara keseluruhan.

### 2. `du`
Dipakai buat cek folder paling memakan storage.

### 3. `journalctl`
Untuk memantau log systemd, misal:

`journalctl -u NetworkManager | tail -n 10`
`journalctl -xe`


### 4. `logrotate`
Buat rotasi log aplikasi supaya nggak makan storage.

---

## 📜 Disk Report Script
File: `disk-report.sh`

Script ini menghasilkan laporan:
- Disk usage root
- Top directory terbesar di `/var`
- Top directory terbesar di `$HOME`

Output akan disimpan ke `/tmp/disk_report_<waktu>.log`.

---

## 🔁 Contoh Config Logrotate
Folder: `logrotate/`

File `myapp-logrotate.conf` berisi rotasi log custom untuk file log aplikasi lokal:
- Simpan maksimal 4 file rotasi
- Kompres otomatis
- Rotasi mingguan

---

## 📘 Journalctl Sample Output
Folder: `journalctl/`

Berisi output real dari:

`journalctl -u NetworkManager | tail -n 10`


---

## 🎯 Skill yang Dicapai Hari Ini
- Paham cara menganalisa disk usage sistem
- Bisa membaca log systemd dengan aman
- Bisa membuat file konfigurasi logrotate dasar
- Bisa bikin script monitoring kecil tapi fungsional

---

## 📝 Catatan
Tujuan utama hari ini: **menjaga sistem tetap sehat & efisien**, sesuai roadmap DevOps Week 1.
