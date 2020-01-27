# Dell E7250 Hackintosh

This repo includes some fixes for macOS Catalina on E7250.

Tested on:

- Model: Dell E7250
- CPU: Intel Core i5-5300U
- GPU: Intel HD Graphics 5500
- RAM: 8GB DDR3 1600Mhz
- Storage: SAMSUNG SSD PM871 mSATA 128GB
- WiFi & Bluetooth: Intel Dual Band Wireless-AC 7265 (which is not supported)
- GSM/LTE: Sierra Wireless AirPrime EM7305 (DW5809e)
- Software: macOS 10.15.2 Catalina

# What works?

You can boot to Catalina but don't except to work it flawlessly.

# Download and Install

Copy the EFI folder to your EFI partition... That's it.

# What to expect

- Works ok...
- need to select the hard disk in clover menu
- no Verbose (Apple Logo)
- little glitches at Boot (Graphics Driver loads)
- after sleep there might be not internet
- brightness control doesn't work (even BIOS side is it buggy)
- sleep works but ONLY if you press sleep (closing lid does absolutely nothing)

# How to Install macOS Catalina

First of all, you need an already working Mac with supported Specs (check Apple's website). Download the latest verison of Catalina und create a bootable Installer with Unibeast. Then disable in the BIOS setting all security features and set to AHCI and disable Secure Boot. Plug the USB in and boot into the Installer. Install as usual until you are on the Desktop. Mount the EFI partition and copy the folder that I attached to the partition. And restart. Et voilà, you have a working Hacnkintosh.

You need to change your WiFi card to get your internet working. Buy it on eBay or on your trustworthy website and find a suitable card (M.2) with the kexts.

# Credits

Thanks for:

- me (by wasting my time to write this, provide fixes and creating a E7250 DSDT)


All this was written on an E7250 with Catalina installed :D