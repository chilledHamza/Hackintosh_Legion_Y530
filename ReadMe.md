The purpose of this guide is to provide instructions for installing macOS Big Sur (or older versions) on the Lenovo Legion Y530/Y7000 (2018) laptop


## Computer Specification

#### Lenovo Legion Y530/Y7000 (2018)

- Intel® Core™ i7-8750H (Coffee-Lake)
- 16GB RAM DDR4 2400Mhz
- Intel® UHD Graphics 630
- Nvidia GTX 1050Ti 4GB (disabled)
- 1TB HP EX950 PCI-E Gen 3 SSD (NVMe)
- Realtek ALC236 Audio Controller
- RTL8168H Gigabit Ethernet
- Dell Wireless DW-1830 Wi-Fi + BT 4.1 LE (BCM943602BAED + BCM20703A1)
- Synaptics Precission Trackpad SYNA2B46 or ELAN061B (check Issues for ELAN) 
- BIOS : 8JCN54WW 6/15/2020

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

## Post-Installation
- Run following command in terminal to Fix Headphone Audio 
```
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/chilledHamza/Hackintosh_Legion_Y7000_2018/main/AudioFix.sh)"
```

## Credit
- [Acidanthera](https://github.com/acidanthera)
- [Alexandred](https://github.com/alexandred), [kprinssu](https://github.com/kprinssu), [ben9923](https://github.com/ben9923) and others for [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C)
- [Mieze](https://github.com/Mieze)
- [RehabMan](https://github.com/RehabMan)
- [xiaoM](https://github.com/xiaoMGitHub)
