#!/bin/bash
for X in 8.0.1905 8.1.1911 8.2.2004 8.3.2011; do
  wget -c -q https://vault.centos.org/$X/BaseOS/x86_64/os/images/pxeboot/vmlinuz -O CentOS-$X || \
    wget -c -q http://mirror.centos.org/centos/$X/BaseOS/x86_64/os/images/pxeboot/vmlinuz -O CentOS-$X
  pesign -P -h -i CentOS-$X 2>/dev/null
done
