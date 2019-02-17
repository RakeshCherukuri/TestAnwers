#!/usr/bin/env bash

export CODE_DIR=/home/testuser/mycode/
export REMOTE_CODE=/home/testuser/remotecode/

#git clone https://github.com/RakeshCherukuri/TestAnwers.git $CODE_DIR
#python fill_empty_fields.py
#chown testuser $CODE_DIR/*
tar -C /home/testuser/ -zcf code_base.tar.gz mycode
sha512sum code_base.tar.gz > code_checksum.txt
#scp -o Cipher=3des $CODE_DIR/code_base.tar.gz testuser@remote.test.com:REMOTE_CODE
scp -i /home/ubuntu/.ssh/testuser.pem  -o Cipher=3des code_base.tar.gz code_checksum.txt testuser@34.216.220.37:$REMOTE_CODE
#ssh testuser@remote.test.com
ssh -i /home/ubuntu/.ssh/testuser.pem testuser@34.216.220.37 < check_sum_node_and_service.sh
#ssh testuser@remote.test.com < checksum and node service.sh
#ssh testuser@34.216.220.37 < check_sum_node_and_service.sh
#if (curl --output /dev/null --silent --head --fail http://agile.thirdleap.ai)
#then
#    echo 200 OK
