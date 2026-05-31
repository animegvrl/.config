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

alias zed="zeditor"
alias lg="lazygit"

alias ssha="ssh-add -t 15m ~/.ssh/id_ed25519_animegirl"
alias pog="git push origin masutaa && git push github masutaa"

alias todo="nvim ~/md/mainichi.md"
alias ltodo="nvim ~/md/linux.md"
alias md="yazi ~/md/"

alias mntall="
    sudo mount -t ntfs -o ro /dev/disk/by-label/M2_WINDOWS /mnt/m2-windows/ ; \
    sudo mount -t ntfs -o ro /dev/disk/by-label/M2 /mnt/m2/ ; \
    sudo mount -t ntfs -o ro /dev/disk/by-label/SUS /mnt/sus/ ; \
    sudo mount -t ext4 -o ro /dev/disk/by-label/nixosROOT /mnt/nixos-old/
"
alias unmntall="
    sudo umount /mnt/m2-windows/ ; \
    sudo umount /mnt/m2/ ; \
    sudo umount /mnt/sus/ ; \
    sudo umount /mnt/nixos-old/
"

### NIXOS ###
alias nxec="yazi ~/.config/nixos-config/"

alias nxrt="
    ~/.config/nixos-config/update-configuration.sh && \
    sudo nixos-rebuild test
"
alias nxrs="
    ~/.config/nixos-config/update-configuration.sh && \
    sudo nixos-rebuild switch && \
    ~/.config/nixos-config/backup-configuration.sh
"
alias nxrb="
    ~/.config/nixos-config/update-configuration.sh && \
    sudo nixos-rebuild boot && \
    ~/.config/nixos-config/backup-configuration.sh
"

nix_develop_fix() {
    looking_at="$(pwd)"

    while :; do
        if [ -f "$looking_at/flake.nix" ]; then
            nix develop $looking_at
        fi

        [ "$looking_at" = "/" ] && break
        looking_at=$(dirname -- "$looking_at")
    done
}
alias nxd="nix_develop_fix"
