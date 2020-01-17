guardを使えば値にnilがあるかをチェックできる
https://developer.apple.com/documentation/swift/optional

```
guard
    let url = URL(string: originalUrl),
    ((try? Data(contentsOf: url)) != nil)
    else { return }
```

```
guard let url = URL(string: originalUrl) else { fatalError("Invalid url \(originalUrl)") }
```
