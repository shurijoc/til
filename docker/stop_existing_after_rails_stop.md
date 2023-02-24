## 対処1 railsのPIDが1なのが原因の可能性

```
docker ps -a
```

もしPIDが1だったら init: true を追加する

```docker-compose.yml
services:
  rails:
    init: true
```
