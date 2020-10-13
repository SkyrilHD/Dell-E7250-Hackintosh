# Dell E7250 Hackintosh

### This repo includes all fixes for E7250 on macOS Big Sur.

The EFI folder can also be used on older versions of macOS. But the main support of this branch is based on Big Sur. If you want an EFI that was specifically made for Catalina, check the [10.15 branch](https://github.com/SkyrilHD/Dell-E7250-Hackintosh/tree/10.15).

This time I have decided to drop Clover support, since I have little to no time. Sorry.


Tested on:

Model | Latitude E7250
------------- | ---------------
CPU | Intel Core i5-5300U
GPU | Intel HD Graphics 5500
RAM | 16GB DDR3 1600Mhz
Storage | SAMSUNG SSD PM871 mSATA 128GB
WiFi | Intel Dual Band Wireless-AC 7265 (only Bluetooth does work with this EFI)
GSM/LTE | Sierra Wireless AirPrime EM7305 (DW5809e)
Software | macOS 11.0 Big Sur

## What works?

Everything...

## Download and Install

Copy the EFI folder to your EFI partition... That's it.

## What to expect

- Works really good
- no Verbose (Apple Logo)
- little glitches at boot (Graphics Driver loads)
- brightness control works only by doing Fn+F6 (Brightness down) and Fn+B (Brightness up)
- Apple's audio driver as main
- sleep works
- Bluetooth is working too and can also be disabled

## My laptop doesn't sleep :(

It takes time to put the laptop to sleep. Usually it takes 30 seconds - 1 minute. If it doesn't sleep, check  if there are any preventers.

## How to Install macOS Big Sur

There are two ways you can install Big Sur:

1. If you have an already working macOS, download the Installer through App Store and make a bootable Installer with `createinstallmedia` by using this command in Terminal: `sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume`

2. If you are using Windows, use [gibMacOS](https://github.com/corpnewt/gibMacOS) by corpnewt.

After you made a bootable Installer, copy the EFI to the EFI partition and install as usual. After the installation, mount the EFI of the installed OS and copy the EFI folder to its partition.

If you want an OOTB-WiFi: You need to change your WiFi card to get your internet working. Buy it on eBay or your trustworthy website and find a suitable card (M.2) with the kexts.

## Screenshot

![About this Mac](https://user-images.githubusercontent.com/28839925/95805006-9d98d000-0d04-11eb-80f5-4d8c385f0cee.png)


## Credits

Thanks to:

- me (for wasting my time writing this and providig fixes)
- acidanthera (for making an awesome bootloader)
- Harvé (for suggesting to inject property in Clover)
- DrHurt (for supporting our ALPS Trackpad)
- zxystd (for fixing the Bluetooth issue and Intel WiFi card)
- dortania (with their troubleshooting guide, I was able to fix sleep)


All this was written on an E7250 with Big Sur installed :D
