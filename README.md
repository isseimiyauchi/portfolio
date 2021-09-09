# アプリケーションの名前
SST(Sales Support Tool)

# なぜ作ったか
不動産の営業時代、紙媒体でのお客様情報の管理にストレスを感じていたのがきっかけです。
出先でも簡単に登録、閲覧できるように作成いたしました。

# アプリケーションの機能
## customerページ
![47623550-57E7-4266-A12A-7D8200D64F6A_1_105_c](https://user-images.githubusercontent.com/81849915/132655937-37d49f19-5c7b-4a0f-9a69-d701595b1876.jpeg)
- お客様情報の一覧、新規登録、閲覧、編集ページの実装。
- 全てのページでgeoglemapを表示し、お客様宅が表示される。
- 一覧ページでは、お客様名を検索し、絞り込める。

## postページ
![971BA87C-D06D-40F9-AC5B-0112BCE982DC_1_105_c](https://user-images.githubusercontent.com/81849915/132655613-cfa2d00b-1ff5-4137-8632-b4f0b4aa77f0.jpeg)

![91D72E45-031C-4EB1-8B03-D3014420B4B7_1_105_c](https://user-images.githubusercontent.com/81849915/132655784-a060389b-e86a-46b0-8d62-a3f71495c2de.jpeg)

![556CD1D3-44BA-4E30-9550-4061E45143A6_1_105_c](https://user-images.githubusercontent.com/81849915/132655869-2f81993e-a444-4811-bdfc-a831e07f71cb.jpeg)

- 社内ニュースの一覧、新規登録、閲覧ページの実装。
- いいね機能をつけ、誰が閲覧しているか確認できる。
- タグでグループ分けし、絞り込める。
- 記事詳細で検索でき、絞り込める。

# こだわりポイント
- 使いやすさに重きを置き、極力シンプルな作りにしました。
- postページの絞り込む手段を二つ設け、多角的に検索できるような作りにしました。

# ER図
![6F3F2648-DA58-4FDB-B521-BC593268AF96_1_105_c](https://user-images.githubusercontent.com/81849915/132639854-ad96577f-4585-44ff-a15d-94b7392ba05a.jpeg)


# 環境
### フレームワーク
Ruby on Rails
### インフラ
heroku, Docker
### データベース
Postgres

