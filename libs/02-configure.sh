#!/bin/bash

DEFAULT_DIR=${1:-"/vagrant/libs/conf"}

# install config file
cp $DEFAULT_DIR/users.conf /etc/asterisk/users.conf
cp $DEFAULT_DIR/voicemail.conf /etc/asterisk/voicemail.conf
cp $DEFAULT_DIR/extensions.conf /etc/asterisk/extensions.conf
#cp $DEFAULT_DIR/sip.conf /etc/asterisk/sip.conf
cp $DEFAULT_DIR/confbridge.conf /etc/asterisk/confbridge.conf

# asterisk restart
/etc/init.d/asterisk restart
