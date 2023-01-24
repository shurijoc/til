予めdumpファイルを用意する(dump.sql)

```sh
$ docker compose cp dump.sql db:./
$ docker-compose exec db bash
#  mysql -u root -p target_db_name < dump.sql
```
