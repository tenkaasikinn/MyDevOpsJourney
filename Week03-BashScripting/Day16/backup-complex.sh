#!/bin/bash

# ================= CONFIG =================
LOG_DIR="$HOME/backup-logs"
TIMESTAMP=$(date '+%Y-%m-%d_%H-%M-%S')
LOG_FILE="$LOG_DIR/backup-$TIMESTAMP.log"

RSYNC_OPTS="-avh --delete"
DRY_RUN=false
# =========================================

# ============== LOGGING ==================
log() {
    local level="$1"
    local msg="$2"

    printf "[%s] [%s] %s\n" \
        "$(date '+%Y-%m-%d %H:%M:%S')" \
        "$level" \
        "$msg" | tee -a "$LOG_FILE"
}
# =========================================

usage() {
    echo "Usage:"
    echo "  $0 [--dry-run] <SOURCE_DIR> <DEST_DIR>"
    exit 1
}

# ========== ARGUMENT PARSING ==============
if [[ "$1" == "--dry-run" ]]; then
    DRY_RUN=true
    shift
fi

SOURCE="$1"
DEST="$2"

[[ -z "$SOURCE" || -z "$DEST" ]] && usage
# =========================================

# ============== VALIDATION ================
validate() {
    mkdir -p "$LOG_DIR"

    [[ ! -d "$SOURCE" ]] && {
        log "ERROR" "Source tidak ditemukan: $SOURCE"
        exit 1
    }

    [[ ! -d "$DEST" ]] && {
        log "ERROR" "Destination tidak ditemukan: $DEST"
        exit 1
    }

    [[ ! -w "$DEST" ]] && {
        log "ERROR" "Destination tidak writable: $DEST"
        exit 1
    }

    log "INFO" "Validasi sukses"
}
# =========================================

# ============== BACKUP ====================
run_backup() {
    local opts="$RSYNC_OPTS"

    $DRY_RUN && {
        opts="$opts --dry-run"
        log "INFO" "Mode DRY-RUN aktif"
    }

    log "INFO" "Backup dimulai"
    log "INFO" "Source: $SOURCE"
    log "INFO" "Dest  : $DEST"

    rsync $opts "$SOURCE/" "$DEST/" >> "$LOG_FILE" 2>&1
    status=$?

    if [[ $status -ne 0 ]]; then
        log "ERROR" "Backup gagal (exit code $status)"
        exit 2
    fi

    log "INFO" "Backup selesai dengan sukses"
}
# =========================================

# ================ MAIN ====================
validate
run_backup
exit 0

