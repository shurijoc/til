## ログ関連

200MBだけ残して削除する

```
sudo journalctl --vacuum-size=200M
```

3日分だけ残して削除する

```
sudo journalctl --vacuum-time=3days
```

journalctlログ容量確認
容量の確認は、下記のコマンドで可能です。

```
journalctl --disk-usage
```
