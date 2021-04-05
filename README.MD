# Dell E7250 Hackintosh

[![OpenCore Version](https://img.shields.io/badge/OpenCore-0.6.7-green.svg)](https://github.com/SkyrilHD/Dell-E7250-Hackintosh/)
[![GitHub release](https://img.shields.io/github/release/SkyrilHD/Dell-E7250-Hackintosh.svg)](https://github.com/SkyrilHD/Dell-E7250-Hackintosh/releases/)
[![GitHub issues](https://img.shields.io/github/issues/SkyrilHD/Dell-E7250-Hackintosh.svg)](https://github.com/SkyrilHD/Dell-E7250-Hackintosh/issues/)

### This repo contains all the fixes for E7250 on macOS Big Sur.

The EFI folder can also be used on older versions of macOS. However, the main support of this branch is based on Big Sur. If you want an EFI made specifically for Catalina, check the [10.15 branch](https://github.com/SkyrilHD/Dell-E7250-Hackintosh/tree/10.15).

This time around, I have decided to drop Clover support as I have little to no time. Sorry.


Tested on:

Model | Latitude E7250
------------- | ---------------
CPU | Intel Core i5-5300U
GPU | Intel HD Graphics 5500
RAM | 16GB DDR3 1600Mhz
Storage | SK hynix SC210 mSATA 128GB
WiFi | Intel Dual Band Wireless-AC 7265
GSM/LTE | Sierra Wireless AirPrime EM7305 (DW5809e)
Software | macOS 11.0 Big Sur

## What works?

Everything...

## Download and Install

Go to the [Releases](https://github.com/SkyrilHD/Dell-E7250-Hackintosh/releases/) page of this repo and download the latest release. Then, copy the EFI folder to your EFI partition... That's it.

## What to expect

- Works really good
- no Verbose (Apple Logo)
- little glitches at boot (Graphics Driver loads)
- brightness control now works via F11/F12
- Apple's audio driver as main
- sleep works
- Bluetooth is working too and can also be disabled

## My laptop doesn't sleep :(

It takes time to put the laptop to sleep. Usually it takes 30 seconds - 1 minute. If it doesn't sleep, check if there are any preventers.

## How to Install macOS Big Sur

There are two ways you can install Big Sur:

1. If you have an already working macOS, download the Installer from the App Store and make a bootable Installer with `createinstallmedia` by using this command in Terminal: `sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume`

2. If you are using Windows, use [macrecovery.py](https://github.com/acidanthera/OpenCorePkg/tree/master/Utilities/macrecovery) from the offical [OpenCore release package](https://github.com/acidanthera/OpenCorePkg/releases/). Follow this [guide](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/winblows-install.html) to understand how it works.

After you have created a bootable Installer, copy the EFI folder to the EFI partition and install as usual. After the installation, mount the EFI partition of the installed OS and copy the EFI folder to its partition.

If you want an OOTB-WiFi: You need to change your WiFi card in order for your internet to work. Buy it on eBay or your trusted website and find a suitable card (M.2) with the kexts.

## Screenshot

![About this Mac](https://user-images.githubusercontent.com/28839925/95805006-9d98d000-0d04-11eb-80f5-4d8c385f0cee.png)


## Credits

Thanks to:

- me (for wasting my time writing this and providing fixes)
- acidanthera (for making an awesome bootloader)
- dortania (with their troubleshooting guide, I was able to fix sleep)
- DrHurt (for supporting our ALPS Trackpad)
- Harvé (for suggesting to inject property in Clover)
- zxystd (for fixing the Bluetooth issue and Intel WiFi card)


All this was written on an E7250 with Big Sur installed :D
