## アプリケーション名
- game-app


## 概要
- おすすめオンラインゲームの記事を投稿できる
- 投稿された記事にコメントができる
- 投稿された記事にいいねができる
- ユーザーの登録ができる

## 本番環境
https://game-app-33967.herokuapp.com/

ログイン情報（テスト用）<br>
Email：test@test <br>
Password：111111


## 制作背景（意図）
- 私はPCオンラインゲームが好きなのですが、一番最初にPCを買うときにやりたいオンラインゲームで出来るパソコンはどれだろうかと探すのが大変だった思い出があります。色々なオンラインゲームが載っているサイトなどを見にいった時にオンラインゲームの情報は載っているのですが、おすすめのPC情報なども載っているサイトがないなと思い作りました。


## DEMO
# トップページ
![02a5fc7fd83ff2cd16bb0c4f3632c5d8](https://user-images.githubusercontent.com/77143892/109898118-0cd48800-7cd7-11eb-9b61-eb38c3823f20.jpg)
- ログインしたユーザーのみが投稿する事ができ、いいねボタンも押せます。いいねは１つの記事に付き１回までしか押せない様にしています。
- ログインしていないユーザーは、記事に遷移はできますが、いいねのボタンは表示させない様にしています。しかし、どれだけボタンが押されたかの数は、ログインしているユーザーもしていないユーザーも見れる様にしています。


# 詳細画面
![bb3a7b377822c1b5cf58c164f38b8b6b](https://user-images.githubusercontent.com/77143892/109900478-cbde7280-7cda-11eb-9a87-e9a9a41c51f2.jpg)
- 自分で投稿した記事には編集と削除のボタンが表示される様にしてます。
- 投稿した詳細画面には、投稿した内容を全部表示しています。


# コメント機能
![15b657bd632e296d851a654e1bb69f70](https://user-images.githubusercontent.com/77143892/109899713-9dac6300-7cd9-11eb-8cb0-31d7f682a021.png)
- ログインしているユーザーはコメント機能ができる様にしており、ログインしていないユーザーはログインしたらコメントができますと案内が出る様になっています。
- コメントには、送信した文章と自分のニックネームが表示される様にしてます。





## 工夫したポイント
- 投稿された記事にコメントができる
- 投稿された記事にいいねができる
- 記事を見て動画など見たくなったら動画サイトのリンクをつけた
- おすすめのパソコンサイトにいくリンクをつけた

## 使用技術（開発環境）

### バックエンド
Ruby,　Ruby on Rails

### フロントエンド
HTML, CSS

### データベース
MySQL, Sequel Pro

### ソース管理
GitHu, GitHub Desktop

### テスト
Rspec

### エディタ
VSCode

## 課題今後実装したい機能
- いいねの評価機能が同期通信で実装しているのでAjaxで実装
- 記事の検索機能を実装
- 動画を見れる様にAPIで実装
 
## DB設計

### usersテーブル

| Column                 |Type     |Options                    |
|------------------------|---------|---------------------------|
| nickname               | string  | null: false               |
| email                  | string  | null: false               |
| encrypted_password     | string  | null: false               |

### Association
- has_many :game_titles
- has_many :comments
- has_many :favorites, dependent: :destroy


### game_titles テーブル

| Column                 |Type         |Options                    |
|------------------------|-------------|---------------------------|
| gama_title             | string      | null: false               |
| game_info              | text        | null: false               |
| recommended_pc         | text        | null: false               |
| monthly_fee            | string      | null: false               |
| user                   | references  | foreign_key: true         |


### Association
- belongs_to :user
- has_many :favorites, dependent: :destroy
- has_many :comments, dependent: :destroy
  
  
### comments テーブル

| Column                 |Type         |Options                    |
|------------------------|-------------|---------------------------|
| text                   | text        | null: false               |
| user                   | references  | foreign_key: true         |
| game_title             | references  | foreign_key: true         |


### Association
- belongs_to :user
- belongs_to :game_title


### favorites テーブル

| Column                 |Type     |Options                    |
|------------------------|---------|---------------------------|
| user                   | integer |                           |
| game_title             | integer |                           |



### Association
- belongs_to :game_title
- belongs_to :user
