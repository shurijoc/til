▼ 戻るボタンのfunc

```
@IBAction func back(_ sender: Any){
  dissmiss(animated: true, completion: nil)
}
```

▼ パラメータ付き遷移

※ ViewControllerのUI上部にあるメニューの一番左のアイコンをctrl + クリックアンドドラッグで遷移先につなげる必要がある
※ nextはViewControllerのIdentify -> Storyboard IDに指定してあるもの

```
// 遷移元
@IBAction func someAction() {
  performSegue(withIdentifier: "next", sender: nil)
}

override func prepare(for segue: ......) {
  let nextVC = segue.destination as! NextViewController
  
  nextVC.count2 = count
}
