## 前提
mysql.server startが動かなくなったとき
`....... ERROR! The server quit without updating PID file (/usr/local/var/mysql/MacBookPro-2.local.pid).` みたいなエラー

## 対処法
いろいろ試す

- mysql.server restart
- `tail -f /usr/local/var/mysql/MacBookPro-2.local.err` でエラー確認
- /etc/my.cnfの編集
  - `innodb_force_recovery=4` 追加
  - `skip-grant-tables` 追加
- `/usr/local/var/mysql/` 内のファイル削除
  - localのdbデータが消えるので注意
- mysqlの入れ直し
  - `brew uninstall mysql@5.7`
  - `brew install mysql@5.7`
  - `vim ~/.bash_profile` でpath修正
- bundle/configの編集
  - `BUNDLE_BUILD__MYSQL2: "--with-mysql-config=/usr/local/opt/mysql@5.6/bin/mysql_config --with-ldflags=-L/usr/local/opt/openssl/lib --with-cppflags=-I/usr/local/opt/openssl/include"`

## skip-grant-tablesについて
mysql@5.7で `MySQL5.7でtable performance_schema.session_variables doesn't exist` てきなerrorが出たら `skip-grant-tables` か `innode_force_recovery=4` が原因の可能性があるのでそれらをコメントアウトして再インストールすると良いかもしれない
[mysql][client]に書いてあるconfigもコメントアウトした
