#!/bin/bash

SYSTEMD=/etc/systemd/system

echo "Copying systemd unit files..."
cp ./files/pbs-backup.timer $SYSTEMD
cp ./files/pbs-backup.service $SYSTEMD
cp ./files/pbs-backup.env /etc

echo "Setting permissions..."
chmod 600 /etc/pbs-backup.env

echo "Registering new systemd service unit and enabling it..."
systemctl daemon-reload
systemctl enable --now pbs-backup.timer

echo ""
echo "Done"
echo ""
