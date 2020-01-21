optionalにしていると必要になることがある。
nill safeな作りにするために必要になる

```
if let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as? SettingTableViewCell {
    cell.configure(settingTableRow: viewModel.list[indexPath.row])
} else {
    return UITableViewCell()
}
```

下記のようにも書ける

```
if let url = URL(string: "https://github.com") {
  print url
}
```
