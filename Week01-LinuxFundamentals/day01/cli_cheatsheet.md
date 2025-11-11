# 🧠 CLI Cheat Sheet — Day 1 (Linux Fundamentals)

> Fokus: Navigasi, File Tools, Text Processing, dan Alias

---

## 🗺️ Step 1 — Navigasi Dasar

| Command | Deskripsi | Contoh / Catatan |
|----------|------------|------------------|
| `pwd` | Menampilkan direktori saat ini | — |
| `cd /path/directory` | Pindah ke direktori tertentu | `cd /etc` |
| `ls -lah` | Menampilkan isi direktori lengkap dengan detail | `ls -lah /home` |
| `cat file` | Menampilkan isi file | `cat /etc/passwd` |
| **Konsep** | Absolute vs Relative Path | `/etc/passwd` vs `../folder/file.txt` |

---

## 🔍 Step 2 — Pencarian (find, grep, awk)

| Command | Deskripsi | Contoh / Catatan |
|----------|------------|------------------|
| `find` | Cari file berdasarkan nama, tipe, dll | `find ~ -type f -name "*.sh"` |
| `grep` | Cari teks dalam file | `grep -i "error" /var/log/syslog` → gunakan `journalctl` di Fedora |
| `awk` | Manipulasi dan cetak kolom | `awk -F: '{print $1, $2}' /etc/passwd` |

📝 **Fedora Note:**  
Gunakan:
```bash
sudo journalctl -p err -b
```
---

## ✂️ Manipulasi Teks

| Command | Deskripsi | Contoh / Catatan |
|----------|------------|------------------|
| `sed` | Mencari teks dan meggantinya | `sed 's/root/admin/g' /etc/passwd` |
| `cut` | Mengambil bagian tertentu | `cut -d: -f1 /etc/passwd` |

---

## 🧩 Step 4 — Sortir & Unik

| Command | Deskripsi              | Contoh                                  |
| ------- | ---------------------- | --------------------------------------- |
| `sort`  | Mengurutkan output     | `sort file.txt`                         |
| `uniq`  | Menampilkan baris unik | `uniq file.txt`                         |

