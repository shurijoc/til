1. s3にオブジェクトを配置する
2. 読み込みたいオブジェクト/ディレクトリはpublicにする
3. cloudfrontを作成する
- originはs3のbucketを設定
- behaviorにもs3のurlを設定
  - redirect http to https
  - httpsを使う場合はssl証明書の設定も必要
4. cloudfrontのurlでs3のオブジェクトを取得できるか確認
5. route53のcnameでassets.example.com のように設定する
6. settingsのAlternate domain names にassets.exammple.com を設定する
