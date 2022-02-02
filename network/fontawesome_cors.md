fontawesomeを使用する際はnginxの設定でresponse headerにAccessControlAllowOriginを付与しないとCORSエラーが出ることが多い


```
location ~* \.(ttf|ttc|otf|eot|woff|woff2|svg|font.css)$ {
  add_header Access-Control-Allow-Origin *;
  expires max;
  allow all;
  access_log off;
  add_header Cache-Control "public";
}
```

参考: https://stackoverflow.com/questions/33003567/rails-assets-cloudfront-fontawesome-cors
