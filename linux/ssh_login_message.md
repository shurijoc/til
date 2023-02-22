テキスト準備
```
vi /etc/ssh/before_login_message.txt
chmod 644 /etc/ssh/before_login_message.txt

テキストを読み込む
vi /etc/ssh/sshd_config
```

/etc/ssh/sshd_config
```
Banner /etc/ssh/before_login_message.txt
```

sshdを再起動
```
systemctl restart sshd
```
