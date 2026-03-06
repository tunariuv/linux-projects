#!/bin/bash
BKP="/backup/daily"
RECENT=$(find "$BKP" -type f -name "*.tar.gz" -mtime -1 | wc -l)

if [ "$RECENT" -eq 0 ]; then
    echo "ATENTIE: Niciun backup recent in ultimele 24h!"
    exit 1
else
    echo "OK: $RECENT backup-uri gasite."
    ls -lht "$BKP" | head -4
fi
