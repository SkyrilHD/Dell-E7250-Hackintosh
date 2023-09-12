# Dell E7250 Hackintosh

[![OpenCore Version](https://img.shields.io/badge/OpenCore-0.9.5-green.svg)](https://github.com/SkyrilHD/Dell-E7250-Hackintosh/)
[![GitHub release](https://img.shields.io/github/tag/SkyrilHD/Dell-E7250-Hackintosh.svg)](https://github.com/SkyrilHD/Dell-E7250-Hackintosh/releases/)
[![GitHub issues](https://img.shields.io/github/issues/SkyrilHD/Dell-E7250-Hackintosh.svg)](https://github.com/SkyrilHD/Dell-E7250-Hackintosh/issues/)

### This repo contains all the fixes for E7250 on macOS Ventura.

The EFI folder can also be used on older versions of macOS. However, the main support of this branch is based on Ventura. If you want an EFI made specifically for Monterey, check the [12.0 branch](https://github.com/SkyrilHD/Dell-E7250-Hackintosh/tree/12.0).

Tested on:

Model | Latitude E7250
------------- | ---------------
CPU | Intel Core i5-5300U
GPU | Intel HD Graphics 5500
RAM | 16GB DDR3 1600Mhz
Storage | SK hynix SC210 mSATA 128GB
WiFi | Intel Dual Band Wireless-AC 7265
GSM/LTE | Sierra Wireless AirPrime EM7305 (DW5809e)
Software | macOS 13.0 Ventura

## What works?

Everything...
  - Since Ventura: except GPU acceleration [[can be patched]](#GPU-acceleration-on-Ventura)

## Download and Install

Go to the [Releases](https://github.com/SkyrilHD/Dell-E7250-Hackintosh/releases/) page of this repo and download the latest release according to the macOS you want to install. Then, copy the EFI folder to your EFI partition... That's it.

## Graphical glitches in macOS

There are three ways to fix the horizontal glitches (as seen [here](https://github.com/newyb/Something-useful-of-E7250/blob/main/BUG2%20at%20sign.jpg)) in macOS.

1. (Recommended) Enable 'Enable Legacy Option ROMs' in the BIOS by clicking General>Advanced Boot Options. [Here](https://supportkb.dell.com/img/ka02R000000oLv9QAE/ka02R000000oLv9QAE_en_US_2.jpeg) is a picture of that option.

2. If you want to use pure UEFI as a workaround, you can use [one-key-hidpi](https://github.com/xzhih/one-key-hidpi). Download and run the code and select 'Enable HIDPI (with EDID)'. Then restart your computer and the glitches should be resolved.

3. Patching Display EDID [WIP]

First we need to download these three Applications: [Hackintool](https://github.com/headkaze/Hackintool/releases), [AWEDIDEditor](https://www.analogway.com/files/uploads/produit/download/en/aw_edideditor_setup_2_00_13_macos.zip) and [HexFiend](https://github.com/HexFiend/HexFiend/releases)

- Open Hackintool and go to the `Displays` tab and click the Export icon/button on the bottom-right side.
- On desktop, you will see some new files appeared, now open the `EDID-***-****-orig.bin` file with AWEDIDEditor
- Go to `Detailed Data` tab and change `H. Sync Width:` value to `100`.
- Save the EDID as `Patched-EDID` or whatever name you like just to know which one is the patched one
- Open the `Patched-EDID` with HexFiend and make sure you expand it so it contains 8 columns of code bytes and copy the 128 bytes of it.
- Add child `AAPL00,override-no-connect` to `EFI>OC>Config.plist>DeviceProperties>PciRoot(0x0)/Pci(0x2,0x0)` with `Data` as the type and paste the 128 bytes of code in there
- Save the config.plist file and reboot, Enjoy pure UEFI without a garbled screen.

## GPU acceleration on Ventura

Since Apple dropped support for our SMBIOS (MacBookPro12,1) on Ventura, the Broadwell graphic kexts have also been removed. This means we need to patch the Broadwell kexts back to Ventura, which means we need to disable SIP. Disabling SIP results in losing the ability to apply Delta OTA updates. The patch must also be reapplied after each macOS update. To add the required kexts back to the system, you should use a tool called OpenCore Legacy Patcher, which has an amazing team that adds back support for older Macs.

- Go to the latest OpenCore Legacy Patcher Release page: [Link](https://github.com/dortania/OpenCore-Legacy-Patcher/releases)
- Download 'OpenCore-Patcher-GUI.app.zip'
- After download, open the app and select 'Post Install Root Patch'.
- Wait for a while and reboot the system after it finishes.
- Enjoy your E7250 on Ventura :)

## Intel WiFi

Starting with v2.3, AirportItlwm is included in the EFI but disabled to ensure stability. To enable Intel WiFi, enable it in the config. The EFI will only have stable versions of AirportItlwm. So if you want to experiment with Intel WiFi, you can do so by visiting the [itlwm repo](https://github.com/OpenIntelWireless/itlwm) and downloading the latest alpha build. Stability can be much worse, so use with caution! Also, do not forget to enable IntelBluetoothFirmware, BlueToolFixup and IntelBTPatcher in the config to enable Bluetooth on Ventura!

If you experience no internet with AirportItlwm, I suggest switching to itlwm and see if it works there.

Since Monterey, the Bluetooth implementation has changed and therefore causes issues such as: Bluetooth will be broken after sleep. As a workaround, typing the following command in Terminal may fix this issue: `sudo killall -9 bluetoothd BlueTool`

Users on Ventura: You may have an issue with IntelBTPatcher that causes kernel panics or shutdown/reboot issues. In this case, disable IntelBTPatcher to fix the issue until it is fixed.

If you want Continuity features: Buy a Broadcom card on eBay or your trusted website. You can check the Dortania buyers guide to see which card is the better option: [Link](https://dortania.github.io/Wireless-Buyers-Guide/)

## OTA from Monterey to Ventura

Since v4.0 installing Ventura via OTA should be very easy. Replace your Monterey EFI with Ventura and boot as usual. Open 'System Preferences' and go to 'Software Update'. Download macOS Ventura and proceed with the installation as a normal update. After update, run OpenCore Legacy Patcher to fix GPU acceleration. Here's a little [guide](#GPU-acceleration-on-Ventura) you can follow. Keep in mind that replacing Monterey EFI with Ventura drops AirportItlwm support on Monterey! If you want to upgrade to Ventura over WiFi, replace the Ventura version of AirportItlwm with a Monterey version. After the update, you need to roll back the Ventura version of AirportItlwm to support WiFi on Ventura.

## Touchscreen

For touchscreen models, I also added VoodooI2C to take advantage of the touchscreen display. However, it is disabled. If you want to use it, you have to activate all VoodooI2C-related kexts in the config! Since v3.0 there is a new touchpad kext that also uses VoodooInput. So you need to disable VoodooInput that comes with VoodooPS2 and enable VoodooInput that comes with VoodooI2C, otherwise the system will not boot.

## How to Install macOS Ventura

There are two ways you can install Ventura:

1. If you have an already working macOS, download the Installer from the App Store and make a bootable Installer with `createinstallmedia` by using this command in Terminal: `sudo /Applications/Install\ macOS\ Ventura.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume`

2. If you are using Windows, use [macrecovery.py](https://github.com/acidanthera/OpenCorePkg/tree/master/Utilities/macrecovery) from the offical [OpenCore release package](https://github.com/acidanthera/OpenCorePkg/releases/). Follow this [guide](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/windows-install.html) to understand how it works.

After you have created a bootable Installer, copy the EFI folder to the EFI partition and install as usual. After the installation, mount the EFI partition of the installed OS and copy the EFI folder to its partition.

## Screenshot

![About this Mac](https://user-images.githubusercontent.com/28839925/198919984-5ba0e437-6ba3-4696-9f17-171519820af3.png)


## Credits

Thanks to:

- me (for wasting my time writing this and providing fixes)
- acidanthera (for making an awesome bootloader)
- adyrosebrigg (for help and testing USB and dimmed screen on Windows)
- dortania (with their troubleshooting guide, I was able to fix sleep and root patches for GPU acceleration)
- DrHurt (for supporting our ALPS Trackpad)
- emrah7celik (for providing a guide on how to fix the glitches in macOS with pure UEFI)
- Harvé (for suggesting to inject property in Clover)
- hickorysb (for confirming the fix for glitches with Legacy Option ROMs)
- zxystd (for fixing the Bluetooth issue and Intel WiFi card)


All this was written on an E7250 with Ventura installed :D
