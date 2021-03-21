The purpose of this guide is to provide instructions for installing macOS Big Sur (or older versions) on the Lenovo Legion Y530 laptop (Rescuer Y7000 (2018) will work as well, chinese varient of Y530)


## Computer Specification

#### Lenovo Legion Y530

- Intel® Core™ i7-8750H (Coffee-Lake)
- 16GB RAM DDR4 2667MHz
- Intel® UHD Graphics 630
- Nvidia GTX 1050Ti 4GB (disabled on macOS)
- 2TB HP EX950 PCI-E Gen3 x4 NVMe SSD
- Realtek ALC236 Audio Controller
- RTL8168H Gigabit Ethernet
- Dell Wireless DW-1830 Wi-Fi + BT 4.1 LE (BCM943602BAED + BCM20703A1)
- Synaptics Precission Trackpad -> ELAN061B (check Issues) 
- BIOS : 8JCN56WW 11/30/2020

## Issues
- ELAN061B have strange behavior with Buttons, Left Button works as Right Button and Right Button does not work (for the most part). SYNA2B46 works perfectly now (Disable -> "Force Click and haptic feedback")
- Nvidia GTX 1050Ti (No Optimus Support under macOS)

## BIOS
#### How to Access Advanced Menu
`Press FN + D + O and Then Reboot Laptop, Screen with Blue Box will be shown, Now press F2 to access BIOS Advanced Menu`

### Required BIOS Configration

- Boot Mode: UEFI
- Storage Mode: AHCI
- Secure Boot : Disabled
- Kernel Debug Serial Port : Legacy UART \
 `Advanced -> Debug settings -> Legacy UART`
- Force unlock on all GPIO pads : Enabled `without this Trackpad won't work` \
`Advanced -> PCH-IO Configuration -> Security Configuration -> BIOS Lock`
- CFG Lock (MSR_E2) : Disabled \
`Advanced -> Power & Performance -> CPU - Power Management -> View/Configure CPU Lock Options -> CFG Lock`
- DVMT Pre-Allocated Memory : 64MB \
`Advanced -> System Agent (SA) Configuration -> Graphics Configuration -> DVMT Pre-Allocated Memory`

## USB Creation

- Follow [Creating the USB | Dortania](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/) to prepare Bootable USB Installer

- Copy EFI folder to Prepared USB Flash Drive

```
Note : Avoid logging into iCloud after Installation, Might risk getting apple account black-listed, Follow Fixing iServices and then you can safely Login.
```
## Post-Installation
- Run following command in terminal to Fix Headphone Audio
```
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/chilledHamza/Hackintosh_Legion_Y7000_2018/main/AudioFix.sh)"
```

## Fixing iServices
- Follow [Fixing iMessage and other iServices | Dortania](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html)

## Credit
- [Acidanthera](https://github.com/acidanthera)
- [Alexandred](https://github.com/alexandred), [kprinssu](https://github.com/kprinssu), [ben9923](https://github.com/ben9923), [usr-sse2](https://github.com/usr-sse2) and others for [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C)
- [Mieze](https://github.com/Mieze)
- [RehabMan](https://github.com/RehabMan)
- [xiaoM](https://github.com/xiaoMGitHub)
