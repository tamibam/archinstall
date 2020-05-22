## Arch Install Script

### Description

This is a script to install Arch Linux within another Linux distribution. It
requires to have an empty partition.

The script is separated into three stages:

- `<main.sh>` which take care of downloading arch bootstrap tar file, and
  chroot into it.

- `<archiso.sh>` which take care of mounting, installing base packages, and
  chroot into the partition.

- `<archsetup.sh>` which take care of the rest of installation process.

CAUTION: DO NOT USE THIS SCRIPT UNLESS U CAN DEBUG AND FIND WORK AROUND IF
SHIT HAPPEN. THIS SCRIPT IS TESTED ONCE SO FAR, AND UNLESS FURTHER TESTS ARE
DONE, THIS CAUTION WILL BE HERE.

## Usage Instruction

1. Clone this repo

```
git clone https://github.com/tamibam/archinstall.git /tmp/archinstall && cd /tmp/archinstall

```

2. Review & Fill in

There are important variables to be filled in order to make this work, such as
the path of partition. Please review with the script your text editor, fill in
empty variables and customize as needed.

3. Run main.sh

Once you are done editing the script, run /tmp/archinstall/main.sh
```
sh /tmp/archinstall/main.sh
```
4. Run archiso.sh

When the first script is done, it will charoot into archlinux bootstrap, here run /archiso.sh
```
sh /archiso.sh
```

5. Run archsetup.sh

When the first script is done, it will charoot into archlinux installation,
source /archsetup.sh and run the script in two parts, first to setup host
env and key packages from the official repo, and second to setup user env.
After the first one is done, it will change from root to $USERNAME. After that
run source /archsetup.sh and run main2

```
source /archsetup.sh; main1
su $USERNAME; source /archsetup.sh; main2
```

6. reboot

## Contribution

The script has many shortcoming, I would advice that you review it and change
it if you are familiar with bash script, with that being said, if you find room
for improvement please fork the repo add changes to make it better and create
pull request.

## Issues
- Workaround to add custom archlinux mirrolist don't work, manual intervention is needed.
- In `<archsetup.sh>` yay installation requires password everytime.
- Multiple code are duplicated unnecessarily.
