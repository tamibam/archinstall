#!/usr/bin/env sh

# A :: Variables ####################################################
TARGET=""  # check yours with fdisk -l
BOOT=""    # check yours with fdisk -l
SWAP=""    # check yours with fdisk -l
BASEPKGS=(
  base base-devel linux-lts linux-firmware
  usbutils e2fsprogs inetutils netctl
)

# B :: Functions ####################################################
PrepareInstall () {
  pacman-key --init; pacman-key --populate archlinux
  mount $TARGET /mnt;
  mkdir /mnt/efi; mount $BOOT /mnt/efi
  swapon $SWAP
}
InstallBase () {
  for package in ${BASEPKGS[@]}; do
      pacstrap /mnt $package
  done
}

# C :: Init #########################################################

main () {
  PrepareInstall
  InstallBase
  cp /archsetup.sh /mnt/
  genfstab -U /mnt >> /mnt/etc/fstab && arch-chroot /mnt && arch-chroot /mnt
}

main $1
