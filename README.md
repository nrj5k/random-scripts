random-scripts
==============

These are just random scripts that I use from time to time

- **lazy_updater.sh** is a shell script used to update the nVidia Optimus+Bumblebee drivers for Slackware. You need to get the files from https://github.com/WhiteWolf1776/Bumblebee-SlackBuilds and download them. This makes updating the files easier in general and also when you have just updated your kernel.

- **replace_line.py** is a small python script I use to replace a line with another line. It's useful when you have a large number of configuration files that need the exact same line in all of them with another line. Not exactly sure how often this happens, but I had to edit about 50 odd VPN configuration files. I made it specifically for that, and later changed it to a general purpose script. It does not support regex (yet!?) except for the directory you want to change those files in, that supports your basic wild cards and stuff. I do not see the point of a regex for the phrase that I want changed as it is made to handle configuration files.

- **kernel_update_post.sh** is a script that creates the initrd.gz file and moves the kernel and the initrd file to the right place, that I use
