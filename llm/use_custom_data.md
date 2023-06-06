# 概要
OpenAI APIを使ったチャットボットが独自データを元に答えられるようにしたい。

## 入れたい情報
FAQなど

# TL;DR
一番実装が早そうなのでLLM用Data FrameworkのLlamaindexを使う。

# 調査
LLMをカスタマイズするためのパラダイムは主に2種類。
- LLMをFine-tuningする
- 入力プロンプトにコンテキストを埋め込む（Incontext Learning）

## 関連単語
### Incontext Learning
事前学習は変えずにプロンプトで対応するパターン

- ある程度例示したほうがaiのレスポンスが良くなる
- [プロンプトエンジニアリング](https://zenn.dev/noritamarino/articles/a2321a65fe2be8)
- Zero-shot Learning，One-shot Learning，Few-shot Learning, K-shot Learning
- Xxx-shot learning
    - 新たなタスクのトレーニングデータが非常に限られている場合、または全くない場合に特に有用。
- エンベディング(Embeddings)
- ベクトルデータベース(VectorStore)
- Data Framework
    - 独自データをレスポンスに組み込みたいときの手法Incontext Learningの補助ツール・ライブラリ
    - 仕組みについてはEmbeddingとVectorStoreがキーワード（**※1**）
    - ライブラリ
        - llamaindex
            - https://dev.classmethod.jp/articles/llamaindex-overview/
        - langchain
### fine-tuning
事前学習データを追加するパターン

- 特定のタスクのトレーニングデータが十分に存在する場合に特に有用（数百万から数千万）
- 数百万なくてもある程度の数があれば大丈夫そう・・？
- text-davinch-003でしか使えない。gpt-3.5では現状使用不可
- text-davinch-003は不便なので却下（**※2**）。

**※1** 
Embedding: ドキュメントをコンピュータが扱いやすいベクトル形式に変換すること
ベクトル形式: 文字列が数値に変換された形
ベクトル化の何が良いのか: 数値、データの相互の関連性を見出すことが重要で、その典型的な手法がベクトル化
Vector Store: ベクトル形式用のデータストア。クエリを投げると関連ドキュメントを返す。

**※2**「あなたは」とか文脈と正確な句読点が必要など、かゆいところに手が届かない。

# セキュリティリスク
- LlamaIndex はオリジナルデータを元に作成したインデックスをローカルに保存
- OpenAI はユーザがオプトインしない限り、送信したデータが学習に利用されることはない

→ 学習データがOpenAIに学習されるかどうかは有料版であれば気にしなくてOK。無料版だと学習されるので注意。
