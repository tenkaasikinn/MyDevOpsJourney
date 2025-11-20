# Week 1 CLI Cheatsheet (Day 6)

## Day 1: AWK & Basic CLI
- `awk '{print $1}' file.txt`  
  Ambil kolom pertama dari file teks.  
- `awk '{print $1, $3}' file.txt`  
  Ambil kolom pertama & ketiga.  
- `grep 'pattern' file.txt`  
  Cari baris yang cocok dengan 'pattern'.  
- `cut -d',' -f1 file.csv`  
  Ambil field pertama dari CSV (delimiter koma).  
- `cat file.txt | less`  
  Scroll file panjang dengan nyaman.  

---

## Day 2: Logging & User Scripts
- `./daily_log.sh`  
  Script logging harian (sesuaikan path & output).  
- `tail -f /var/log/syslog`  
  Monitoring log realtime.  
- `cat file.log | less`  
  Membaca log panjang.  
- `./user_report.sh`  
  Script generate laporan user (sesuaikan nama & path).  

---

## Day 3: Backup & Automation
- `./backup.sh`  
  Backup folder /home.  
- `./backup-ssd.sh`  
  Backup khusus SSD.  
- `rsync -av source/ dest/`  
  Sinkronisasi folder.  
- `cron` / `crontab -e`  
  Schedule otomatisasi backup & task lain.  
- `./auto-update.sh`  
  Automasi update paket (misal dnf/apt).  

---

## Day 4: Disk & Log Management
- `df -h`  
  Cek sisa storage.  
- `du -sh /path`  
  Cek ukuran folder tertentu.  
- `journalctl -xe`  
  Baca log systemd dengan detail.  
- `journalctl -u NetworkManager`  
  Cek log service NetworkManager.  
- `logrotate /etc/logrotate.conf`  
  Rotasi log otomatis sesuai konfigurasi.  
- `du -h --max-depth=1 /home`  
  Lihat penggunaan disk di tiap subfolder /home.  

---

## Day 5: Networking
- `ping google.com`  
  Cek koneksi ke host.  
- `ss -tulnp`  
  Lihat listening ports & proses terkait.  
- `curl -I https://example.com`  
  Cek HTTP header.  
- `nmcli device status`  
  Lihat status interface network.  
- `ip addr show`  
  Lihat IP & konfigurasi network.  
- `dig example.com`  
  DNS lookup.  

---