[![Build Status](https://travis-ci.com/SkyrilHD/Dell-E7250-Hackintosh.svg?branch=10.15)](https://travis-ci.com/SkyrilHD/Dell-E7250-Hackintosh)

# Dell E7250 Hackintosh

This repo includes all fixes for macOS Catalina on E7250.

This EFI folder can also be used on Mojave. I made also a separated branch specific for Mojave (it's messed up).

I was about to give up on this project because it hang at "PCI Configuration Begin", but thankfully it was fixed after creating a proper DSDT.

Tested on:

- Model: Dell Latitude E7250
- CPU: Intel Core i5-5300U
- GPU: Intel HD Graphics 5500
- RAM: 16GB DDR3 1600Mhz
- Storage: SAMSUNG SSD PM871 mSATA 128GB
- WiFi & Bluetooth: Intel Dual Band Wireless-AC 7265 (only Bluetooth does work) (There is a fix (10.15.2) to use the Intel WiFi but I am not publish it until it is in public and stable)
- GSM/LTE: Sierra Wireless AirPrime EM7305 (DW5809e)
- Software: macOS 10.15.4 Catalina

# What works?

Everything...

# Download and Install

Copy the EFI folder to your EFI partition... That's it.

# What to expect

- Works really good
- FastBoot to macOS
- no Verbose (Apple Logo)
- little glitches at Boot (Graphics Driver loads)
- brightness control works only BIOS side (meaning no brightness control via macOS {use Karabiner to remap the fn-keys})
- Apple's audio driver as main
- sleep works
- Bluetooth is working too and can also be disabled
- don't install the 10.15.4 update if you want to use the Intel WiFi

If you have an AppleIntelWiFi.kext installed on your system:
- AppleIntelWiFi.kext kernel panics our system for now (A kext releasing IOPCIDevice has corrupted the registry)
- So the points below, applies only for 10.15.2

- {BETA} You need to enter your SSID in the kext file and 'kextload' it
- {BETA} Restarts randomly with WiFi enabled (only for light-use)

# How to Install macOS Catalina

First of all, you need an already working Mac with supported Specs (check Apple's website). Download the latest verison of Catalina und create a bootable Installer with Unibeast. Then disable in the BIOS setting all security features and set to AHCI and disable Secure Boot. Plug the USB in and boot into the Installer. Install as usual until you are on the Desktop. Mount the EFI partition and copy the folder that I attached in this branch. And restart. Et voilà, you have a working Hackintosh.

If you want an OOTB-WiFi:
You need to change your WiFi card to get your internet working. Buy it on eBay or on your trustworthy website and find a suitable card (M.2) with the kexts.

# Credits

Thanks to:

- me (for wasting my time to write this, provide fixes and creating an E7250 DSDT)
- Harvé (for suggesting to inject property in Clover)
- Rehabman (for fixing the graphics, battery information and keyboard issues)
- zxystd (for fixing Bluetooth issue)
- ________ (for fixing the Intel WiFi card)


All this was written on an E7250 with Catalina installed :D
