The purpose of this guide is to provide instructions for installing macOS (High Sierra and above) on the Lenovo Legion Y530/Y7000 (2018) laptop


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
- Synaptics Precission Trackpad (SYNA2B46)
- BIOS : 8JCN54WW 6/15/2020

## Issues
- Headphone jack sense doesn't work if plugged-in at cold boot
- Trackpad buttons don't work (as of VoodooI2C v2.6.0, button are recoginized but only if a Finger is placed on trackpad, further work needs to be done to make the buttons work when transducer/finger count is zero)
- Nvidia GTX 1050Ti (No Optimus Support under macOS)

## BIOS
#### How to Access Advanced Menu

    press `FN + D + O` and then reboot computer, after reboot Screen with Blue Box will be shown, Now press F2 to access Advanced Menu 

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

## Pre-Installation

##### macOS -> [How to create a bootable installer for macOS](https://support.apple.com/en-us/HT201372)
- Mount EFI partition of USB with `diskutil mount` command
- Copy EFI folder to root of EFI partition of USB

##### Windows or macOS (require python) -> [gibMacOS](https://github.com/corpnewt/gibMacOS)

- Replace EFI folder with in USB Flash Drive

## Post-Installation
- Mount system EFI partition, and copy EFI folder to root of system EFI partition

## Credit
- [Acidanthera](https://github.com/acidanthera)
- [Alexandred](https://github.com/alexandred), [kprinssu](https://github.com/kprinssu), [ben9923](https://github.com/ben9923) and others for [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C)
- [Mieze](https://github.com/Mieze)
- [RehabMan](https://github.com/RehabMan)
- [xiaoM](https://github.com/xiaoMGitHub)
