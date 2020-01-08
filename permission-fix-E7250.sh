#!/bin/bash

sudo chmod -Rf 755 /L*/E*
sudo chown -Rf 0:0 /L*/E*
sudo touch -f /L*/E*
sudo chmod -Rf 755 /S*/L*/E*
sudo chown -Rf 0:0 /S*/L*/E*
sudo touch -f /S*/L*/E*
sudo kextcache -Boot -U /
sudo kextcache -i /
echo 'Done fixing kext cache'

exit 0