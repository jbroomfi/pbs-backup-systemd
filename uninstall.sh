#!/bin/bash

SYSTEMD=/etc/systemd/system

echo "Stopping and disabling the systemd unit..."
systemctl disable --now pbs-backup.timer

echo "Removing systemd unit files..."
rm /etc/pbs-backup.env
rm -f $SYSTEMD/pbs-backup.timer
rm -f $SYSTEMD/pbs-backup.service

echo "Reloading systemd..."
systemctl daemon-reload

echo ""
echo "Done"
echo ""
