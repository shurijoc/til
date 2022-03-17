1. s3にオブジェクトを配置する
2. 読み込みたいオブジェクト/ディレクトリはpublicにする
3. cloudfrontを作成する
  2. originはs3のbucketを設定
  3. behaviorにもs3のurlを設定
    4. redirect http to https
    5. httpsを使う場合はssl証明書の設定も必要
4. cloudfrontのurlでs3のオブジェクトを取得できるか確認
5. route53のcnameでassets.example.com のように設定する
6. settingsのAlternate domain names にassets.exammple.com を設定する
