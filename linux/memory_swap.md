swapは物理メモリの2倍以下が望ましい。

## 最適スワップ容量の調査

ディスク容量を確認する
```
df -h
```

メモリ容量を確認する
```
free -hw
```

CPU使用率を確認する
```
top
```

システムログを確認する
```
tail /var/log/messages
```

## スワップ領域の作り方

現在のスワップ領域のサイズを確認する

```
sudo swapon -s
```

スワップ領域のサイズを調整する

```
sudo swapoff -a
sudo dd if=/dev/zero of=/swapfile bs=1G count=[スワップ領域のGBサイズ]
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

スワップ領域を再度確認する
```
sudo swapon -s
```

起動時にスワップファイルを起動する
```
$ sudo vi /etc/fstab
```

```
/swapfile swap swap defaults 0 0
```


## 補足
`dd` コマンド以外にも以下の形で領域を作れる。その場合はfallocateの方が早く動作するが一部swap-toolに対応できないらしい

```
sudo fallocate -l 512M /swapfile
```
