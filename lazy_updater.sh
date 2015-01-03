#!/bin/bash

####################################################################
#########AUTOMATED LAZY BUMBLEBEE INSTALLER FOR SLACKWARE###########
####################################################################


location=$(pwd)
set -e

function kernel {


  cd $location/bbswitch
  ./bbswitch.SlackBuild
  upgradepkg --install-new /tmp/bbswitch-*.t?z

  cd $location/nvidia-kernel
  COMPAT32=yes ./nvidia-kernel.SlackBuild
  upgradepkg --install-new /tmp/nvidia-kernel-*.t?z

}

function all {


  cd $location/libbsd
  ./libbsd.SlackBuild
  upgradepkg --install-new /tmp/libbsd-*.t?z

  cd $location/bumblebee
  ./bumblebee.SlackBuild
  upgradepkg --install-new /tmp/bumblebee-*.t?z

  cd $location/bbswitch
  ./bbswitch.SlackBuild
  upgradepkg --install-new /tmp/bbswitch-*.t?z
  
  cd $location/primus
  COMPAT32=yes ./primus.SlackBuild
  upgradepkg --install-new /tmp/primus*.t?z

  cd $location/nvidia-kernel
  COMPAT32=yes ./nvidia-kernel.SlackBuild
  upgradepkg --install-new /tmp/nvidia-kernel-*.t?z

  cd $location/nvidia-bumblebee
  COMPAT32=yes ./nvidia-bumblebee.SlackBuild # Only for 32-bit compatible binaries and libraries on an x86_64 based system.
  upgradepkg --install-new /tmp/nvidia-bumblebee-*.t?z

}

function help {
	  echo "Usage:"
	  echo ""
	  echo "options"
	  echo "--all     : reinstalls everything"
	  echo "--kernel  : just installs the packages required when you install a new kernel"
	  echo "--help	  : prints this message"
}

if [ $UID != '0' ];
then 
	echo "Run as root"
	exit
else 
	rm -rf /tmp/*bbsb*
	if [ $1 = '--all' ];
	then
	  all
	else if [ $1 = '--kernel' ];
	then 
	  kernel
	else if [ $1 = '--help' ];
	then
	  help
	else
	  help
	fi
	fi
	fi
fi



chmod +x /etc/rc.d/rc.bumblebeed
#/etc/rc.d/rc.bumblebeed start

