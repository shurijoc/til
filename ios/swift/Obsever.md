# Observerパターン is 何
観察される側(=Subject)と観察する側(=Observer)の2つの役割が存在し、Subjectの状態が変化した際にObserverに通知されるデザインパターンです。そのため、状態変化に応じた処理を記述する時に有効です。

どちらかというと観察よりも通知に重点が置かれており、Observerが能動的に通知を待っているのでPublish-Subscribeパターンと呼ばれることがあります。Publish(=発行)とSubscribe(=購読)という意味でこちらの方がイメージつきやすいかもしれませんね。
MVC(Model / View / Controller)アーキテクチャでいう。ModelとViewの関係性に適応される場合が多いです。

# 参考

https://qiita.com/shoheiyokoyama/items/d4b844ed29f84a80795b
