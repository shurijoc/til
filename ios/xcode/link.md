▼ 戻るボタンのfunc

```
@IBAction func back(_ sender: Any){
  dissmiss(animated: true, completion: nil)
}
```

▼ パラメータ付き遷移
`performSegue(withIdentifier: "next", sender: nil)`
