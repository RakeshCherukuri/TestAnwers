#!/usr/bin/env bash

export REMOTE_CODE=/home/testuser/remotecode/
export NODE_ROOT=/home/ubuntu/node/data

# Checksum for checking file integrity
cd  $REMOTE_CODE 
sha512sum code_base.tar.gz  > code_checksum1.txt
sha512sum -c code_checksum1.txt code_checksum.txt 2> sha512errors 1>/dev/null
if [ -s sha512errors ]
then
  echo The following errors where found:
  more sha512errors
  rm -f sha512errors
else
  echo All files are ok.
  rm -f sha512errors
fi
# Stop node if it is running
if (systemctl -q is-active mongod)
  then
    sudo systemctl stop node.service
else
    echo Service not running
fi
# Move the code and extract
mv $REMOTE_CODE/code_base.tar.gz $NODE_ROOT
tar -xf $NODE_ROOT/code_base.tar.gz -C $NODE_ROOT
# Start node 
if (systemctl -q is-active mongod)
  then
    sudo systemctl start node.service
else
    echo Service already running
    sudo systemctl restart node.service
fi

