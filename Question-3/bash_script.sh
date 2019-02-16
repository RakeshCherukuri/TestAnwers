#!/usr/bin/env bash

export CODE_DIR=/home/testuser/mycode/
export REMOTE_CODE=/home/testuser/remotecode/

git clone https://github.com/RakeshCherukuri/TestAnswers.git $CODE_DIR
python fill_empty_fields.py
chown testuser $CODE_DIR/*
tar -zcvf $CODE_DIR/code_base.tar.gz $CODE_DIR
sha512sum $CODE_DIR/code_base.tar.gz > code_checksum.sha512
scp -o Cipher=3des $CODE_DIR/code_base.tar.gz testuser@remote.test.com:REMOTE_CODE
ssh testuser@remote.test.com 
ssh testuser@remote.test.com < checksum and node service.sh
if (curl --output /dev/null --silent --head --fail http://remote.test.com)
then
    echo 200 OK
