# partition is 何
mysqlで対応している大量レコードを保有するテーブルを高速化するための仕組み

# 仕組み
- あるKeyを基準にしてテーブルを分割する仕組み
- 例えばKeyをcreated_atにして、2020-01 < created_at, 2020-02 < created_at みたいに分ける
- where(created_at: xxxx)のときの検索が早くなる

# イメージ図
<img width="488" alt="20181006193802" src="https://user-images.githubusercontent.com/6407534/75232417-87ccae00-57fa-11ea-9554-fd98cf5fb6d9.png">
<img width="512" alt="20181006193810" src="https://user-images.githubusercontent.com/6407534/75232410-84392700-57fa-11ea-8b76-105d7e12b732.png">

# 参考
https://norikone.hatenablog.com/entry/2018/10/12/%E3%80%90MySQL%E3%80%91%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E3%83%91%E3%83%BC%E3%83%86%E3%82%A3%E3%82%B7%E3%83%A7%E3%83%8B%E3%83%B3%E3%82%B0%E3%81%A8%E3%81%AF%E3%81%AA
