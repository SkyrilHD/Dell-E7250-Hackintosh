# Dell E7250 Hackintosh

This repo includes all (beside WiFi and BT) the fixes for macOS Mojave on E7250.

Tested on:

Model: Dell E7250
CPU: Intel Core i5-5300U
GPU: Intel HD Graphics 5500
RAM: 8GB DDR3 1600Mhz
Storage: SAMSUNG SSD PM871 mSATA 128GB
WiFi & Bluetooth: Intel Dual Band Wireless-AC 7265 (which is not supported)
GSM/LTE: Sierra Wireless AirPrime EM7305 (DW5809e)
Software: macOS 10.14.6 Mojave

# What works?

Everything except WiFi and BT. You need to change the card.

# Download and Install

Download a clone of this repo and paste all the necessary files in the folders.

# What to expect

- Works flawlessly
- Boots straight to OS (change settings if you DualBoot)
- no Verbose (Apple Logo)
- little glitches at Boot (Graphics Driver loads)
- after sleep there might be not internet
- your carrier must support APN with username and password
- Audio is a little bit distorted but not so much that it would be a problem
- brightness control works only BIOS side (meaning no brightness control via macOS {use Karabiner to remap the fn-keys})
- sleep works but if you close the lid it takes a while

# How to Install macOS Mojave

First of all, you need an already working Mac with supported Specs (check Apple's website). Download the latest verison of Mojave und create a bootable Installer with Unibeast. Then disable in the BIOS setting all security features and set to AHCI and disable Secure Boot. Plug the USB in and boot into the Installer. Install as usual until you are on the Desktop. Mount the EFI partition and copy the folder that I attached to the partition and copy all the .kexts to their place. And restart. Et voilà, you have a working Hacnkintosh.

You need to change your WiFi card to get your internet working. Buy it on eBay or on your trustworthy website and find a suitable card (M.2) with the kexts.

# Credits

Thanks for:

- Rehabman (by fixing the graphics, battery information and keyboard issues)
- osxlatitude (by fixing cellular connectivities)
- me (by wasting his time to write this and provide fixes)


All this was written on an E7250 with Mojave installed :D
