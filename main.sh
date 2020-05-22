#!/usr/bin/env sh

# A :: Variables  ##################################
BASEDIR=${PWD}
TARGET="" # check yours with fdisk -l
TARFILE="archlinux-bootstrap-2020.05.01-x86_64.tar.gz"
DLINK=" https://archlinux.cu.be/iso/2020.05.01/$TARFILE"
MIRRORLIST=$( cat <<EOF 
Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch \n
Server = https://ftp.harukasan.org/archlinux/$repo/os/$arch \n
Server = https://ftp.lanet.kr/pub/archlinux/$repo/os/$arch \n
Server = https://pkg.adfinis-sygroup.ch/archlinux/$repo/os/$arch \n
Server = https://mirror.init7.net/archlinux/$repo/os/$arch \n
Server = https://mirror.puzzle.ch/archlinux/$repo/os/$arch \n
Server = https://mirror.ungleich.ch/mirror/packages/archlinux/$repo/os/$arch \n
Server = https://mirror.oldsql.cc/archlinux/$repo/os/$arch \n
Server = https://mirror.one.com/archlinux/$repo/os/$arch \n
Server = https://mirrors.dotsrc.org/archlinux/$repo/os/$arch \n
EOF
) # THIS DONT WORK, MANUALLY EDIT ./root.x86_64/etc/pacman.d/mirrorlist;

# B :: Function #####################################################
FormatTarget (){
  mkfs.ext4 -L ArchLinux $TARGET
}
PrepareEnv (){
  cd /tmp; curl -LO $DLINK >/dev/null 2>&1;
  tar xzf $TARFILE >/dev/null 2>&1;
  # mv ./root.x86_64/etc/pacman.d/mirrorlist ./root.x86_64/etc/pacman.d/mirrorlist.bak;
  # echo $MIRRORLIST > ./root.x86_64/etc/pacman.d/mirrorlist; # THIS IS BROKEN
  swapoff --all;
}
CopyOver () {
  cp $BASEDIR/archiso.sh /tmp/root.x86_64/; cp $BASEDIR/archsetup.sh /tmp/root.x86_64/
}

# C :: Init #########################################################
main () {
  if [ "$(whoami)" != "root" ]
    then
    sudo su -s "$0"
    exit
  fi
  FormatTarget   # 1 :: Format Target Partition
  PrepareEnv     # 2 :: Prep for Arch installation
  CopyOver       # 3 :: Copy the script file over
  /tmp/root.x86_64/bin/arch-chroot /tmp/root.x86_64/
}

main $1
