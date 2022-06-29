#!/bin/bash

#1. install initsetup bgw_start_up
chmod +x ./initsetup
chmod +x ./bgw_start_up
sed -i 's/\r$//g' initsetup
sed -i 's/\r$//g' bgw_start_up
cp ./initsetup /usr/local/bin/
cp ./bgw_start_up /usr/local/bin/

#2. install dummy.ko
cp ./dummy.ko /lib/modules/4.14.151-OpenNetworkLinux/kernel/drivers
depmod -a
modprobe dummy

#3. install lib
cp ./libjansson.so.4.9.0 /usr/local/lib/libjansson.so.4
cp ./libnl-3.so.200.22.0 /usr/local/lib/libnl-3.so.200
cp ./libnl-route-3.so.200.22.0 /usr/local/lib/libnl-route-3.so.200
cp ./libprofiler.so.0 /usr/local/lib/libprofiler.so.0
cp ./libunwind-x86_64.so.8.0.1 /usr/local/lib/libunwind.so.8

#4. install lldp
dpkg -i libconfig9_1.5-0.3_amd64.deb
dpkg -i libnl-3-200_3.2.27-2_amd64.deb
dpkg -i lldpad_0.9.46-3.1_amd64.deb

#5. install python lid
tar -zxvf thrift.tar.gz -C /usr/local/lib/python3.5/dist-packages/
tar -zxvf grpc3.5.tar.gz -C /usr/local/lib/python3.5/dist-packages/
tar -zxvf enum.tar.gz -C /usr/local/lib/python3.5/dist-packages/
tar -zxvf google.tar.gz  -C /usr/local/lib/python3.5/dist-packages/
cp protobuf-3.6.1-py3.5-nspkg.pth /usr/local/lib/python3.5/dist-packages/
cp six.py /usr/local/lib/python3.5/dist-packages/

