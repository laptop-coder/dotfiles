#!/bin/sh
if [ $1 == 1 ]; then
  echo "Выполнение команд до arch-chroot..."
  setfont ter-c32b
  cfdisk /dev/nvme0n1
  mkfs.fat -F 32 /dev/nvme0n1p1
  mkswap /dev/nvme0n1p2
  mkfs.ext4 /dev/nvme0n1p3
  mkfs.ext4 /dev/nvme0n1p4
  mount --mkdir /dev/nvme0n1p1 /mnt/boot/efi
  swapon /dev/nvme0n1p2
  mount /dev/nvme0n1p3 /mnt
  mount --mkdir /dev/nvme0n1p4 /mnt/home
  pacstrap -K /mnt base linux linux-firmware grub efibootmgr networkmanager amd-ucode wpa_supplicant man-db man-pages texinfo
  genfstab -U /mnt >> /mnt/etc/fstab
  cp ./set_up_arch.sh /mnt
  arch-chroot /mnt
elif [ $1 == 2 ]; then
  echo "Выполнение команд в arch-chroot..."
  ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
  hwclock --systohc
  echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
  echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
  locale-gen
  echo "LANG=ru_RU.UTF-8" > /etc/locale.conf
  echo "archlinux" > /etc/hostname
  mkdir /boot/efi
  mount /dev/nvme0n1p1 /boot/efi
  grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi --removable
  grub-mkconfig -o /boot/grub/grub.cfg
  passwd
  exit
elif [ $1 == 3 ]; then
  echo "Выполнение команд после arch-chroot..."
  umount -R /mnt
  reboot
elif [ $1 == 4 ]; then
  setfont iso05.16
  echo "Выполнение команд после перезагрузки..."
  echo "Подключение интернета..."
  systemctl start NetworkManager.service
  systemctl enable NetworkManager.service
elif [ $1 == 5 ]; then
  echo "Выполнение остальных команд..."
  pacman -Syu
  pacman -S neovim\
  modemmanager\
  npm\
  python\
  fish\
  git\
  niri\
  tree\
  pulseaudio\
  pulseaudio-alsa\
  pamixer\
  alacritty\
  swaybg\
  swayidle\
  hyprlock\
  xwayland-satellite\
  chromium\
  dunst\
  ly\
  sudo\
  gammastep\
  telegram-desktop\
  bat\
  wget\
  dbus\
  unzip\
  keepassxc\
  qt5-wayland\
  ripgrep\
  fzf\
  bluez\
  bluez-utils\
  btop\
  clang\
  pyright\
  evolution\
  obs-studio\
  binwalk\
  brightnessctl\
  gvfs-mtp\
  gvfs-gphoto2\
  gvfs-afc\
  bcachefs-tools btrfs-progs dosfstools exfatprogs f2fs-tools e2fsprogs jfsutils nilfs-utils ntfs-3g udftools xfsprogs\
  git-delta\
  zathura\
  zathura-cb\
  zathura-djvu\
  zathura-pdf-mupdf\
  zathura-ps\
  libnotify\
  libnotify-docs\
  imv\
  libreoffice-fresh\
  libreoffice-fresh-ru\
  tk\
  pavucontrol\
  docker\
  docker-compose\
  audacity\
  audacity-docs\
  kdenlive\
  base-devel\
  vim\
  gimp\
  nautilus\
  gnome-boxes\
  go\
  prettier\
  xdg-desktop-portal-gtk\
  xdg-desktop-portal-wlr\
  uv
  useradd -m -G wheel -s /usr/bin/fish arch
  passwd arch
  EDITOR=nvim visudo
  systemctl enable ly.service
  systemctl start bluetooth.service
  systemctl enable bluetooth.service
  systemctl start docker
  systemctl enable docker
  usermod -aG docker arch
  reboot
fi

