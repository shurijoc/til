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
