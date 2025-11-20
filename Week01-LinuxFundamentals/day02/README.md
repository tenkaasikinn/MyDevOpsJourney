# 🧠 Day 2 - Bash Scripting Basics 

Hari kedua belajar DevOps bareng AI — fokus ke **Bash scripting**:
- Dasar-dasar `echo`, variabel, dan `$(command)`
- Menulis output ke file `.log`
- Membuat log harian yang tidak menimpa file lama
- Menambahkan log rotation otomatis (hapus log >7 hari)

## 📂 Script Utama
| File | Deskripsi |
|------|------------|
| `user_report.sh` | Menampilkan laporan sistem sederhana |
| `daily_log.sh` | Mencatat log harian |
| `daily_log2.sh` | Versi dengan rotasi log otomatis |

## 🧩 Contoh Output
```bash
$ bash daily_log2.sh
============================
Tanggal   : Wed Nov 12 14:45:00 WIB 2025
Hostname  : Fedora
User      : tenka
============================

Log ditambahkan ke: /home/tenka/reports/filelog_2025-11-12.log
Log lama (>7 hari) otomatis dihapus.
