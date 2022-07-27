```
[root@mysql ~]# rm -rf /var/lib/mysql
[root@mysql ~]# ls /var/lib/
alternatives  chrony  dhclient  games   initramfs  machines  mlocate      mysql-keyring   os-prober  polkit-1  rpcbind  rpm-state  samba      systemd  tuned    yum
authconfig    dbus    fprint    hyperv  logrotate  misc      mysql-files  NetworkManager  plymouth   postfix   rpm      rsyslog    stateless  tpm      waagent
 
[root@mysql ~]# systemctl start mysqld.service
```
