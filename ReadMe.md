The purpose of this guide is to provide instructions for installing macOS Monterey or macOS Big Sur on the Lenovo Legion Y530 laptop (Rescuer Y7000 (2018) will work as well, Chinese variant of Y530). macOS Catalina or older will need few changes to config.plist. Check [Acidanthera Updates: August 2021](https://dortania.github.io/hackintosh/updates/2021/08/02/acidanthera-august.html) for details. 


## Computer Specification

#### Lenovo Legion Y530-15ICH

- Intel® Core™ i7-8750H (Coffee-Lake)
- 16GB RAM DDR4 2667MHz
- Intel® UHD Graphics 630
- Nvidia GTX 1050Ti 4GB (disabled on macOS)
- 2TB HP EX950 PCI-E Gen3 x4 NVMe SSD
- Realtek ALC236 Audio Controller
- RTL8168H Gigabit Ethernet
- Lenovo BCM94352Z (FRU:04X6020, PN:20-200480)
- ELAN Precision Trackpad (ELAN061B)
- BIOS : 8JCN56WW 11/30/2020

## Issues
- Nvidia GTX 1050Ti (No Optimus Support under macOS)
- macOS Monterey: AirDrop -> Can Receive, Sending fails

## BIOS
#### How to Access Advanced Menu
`Press FN + D + O and Then Reboot Laptop, Screen with Blue Box will be shown, Now press F2 to access BIOS Advanced Menu`

### Required BIOS Configuration

- Boot Mode: UEFI
- Storage Mode: AHCI
- Secure Boot : Disabled
- Kernel Debug Serial Port : Legacy UART \
 `Advanced -> Debug settings -> Legacy UART`
- Force unlock on all GPIO pads : Enabled `without this Trackpad will not work on macOS` \
`Advanced -> PCH-IO Configuration -> Security Configuration -> Force unlock on all GPIO pads`
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
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/chilledHamza/Hackintosh_Legion_Y530/main/AudioFix.sh)"
```
### Trackpad
- Uncheck "Force Click and haptic feedback" in Trackpad Preferences (trackpad buttons will not work without this)
- Bundled VoodooI2CHID is for ELAN061B (workaround trackpad-button issue)
- SYNA2B46 users should replace VoodooI2CHID with original version from [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C/releases/)

### Fixing iServices
- Follow [Fixing iMessage and other iServices | Dortania](https://dortania.github.io/OpenCore-Post-Install/universal/iservices.html)

## Credit
- [Acidanthera](https://github.com/acidanthera)
- [Alexandred](https://github.com/alexandred), [kprinssu](https://github.com/kprinssu), [ben9923](https://github.com/ben9923), [usr-sse2](https://github.com/usr-sse2) and others for [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C)
- [Mieze](https://github.com/Mieze)
- [RehabMan](https://github.com/RehabMan)
- [xiaoM](https://github.com/xiaoMGitHub)
