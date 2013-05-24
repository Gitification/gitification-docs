#!/bin/bash

# Gist: https://gist.github.com/lukewpatterson/4242707
# SSH encode
GIT_REPO="Gitification/gitification-server"
KEY_FILE="/home/holmes/.ssh/gitification.key"
ID="gitification_base64_"

base64 --wrap=0 ${KEY_FILE} > ${KEY_FILE}_base64
ENCRYPTION_FILTER="echo \$(echo \"- secure: \")\$(travis encrypt \"\$FILE='\`cat $FILE\`'\" -r $GIT_REPO)"
split --bytes=80 --numeric-suffixes --suffix-length=2 --filter="${ENCRYPTION_FILTER}" ${KEY_FILE}_base64 ${ID}
