#!/bin/bash

if [ -z ${1+x} ];
then
  echo "Please specify a comma separated lists of github usernames"
  exit 1
fi

IFS=',' read -r -a array <<< "$1"

for username in "${array[@]}"
do
  # printf "Downloading public keys from github for user %s\n" $username
  curl "https://github.com/${username}.keys"
done
