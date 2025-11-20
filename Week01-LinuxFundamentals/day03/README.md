# 📦 Day 3 - Backup Automation with Rsync & Cron

## 🎯 Goals
- Automate backup using `rsync`
- Create logging system for backup jobs
- Schedule automation with `cron`
- Optional: configure `sudo` privilege for cron tasks

## 🧰 Scripts
| Script | Description |
|--------|--------------|
| `backup.sh` | Basic local backup script |
| `backup-ssd.sh` | Backup to external SSD |
| `auto-update.sh` | Automatic Fedora + Flatpak system updates via cron |

## ⏰ Cron Example
```bash
0 20 * * * /home/tenka/scripts/backup-documents.sh
0 10 * * 6 /home/tenka/scripts/auto-update.sh
