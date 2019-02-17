#!/usr/bin/env bash

export REMOTE_CODE=/home/testuser/remotecode/
export NODE_ROOT=/usr/node/data

# Checksum for checking file integrity
sha512sum -c code_checksum.sha512 2> sha512errors 1>/dev/null
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
mv remotecode/*.tar.gz $NODE_ROOT
tar -xvzf $NODE_ROOT/code_base.tar.gz
# Start node 
if (systemctl -q is-active mongod)
  then
    sudo systemctl start node.service
else
    echo Service already running
    sudo systemctl restart node.service
fi

