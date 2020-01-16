#### 配列の値取得
配列から値を取り出すときは
viewModel.list[safe: indexPath.row]
の形でオプショナルで取得したほうがクラッシュしないので安心でっせ！

#### classなどの命名規則
SettingSectionのようにディレクトリ + 継承元のclass名

#### 複数デバイス対応
autolayoutを常に使う

#### private
基本的にはprivateつけて問題ない

#### addSubview
storyboard(xib)に設置している時点でaddSubviewはしてあるのでこれは不要だね！
