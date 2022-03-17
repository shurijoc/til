1. s3にオブジェクトを配置する
1. cloudfrontを作成する
  2. originはs3のbucketを設定
  3. behaviorにもs3のurlを設定
    4. redirect http to https
    5. httpsを使う場合はssl証明書の設定も必要
1. cloudfrontのurlでs3のオブジェクトを取得できるか確認
2. route53のcnameでassets.example.com のように設定する
3. settingsのAlternate domain names にassets.exammple.com を設定する
