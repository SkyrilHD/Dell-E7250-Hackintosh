[![Build Status](https://travis-ci.com/SkyrilHD/Dell-E7250-Hackintosh.svg?branch=10.15)](https://travis-ci.com/SkyrilHD/Dell-E7250-Hackintosh)

# Dell E7250 Hackintosh

This repo includes all fixes for macOS Catalina on E7250.

The Clover EFI folder can also be used on Mojave. I also made a separate branch specific for Mojave (it's messed up), but use this :D.

PLEASE don't install the OpenCore EFI because it is currently not in a working state. Of course the EFI will boot up, but you will give up everything. So, please use Clover for now.

I was about to give up on this project because it hang at "PCI Configuration Begin", but thankfully it was fixed after creating a proper DSDT.

Tested on:

- Model: Dell Latitude E7250
- CPU: Intel Core i5-5300U
- GPU: Intel HD Graphics 5500
- RAM: 16GB DDR3 1600Mhz
- Storage: SAMSUNG SSD PM871 mSATA 128GB
- WiFi & Bluetooth: Intel Dual Band Wireless-AC 7265 (only Bluetooth does work) (There is a fix to use the Intel WiFi but I will not publish it until it is in public and stable)
- GSM/LTE: Sierra Wireless AirPrime EM7305 (DW5809e)
- Software: macOS 10.15.4 Catalina

# What works?

Everything...

# Download and Install

Copy the EFI folder to your EFI partition... That's it.

# What to expect

- Works really good
- no Verbose (Apple Logo)
- little glitches at Boot (Graphics Driver loads)
- brightness control works only BIOS side (meaning no brightness control via macOS {use Karabiner to remap the fn-keys})
- Apple's audio driver as main
- sleep works
- Bluetooth is working too and can also be disabled
- {BETA} You need to enter your SSID in the kext file and 'kextload' it
- {BETA} Restarts randomly with WiFi enabled (only for light-use)

# How to Install macOS Catalina

First of all, you need an already working Mac with supported Specs (check Apple's website). Download the latest verison of Catalina from the App Store and use this command:

sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/MyVolume

After it is done copy the EFI folder to the EFI partition and install as usual. After it is installed mount the EFI of the installed OS and copy the EFI folder to its partition.

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
