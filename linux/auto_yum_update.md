◯yumのセキュリティ自動アップデート
```
sudo yum install -y yum-cron

sudo cp /etc/yum/yum-cron.conf /etc/yum/yum-cron.conf.org
sudo vi /etc/yum/yum-cron.conf
```

/etc/yum/yum-cron.conf
```
update_cmd = security
apply_updates = yes
```

起動
```
sudo service yum-cron start
sudo chkconfig yum-cron on
```
