# RxSwift is 何
Functional Reactive Programmingのフレームワーク

# 例

```
private func observeUI() {
    tableView.rx.itemSelected.asObservable()
        .bind(to: Binder(self, scheduler: ConcurrentMainScheduler.instance) { me, indexPath in
            me.dismiss(animated: true, completion: { [weak self] in
                self?.viewModel.moveToBrowser(indexPath: indexPath)
            })
        })
        .disposed(by: rx.disposeBag)
}
```

```
要素名.rx.アクション.asObservable()
    .bind(to: Binder(self, scheduler: メインorサブスレッド.instance) { me（変数名）, アクションの返り値 in
        処理
        })
    ])
    .disposed(by: rx.disposeBag)
```
