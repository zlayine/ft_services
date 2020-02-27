#!/bin/sh

echo "pasv_address=$PASV_ADDRESS" >> /etc/vsftpd/vsftpd.conf
addgroup -g 433 -S $FTP_USER
adduser -u 431 -D -G $FTP_USER -h /home/$FTP_USER -s /bin/false  $FTP_USER
echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ -R

vsftpd /etc/vsftpd/vsftpd.conf