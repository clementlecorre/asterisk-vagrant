#!/bin/bash

DEFAULT_DIR=${1:-"/vagrant/libs/conf"}

# install config file
install $DEFAULT_DIR/user.conf /etc/asterisk/users.conf
install $DEFAULT_DIR/voicemail.conf /etc/asterisk/voicemail.conf
install $DEFAULT_DIR/extensions.conf /etc/asterisk/extensions.conf
install $DEFAULT_DIR/sip.conf /etc/asterisk/sip.conf

# asterisk restart 
/etc/init.d/asterisk restart
