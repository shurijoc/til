pushしてcircleciの設定を確かめるのをやめる

## install

Homebrew
```
brew install circleci
```

## 使い方

### ローカルで確認する
configtest
CircleCIはローカルで検証することができます。

```
% circleci config validate .circleci/config.yml
Config file at config.yml is valid.
```

jobtest

```
circleci local execute --job build
```
