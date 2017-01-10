#!/bin/bash
# Args: `$1`: package
# Have a look at http://www.asterisk.org/downloads/asterisk/all-asterisk-versions
PACKAGE_ASTERISK=${1:-"asterisk-14.2.1"}
export DEBIAN_FRONTEND=noninteractive
BASE_DIR="/usr/src/asterisk"


apt-get -y update
apt-get install -y wget aptitude linux-headers-`uname -r` \
                  build-essential libxml2-dev libncurses5-dev \
                  libsqlite3-dev uuid-dev libjansson-dev
if [ ! -d "${BASE_DIR}" ]; then
  mkdir ${BASE_DIR}
fi
cd ${BASE_DIR} || exit 1



#
## downloads dahdi
wget http://downloads.asterisk.org/pub/telephony/dahdi-linux-complete/dahdi-linux-complete-2.10.2+2.10.2.tar.gz
tar -xvzf dahdi-linux-complete-*
rm -v dahdi-linux-complete-*.tar.gz
cd dahdi-linux-complete-* || exit 1

#
## Compile and install Dahdi
make all && make install && make config && /etc/init.d/dahdi start


#
## downloads asterisk
wget http://downloads.asterisk.org/pub/telephony/asterisk/$PACKAGE_ASTERISK.tar.gz
tar -zxvf $PACKAGE_ASTERISK.tar.gz
rm -v $PACKAGE_ASTERISK.tar.gz
cd $PACKAGE_ASTERISK || exit 1

#
## install asterisk
./contrib/scripts/install_prereq install
./configure

#
## build asterisk
make
make install
make menuselect
make samples
make config

#
## starting asterisk
/etc/init.d/asterisk start
