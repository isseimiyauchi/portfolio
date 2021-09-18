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

![2D9ABD52-148C-44E3-A028-BE0FDA13BB3E_1_105_c](https://user-images.githubusercontent.com/81849915/133227754-e596c70b-e402-426f-90e0-6285607aa7b2.jpeg)

![4F66048A-BA96-4E2C-9B79-5BEB11CCA25B_1_105_c](https://user-images.githubusercontent.com/81849915/133228073-d91588d9-ddb5-482c-af37-df8434d68a29.jpeg)

![078AB90B-049D-495E-B1D0-976783C1F4CF_1_105_c](https://user-images.githubusercontent.com/81849915/133228148-424b5828-43ff-405b-8759-8c336575d64d.jpeg)

- 社内ニュースの一覧、新規登録、閲覧ページの実装。
- 記事へのコメント機能をつけ、投稿者のアイコンと名前を表示。
- いいね機能をつけ、閲覧数を確認できる。
- タグでグループ分けし、絞り込める。
- 記事詳細で検索でき、絞り込める。

# こだわりポイント
- どこでも使える営業ツールではなく、個人宅向けの不動産営業にターゲットを絞って、必要な機能をつけました。
- 社内ニュースは、いちいちメールで送られくるのが営業時代すごく嫌だったので、必要な情報をいち早く見れるよう、タグとキーワード両方で検索をかけれるようにしました。
- 社内の連絡はケースバイケースで変わっていくので、コメント機能を実装し、社内ニュースに追加で情報を加えられるよう、現場を意識して作成しました。

# ER図
![Untitled Diagram (1)](https://user-images.githubusercontent.com/81849915/133879361-6374e442-a3ca-4506-b72e-fe3984b38dae.jpg)


# 環境
### フレームワーク
Ruby on Rails
### インフラ
heroku, Docker
### データベース
Postgres

