#!/usr/bin/env sh

# A :: Variables ####################################################
HOSTNAME=""    # Your hostname
ROOTPASS=""        # Your tmp password
USERNAME=""      # Your username
USERPASS=""        # Your tmp password
CONFREPO=""       # Your Config files
NVIMCONF=""           # Your Config files
ZSHCONF=""             # Your tmp password
WALLPAPER=""    # Your wallpaper dir
AREA=""     # Your Location for setting time
CITY=""   # Your Location for setting time
TARGET="" # check yours with fdisk -l
BOOT=""   # check yours with fdisk -l
SWAP=""   # check yours with fdisk -l
HARDWARE=(
  xf86-input-synaptics        # For input devices
  xf86-input-libinput         # For input devices
  xf86-input-evdev            # For input devices
  mesa                        # For all GPUs
  vulkan-icd-loader           # For all GPUs
  vulkan-intel                # For intel GPUs
  xf86-video-intel            # For intel GPUs
  networkmanager              # For Networking
  networkmanager-openvpn      # For Networking
  networkmanager-pptp         # For Networking
  networkmanager-vpnc         # For Networking
  wireless_tools              # For Wifi
  wpa_supplicant              # For Wifi
  ifplugd                     # For Wifi
  dialog                      # For wifi
  pulseaudio-alsa             # For audio
  pulseaudio-equalizer        # For audio
  pulsemixer                  # For audio
  alsa-firmware               # For audio
  alsa-lib                    # For audio
  alsa-oss                    # For audio
  alsa-typology-conf          # For audio
  zite-alsa-pcmi              # For audio
  alsa-ucm-conf               # For audio
  alsa-lib                    # For audio
  bluetoothctl                # For bluetooth
  dosfstools                  # For doslike filesystms
  exfat-utils.                # For FAT drives
  ntfs-3g                     # For NTFS partitions
)
UTILS=(
  arandr                  # For UI screen adjustment
  libnotify               # For desktop notifications
  man-db                  # For man pages
  xdg-utils               # Filetype utilities
  socat                   # Socket utility
  mpd                     # Daemon for music player
  unrar                   # For extracting rar
  tar                     # For extracting tar
  unzip                   # For extracting zips
  unace                   # For extracting ace
  rsync                   # For copying/moving large files
  poppler                 # For Pdf manipulates
  mediainfo               # For showing audio and video info
  atool                   # For managing and showinng archives info
  fzf                     # For fuzzy finding
  ctags                   # For Generating ctags
  the_silver_searcher     # For searching textfiles
  ripgrep                 # For search textfiles
  slock                   # For screen lock
  highlight               # For highlight code output
  git                     # For cloning git repos
  wget                    # For downloding stuff
  curl                    # For downloading stuff
  avahi                   # For instant integration with network devices
  trash-cli               # For safer rm
  surfraw                 # For web searching from cmdl
  nodejs                  # For web dev
  yarn                    # For web dev
  conky                   # For System information monitoring
)
XPKGS=(
  xorg-server xorg-xinit
  xorg-apps               # For all xorg apps, TODO: delete
  xorg-server-xephyr      # For testing wms
  unclutter               # For hiding an inactive mouse
  xcape                   # For Keyboard mapping
  xclip                   # For Clipboard integration
  xdotool                 # For window action utilities on cmdl
  lxappearance            # For setting gtk themes
  xwallpaper              # Sets the wallpaper
)
TUIAPPS=(
  neovim                # Text editor
  zsh                   # Shell
  calcurse              # Calendar
  gnome-keyring.        # system keyring
  mpc                   # music player TUI interface
  ncmpcpp               # music player ncurses interface
  newsboat              # RSS client
  dunst                 # Notification system
  pamixer               # Audio Controler
  tmux                  # Terminal multiplexer
  lynx                  # Web Browser
  youtube-dl            # YouTube Downloader
  zathura               # Pdf viewer
  zathura-pdf-mupdf     # mupdf pdf compatibility
  transmission-cli      # TUI Torrent Client
)
GUIAPPS=(
  i3-gaps                 # WM
  i3blocks                # Status bar
  mpv                     # Video player
  sxiv                    # Image Viewer
  maim                    # Screenshots
  kitty                   # GPU-based terminal
  firefox                 # Web browser
)
EXTRAGUI=(
  straw-viewer-git        # Youtube browsing
  conky-manager           # For conky managment
)
EXTRATUI=(
  tremc-git             # Curses interface for transmission
)
EXTRAUTILS=(
  ripgrep-all             # For searching inside pdfs & images
  libxft-bgra             # in case st breaks
  ufetch-git              # For System information
  pfetch-git              # For System information
  task-spooler            # For queuing commands or download.
  ts                      # For queuing commands or download.
  python-iwlib            # For interacting with wireless devices
  xmodmap                 # keyboard binding
  dargon-drag-and-drop    # For draging and droping form/to ui
  ffmpeg-git              # For media manipulates/covertion
  python-pdftotext        # For Pdf extration
  svox-pico-bin           # For reading pdf text
  imgp                    # For image resizing
  mkpdf                   # For generating pdf
)
EXTENTIONS=(
  zsh-fast-syntax-highlighting  # For zsh setup
  zsh-autosuggestions           # For zsh setup
  zsh-history-substring-search  # For zsh setup
  exa                           # For zsh setup
  python-ueberzug-git           # For ranger image previews
  python-pynvim                 # For nvim setup
  python-pyaml                  # For nvim setup
)
FONTSPKGS=(
  xorg-fonts ttf-linux-libertine noto-fonts-emoji 
  adobe-source-sans-pro-fonts ttf-dejavu ttf-opensans 
  font-mathematica noto-fonts freetype2 terminus-font 
  ttf-bitstream-vera ttf-dejavu ttf-droid ttf-fira-mono 
  ttf-fira-sans ttf-freefont ttf-inconsolata ttf-liberation 
  ttf-linux-libertine otf-san-francisco-pro otf-san-francisco-mono nerd-fonts-complete
)
THEMEPKGS=(
  mojave-gtk-theme-git mcmojave-circle-icon-theme-git 
  mcmojave-cursors
)

