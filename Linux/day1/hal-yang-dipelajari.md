Membuat 3 file menggunakan echo file1 file2 file3
ls  -l  buat mengetahui permission file atau directory
r = read w = write x = execute
- = file d = directory l = symlink
tree buat melihat akar setiap session
bin di systemd itu terhubung ke usr/bin
sbin juga sama
/etc ini buat konfigurasi seperti date time abrt dll
/var ini adalah tempat yang sering berubah seperti journalctl dan flatpak
cara untuk mengecek journal boot adalah journalctl -b
cara untuk mengecek journal kernel adalah journalctl -k
dan cara mengecek error bisa menggunakan journalctl -p err -b
cara cek baterai adalah upower -i $(upower -e | grep BAT)
untuk mengecek status menggunakan stat contoh stat /etc/adjtime
untuk beberapa command baru seperti wc artinya word count
wc -l = jumlah baris
wc -w = jumlah kata
wc -c = jumlah character
du = disk usage
