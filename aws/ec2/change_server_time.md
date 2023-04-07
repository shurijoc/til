
## はじめに
EC2の時刻を一時的に特定時刻に変更する例です。

## 変更する手順
### 1. ntpdを停止する
時刻は、現在時刻のデータを配信しているサーバ(NTPサーバー)と時刻合わせして設定しています。ntpdというデーモンで実行されているため、時刻合わせされないようにまずntpdを停止します。

```
$ sudo service ntpd stop
Shutting down ntpd:

$ sudo service ntpd status
ntpd is stopped
```

### 2. dateコマンドで変更する
ソフトウェアクロックをdateコマンドで変更します。


```
$ date
2016年 10月 11日 火曜日 16:31:16 JST

$ sudo date -s "10/05 13:00 2016"
2016年 10月  5日 水曜日 13:00:00 JST

$ date
2016年 10月  5日 水曜日 13:00:02 JST
```

## 元に戻す手順
ntpdを起動させれば元に戻ります。

```
$ sudo service ntpd start
$ date
```
