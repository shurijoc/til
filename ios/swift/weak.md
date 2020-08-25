# weak is 何

日本語で弱参照。

```
@IBOutlet private weak var webViewContainer: UIView!
```

コードの中では上記のような使われ方をする
weakを知るにはまず `参照カウンター` を知る必要がある

## ガベージコレクション
参照カウンターをわかりやすくするために、対照となっている仕組みであるガベージコレクション（GC）の説明から

ガベージコレクションを使う場合はメモリ管理に関してプログラマーが意識する必要はなく、言語レベルで不要となったオブジェクト（ガベージ）を収集（コレクション）して定期的に開放してくれる仕組みである。
プログラマーがメモリに関して意識しないため、プログラムの生産性が高くなる傾向にある。

一方で、いつ実行されるかわからないガベージコレクションが突然実行されてCPUを占有してしまうという欠点がある。

## 参照カウンター
参照カウンター方式はガベージコレクションとは違い、自分でオブジェクトの参照数を数えていく方法である。
オブジェクトが生成された時点で参照カウンターは1になり、他のオブジェクトから参照されると2.3.4...のようにカウントアップされていく。
参照が外されるとカウントダウンしていき0になるとオブジェクトのメモリが解放される仕組みである。

objective-cでは下記コードを使用していた。
```
retain・・・参照カウンターを増やして自分のオブジェクトを返すメソッド
release・・・自分が保持しているオブジェクトの参照カウンターを一つ下げるメソッド(C言語とかだとfreeにあたる)
```

この方式はコードが複雑になればなるほど参照カウンターの管理が煩雑になりメモリリークが発生してしまう
この欠点を埋めたのがARC(Automatic Reference Counting)である。

## ARC(Automatic Reference Counting)の例
ARCではオブジェクトが解放されるタイミングで自動的にreleaseが呼び出されるため、上記のようなプログラム例ではエラーが発生しない。

## 相互参照
ただしARCを使っていても相互にオブジェクトを参照した場合はreleaseが効かなくなる

## weak
そこで出てきたのがweak(弱参照)。
参照に親子の関係がある場合は相互参照・循環参照を防ぐために `weak` をつける。

## その他
[weak self] というのもあるらしい

```
class TestClass2 {
    var testClass = TestClass()

    func sendData() {
        // 通知処理を呼び出す。ここの[self weak]がポイントになる。
        testClass.sendData({[weak self] () -> Void in
            if let _self = self {
                // 通知された処理を実行する。
            }
        })
    }
}
```

# 参考
https://qiita.com/syou007/items/51f2342850e408739cc9