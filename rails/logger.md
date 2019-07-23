# logの書き出し場所

下記のように書けばlogの書き出し場所は標準出力先になる

```
logger = ActiveSupport::Logger.new(STDOUT)
```
