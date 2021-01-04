#!/bin/bash
[[ -z "$1" ]] && echo "Usage: $0 download.xxx.xxx.redhat.com" && exit 1
for Y in 0 1 2 3
  do wget -c -q http://$1/released/RHEL-8/8.$Y.0/BaseOS/x86_64/os/images/pxeboot/vmlinuz -O RHEL-8.$Y
  pesign -P -h -i RHEL-8.$Y
done