# B :: Functions ####################################################
InstallHardware() {
  for package in ${HARDWARE[@]}; do
      sudo pacman --noconfirm --needed -S $package
  done
}
InstallUtils() {
  for package in ${UTILS[@]}; do
      sudo pacman --noconfirm --needed -S $package
  done
}
InstallX() {
  for package in ${XPKGS[@]}; do
      sudo pacman --noconfirm --needed -S $package
  done
}
InstallTUIapps() {
  for package in ${TUIAPPS[@]}; do
      sudo pacman --noconfirm --needed -S $package
  done
}
InstallGUIapps() {
  for package in ${GUIAPPS[@]}; do
      sudo pacman --noconfirm --needed -S $package
  done
}
InstallYAY () {
  sudo pacman -Syu
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -rsi
  cd .. && rm -rf yay
}
InstallExGUI() {
  for package in ${EXTRAGUI[@]}; do
      yay --noconfirm -S $package 
  done
}
InstallExTUI() {
  for package in ${EXTRATUI[@]}; do
      yay --noconfirm -S $package 
  done
}
InstallExUtils() {
  for package in ${EXTRAUTILS[@]}; do
      yay --noconfirm -S $package 
  done
}
InstallExEx() {
  for package in ${EXTENTIONS[@]}; do
      yay --noconfirm -S $package 
  done
}
InstallExFont() {
  for package in ${FONTSPKGS[@]}; do
      yay --noconfirm -S $package 
  done
}
InstallExTheme() {
  for package in ${THEMEPKGS[@]}; do
      yay --noconfirm -S $package 
  done
}
SetHost () {
  ln -sf /usr/share/zoneinfo/$AREA/$CITY /etc/localtime
  hwclock --systohc
  echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
  echo "ar_SA.UTF-8 UTF-8" >> /etc/locale.gen
  locale-gen
  echo "LANG=en_US.UTF-8" > /etc/locale.conf
  echo $HOSTNAME > /etc/hostname
  echo "127.0.0.1       localhost" > /etc/hosts
  echo "::1             localhost" >> /etc/hosts
  echo "127.0.1.1       alphabeta.localdomain   alphabeta" >> /etc/hosts
  passwd
}
SetBootloader () {
  pacman -S refind-efi
  refind-install --usedefault $BOOT --alldrivers
}
SetUser() {
    useradd -m -g wheel -s /bin/zsh "$USERNAME"
    echo "$USERNAME:$USERPASS" | chpasswd
    echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
    usermod -a -G wheel "$name"
    su $USERNAME
}
SetConfig() {
  git clone $CONFREPO /home/$USERNAME/Dotfiles
  sh /home/$USERNAME/Dotfiles/bin/linkdot
  git clone $WALLPAPERS /home/$USERNAME/Pictures/Wallpapers
}
# C :: Init #########################################################

main1 () {
  pacman -S reflector && reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
  SetHost
  InstallHardware
  InstallX
  InstallUtils
  InstallTUIapps
  InstallGUIapps
  SetBootloader
  SetUser
}
main2 () {
  InstallYAY
  InstallExGUI
  InstallExTUI
  InstallExUtils
  InstallExEx
  SetConfig
  InstallExTheme
  InstallExFont
}

# InstallMain() {
#   for package in ${1[@]}; do
#       sudo pacman --noconfirm --needed -S $package
#   done
# }
# InstallYAY () {
#   git clone https://aur.archlinux.org/yay.git
#   cd yay
#   makepkg -rsi
#   cd .. && rm -rf yay
# }
# InstallExtra() {
#   for package in ${1[@]}; do
#       yay --noconfirm -S $package 
#   done
# }
# SetEnv() {
#   InstallMain $HARDWARE
#   InstallMain $UTILS
#   InstallMain $XPKGS
#   InstallMain $GUIAPPS
# }
# SetUserEnv() {
#   InstallYAY
#   InstallExtra $EXTRAGUI
#   InstallExtra $EXTRATUI
#   SetConfig
#   InstallExtra $THEMEPKGS
#   InstallExtra $FONTSPKGS
# }
#
#
# main1 () {
#   SetHost
#   SetBootloader
#   SetEnv
#   SetUser
# }
# main2 () {
#   SetUserEnv
# }
#
