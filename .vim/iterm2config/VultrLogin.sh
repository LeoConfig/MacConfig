#!/usr/bin/expect -f
  set port 1025
  set user root
  set host 198.13.49.55
  set password 3Th*fYEhAar@156T
  set timeout -1

  spawn ssh $user@$host
  expect "*assword:*"
  send "$password\r"
  interact
  expect eof  
