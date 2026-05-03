# source ~/.config/bashrc

export PS1="\[\e[0;32m\][\w]$\[\e[0m\] "

# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

shopt -s histappend
shopt -s extglob
shopt -s globstar
shopt -s checkjobs

alias todo="nvim ~/md/mainichi.md"
alias ltodo="nvim ~/md/linux.md"
alias md="yazi ~/md/"

alias mntall="sudo mount -t ntfs -o ro /dev/disk/by-label/M2_WINDOWS /mnt/m2-windows/ ; \
sudo mount -t ntfs -o ro /dev/disk/by-label/M2 /mnt/m2/ ; \
sudo mount -t ntfs -o ro /dev/disk/by-label/SUS /mnt/sus/ ; \
sudo mount -t ext4 -o ro /dev/disk/by-label/nixosROOT /mnt/nixos-old/
"
alias nxec="here=$(pwd) ; \
cd ~/.config/nixos-config/ ; \
nvim ~/.config/nixos-config/ ; \
cd $here
"
alias nxrb="~/.config/nixos-config/update-configuration.sh && \
sudo nixos-rebuild boot && \
~/.config/nixos-config/backup-configuration.sh
"
alias nxrs="~/.config/nixos-config/update-configuration.sh && \
sudo nixos-rebuild switch && \
~/.config/nixos-config/backup-configuration.sh
"
alias nxrt="~/.config/nixos-config/update-configuration.sh && \
sudo nixos-rebuild test
"
alias unmntall="sudo umount /mnt/m2-windows/ ; \
sudo umount /mnt/m2/ ; \
sudo umount /mnt/sus/ ; \
sudo umount /mnt/nixos-old/
"
alias zed=zeditor
