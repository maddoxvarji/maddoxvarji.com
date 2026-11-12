#!/bin/bash
echo "## helper"
if [[ "$1" = "backup" && "$2" = "purge" ]]; then
    echo "## BACKUP PURGE"
    while [[ "$confirm" != "y" && "$confirm" != "n" ]]; do
        read -p "This will permanently delete ALL backups in /home/maddox/backups/maddoxvarji.com/... continue? (y/n) " confirm
    done

    if [ "$confirm" = "y" ]; then
        echo "## Purging backups..."
        sudo rm -rf /home/maddox/backups/maddoxvarji.com/*
        echo "## Done."
    else
        echo "## Purge cancelled."
    fi
elif [ "$1" = "backup" ]; then
    echo "## BACKUP"
    BACKUP_DIR="/home/maddox/backups/maddoxvarji.com/backup_$(date +%Y%m%d_%H%M%S)"
    echo "## backup directory : $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    echo "## created : $BACKUP_DIR"
    sudo cp -r * "$BACKUP_DIR"
    echo "## copied all to : $BACKUP_DIR"
elif [ "$1" = "push" ]; then
    git add .
    git commit -m "$(shuf -n 1 commits.txt)"
    git push origin main
else
    echo an error occured... none passed or typo in argument.
fi