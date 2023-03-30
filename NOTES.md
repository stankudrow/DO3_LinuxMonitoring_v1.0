# Linux Monitoring v1.0

Development notes.

## First steps

* [How to Install Ubuntu Server on VirtualBox](https://hibbard.eu/install-ubuntu-virtual-box/) - you may need to install openSSH or do it later with `sudo apt install openssh-server` to exchange files via the SSH protocol. Make sure you enabled [Port forwarding](https://nsrc.org/workshops/2014/sanog23-virtualization/raw-attachment/wiki/Agenda/ex-virtualbox-portforward-ssh.htm) on the local machine and [configured](https://help.ubuntu.com/community/SSH/OpenSSH/Configuring) the SSH-Server on the guest machine.

* [Creating a Shared Folder in VirtualBox](https://carleton.ca/scs/tech-support/troubleshooting-guides/creating-a-shared-folder-in-virtualbox/) - if you need to share data between the local host and a guest machine. Then, on the guest machine:

  * run `sudo apt update` and `sudo apt upgrade` commands if necessary;

  * `sudo apt install virtualbox-guest-utils`;

  * `sudo usermod -aG vboxsf $USER` or `sudo adduser $USER vboxsf` - up to you;

  * `reboot`;

  * by default, a shared directory should appear at `/media/sf_<your_shared_dir_name>`.

## Configuring

* [How To Set or Change Timezone on Ubuntu 2x.yz](https://linuxhint.com/set-change-timezone-ubuntu-22-04/) and what to do if [timedatectl: command not found](https://www.thegeekdiary.com/timedatectl-command-not-found/).

* In the second task, you may have `ip` utility installed to get the information on network devices, interfaces and so forth. If you need to try utilities such as `ifconfig`, you may need to run `sudo apt install net-tools`.
