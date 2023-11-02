特定ディレクトリのファイル名・中身・絶対pathをリスト化する方法。
GenerativeAIのレビューなどに使える。

```fish
# 出力ファイルを指定
set output_file "./output_file.txt"

# 対象のディレクトリを指定
set directory "/path/to/your/directory"

# 出力ファイルが既に存在する場合は削除
if test -f $output_file
    rm $output_file
end

# 特定のディレクトリ内のファイルを探索
find $directory -type f | while read -d "\n" file
    # ファイル名を出力ファイルに追記
    echo "ファイル名: "(basename $file) >> $output_file
    # 絶対パスを出力ファイルに追記
    echo "絶対PATH: "$file >> $output_file
    # ファイルの中身を出力ファイルに追記
    echo "内容 開始" >> $output_file
    cat $file >> $output_file
    echo "内容 終了:" >> $output_file
    echo "--------------------------------" >> $output_file
end

# 結果の出力ファイルを確認
echo "$output_file に書き出しました。"
```
