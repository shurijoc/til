```
const JST = new Date().toLocaleString({ timeZone: 'Asia/Tokyo' });
const timestamp = new Date(JST)
const fileTimestamp = timestamp.toISOString().substring(0,19);
const year = timestamp.getFullYear();
const month = timestamp.getMonth() + 1;
const day = timestamp.getDate();
```

これで取得できる
