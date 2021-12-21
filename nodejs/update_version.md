nodejsのversionをアップするスニペット

``` linux
sudo -i
curl -sL https://rpm.nodesource.com/setup_12.x | bash -
yum clean all
yum install -y nodejs
```

``` macos
brew install nodebrew
nodebrew ls
nodebrew install v17.3.0
nodebrew use v17.3.0
```
