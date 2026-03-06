#!/bin/bash
BACKUP_ROOT="/backup"
DATE=$(date +%Y-%m-%d_%H%M)
LOG="$BACKUP_ROOT/logs/backup_$DATE.log"
MAX=7

mkdir -p "$BACKUP_ROOT/daily" "$BACKUP_ROOT/logs"

log() {
    echo "[$(date)] $1" | tee -a "$LOG"
}

check_space () {
    local avail=$(df -BG "$BACKUP_ROOT" | awk 'NR==2{print $4}' | sed 's/G//')
    if [ "$avail" -lt 5 ]; then
        log "EROARE: Spatiu insuficient!"
        exit 1
    fi
}

log "===== START BACKUP ====="
check_space

tar -czf "$BACKUP_ROOT/daily/etc_backup_$DATE.tar.gz" /etc/ 2>>"$LOG"
if [ $? -eq 0 ]; then
    log "Backup /etc OK"
else
    log "Backup /etc FAIL"
fi

find "$BACKUP_ROOT/daily" -type f -name "*.tar.gz" -mtime +$MAX -delete
log "Cleanup arhive mai vechi de $MAX zile finalizat."
log "===== END ====="
