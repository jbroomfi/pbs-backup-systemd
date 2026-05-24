# Backing up linux hosts to PBS

This is a small & simple project to create a systemd unit capable of backing up a linux host to a Proxmox Backup Server host.

It uses an API Token for authentication so you'll need to create the API token in PBS and set the required permissions to allow the backup client to create a backup and restore it or a subset of files within a backup if necessary.

```bash
.
├── files
│   ├── pbs-backup.env.example
│   ├── pbs-backup.service
│   └── pbs-backup.timer
├── install.sh
├── README.md
└── uninstall.sh

2 directories, 6 files
```

## Steps to install/uninstall the systemd unit

### Create a pbs-backup.env file

Copy the file ./files/pbs-backup.env.example file to ./files/pbs-backup.env

Amend the environment variable values to match the API token and secret for your local PBS account.

### Install the systemd unit

In a bash prompt with an account that has root privileges, execute the `install.sh` file;

```bash
# ./install.sh
Copying systemd unit files...
Setting permissions...
Registering new systemd service unit and enabling it...
Created symlink '/etc/systemd/system/timers.target/wants/pbs-backup.timer' -> '/etc/systemd/system/pbs-backup.timer'.

Done

#
```

### Uninstall the systemd unit

In a bash prompt with an account that has root privileges, execute the `uninstall.sh` file;

```bash
# ./uninstall.sh
Stopping and disabling the systemd unit
Removed '/etc/systemd/system/timers.target.wants/bbs-backup.timer'
Removing systemd unit files...
Reloading systemd...

Done

#
```
